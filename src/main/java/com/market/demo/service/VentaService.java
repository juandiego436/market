package com.market.demo.service;

import com.market.demo.entity.DetalleVenta;
import com.market.demo.entity.Producto;
import com.market.demo.entity.Venta;
import com.market.demo.repository.VentaRepository;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class VentaService {
    
    @Autowired
    VentaRepository repository;
    
    public Venta registro(Venta venta){
        return repository.save(venta);
    }
    
    public Optional<Venta> consultaId(Long id){
        return repository.findById(id);
    }
    
    public Optional<Venta> consultaFecha(Date fecha){
        return repository.findByFecha(fecha);
    }
}
