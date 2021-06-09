package com.market.demo.service;

import com.market.demo.entity.Cliente;
import com.market.demo.repository.ClienteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ClienteService {
    
    @Autowired
    ClienteRepository repository;

    public Cliente registro(Cliente cliente){
        return repository.save(cliente);
    }
    
    public Iterable<Cliente> listado(){
        return repository.findAll();
    }
    
}
