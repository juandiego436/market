package com.market.demo.service;

import com.market.demo.entity.Producto;
import com.market.demo.repository.ProductoRepository;
import java.awt.print.Pageable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

@Service
public class ProductoService {
    
    @Autowired
    ProductoRepository repository;
    
    public Producto registro(Producto producto){
        return repository.save(producto);
    }
    
    public Page<Producto> listado(){
        PageRequest firstPageWithTwoElements = PageRequest.of(0, 2);
        return repository.findAll(firstPageWithTwoElements);
    }
    
    public Producto actualizacion(Producto producto){
        var prod = repository.findById(producto.getId());
        if(prod.isPresent()){
            Producto update = prod.get();
            update.setNombre(producto.getNombre());
            update.setPrecio(producto.getPrecio());
            
            return repository.save(update);
        }else{
            return null;
        }
    }
    
    public boolean eliminar(Long id){
        repository.deleteById(id);
        return true;
    }
}
