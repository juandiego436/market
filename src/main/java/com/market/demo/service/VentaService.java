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
        Venta newVenta = new Venta();
        newVenta.setCliente(venta.getCliente());
        newVenta.setFecha(venta.getFecha());
        List<DetalleVenta> ldv = new ArrayList<>();
        for(DetalleVenta dt : venta.getDetalle()){
            DetalleVenta dtnew = new DetalleVenta();
            dtnew.setVenta(newVenta);
            dtnew.setProducto(dt.getProducto());
            dtnew.setCantidad(dt.getCantidad());
            ldv.add(dtnew);
        }
        newVenta.setDetalle(ldv);
        return repository.save(newVenta);
    }
    
    public Optional<Venta> consultaId(Long id){
        return repository.findById(id);
    }
    
    public Iterable<Venta> consultaFecha(Date fecha){
        return repository.findByFecha(fecha);
    }
}
