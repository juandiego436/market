package com.market.demo.controller;

import com.market.demo.entity.Venta;
import com.market.demo.service.VentaService;
import com.market.demo.util.Response;
import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/ventas")
public class VentaController {
    
    @Autowired
    VentaService service;
    
    @GetMapping(path= "/{id}", produces = "application/json" )
    public ResponseEntity<Response> consultaId(@PathVariable Long id){
        var result = service.consultaId(id);
        return ResponseEntity.ok(new Response<>(result,"OK"));
    }
    
    @GetMapping(path= "/consulta/{fecha}", produces = "application/json" )
    public ResponseEntity<Response> listado(@PathVariable Date fecha){
        var result = service.consultaFecha(fecha);
        return ResponseEntity.ok(new Response<>(result,"OK"));
    }
    
    @PostMapping(path= "/registro", consumes = "application/json", produces = "application/json" )
    public ResponseEntity<Response> registro(@RequestBody Venta venta){
        var result = service.registro(venta);
        return ResponseEntity.ok(new Response<>(result,"OK"));
    }
    
    
}
