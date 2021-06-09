package com.market.demo.controller;

import com.market.demo.entity.Cliente;
import com.market.demo.service.ClienteService;
import com.market.demo.util.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/clientes")
public class ClienteController {
    
    @Autowired
    ClienteService service;
    
    @GetMapping(path= "/listado", produces = "application/json" )
    public ResponseEntity<Response> listado(){
        var result = service.listado();
        return ResponseEntity.ok(new Response<>(result,"OK"));
    }
    
    @PostMapping(path= "/registro", consumes = "application/json", produces = "application/json" )
    public ResponseEntity<Response> registro(@RequestBody Cliente cliente){
        var result = service.registro(cliente);
        return ResponseEntity.ok(new Response<>(result,"OK"));
    }
}
