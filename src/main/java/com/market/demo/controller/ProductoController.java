package com.market.demo.controller;

import com.market.demo.entity.Producto;
import com.market.demo.service.ProductoService;
import com.market.demo.util.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/productos")
public class ProductoController {
    
    @Autowired
    ProductoService service;
    
    @GetMapping(path= "/listado", produces = "application/json" )
    public ResponseEntity<Response> listado(){
        var result = service.listado();
        return ResponseEntity.ok(new Response<>(result,"OK"));
    }
    
    @PostMapping(path= "/registro", consumes = "application/json", produces = "application/json" )
    public ResponseEntity<Response> registro(@RequestBody Producto producto){
        var result = service.registro(producto);
        return ResponseEntity.ok(new Response<>(result,"OK"));
    }
    
    @PutMapping(path= "/actulizar", consumes = "application/json", produces = "application/json" )
    public ResponseEntity<Response> actulizar(@RequestBody Producto producto){
        var result = service.actualizacion(producto);
        if(result != null){
            return ResponseEntity.ok(new Response<>(result,"OK"));
        }
        return ResponseEntity.ok(new Response<>(null,HttpStatus.NOT_MODIFIED.toString()));
    }
    
    @DeleteMapping(path= "/{id}", produces = "application/json" )
    public ResponseEntity<Response> registro(@PathVariable Long id){
        service.eliminar(id);
        return ResponseEntity.ok(new Response<>(null,"OK"));
    }
}
