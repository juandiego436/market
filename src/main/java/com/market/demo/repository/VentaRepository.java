package com.market.demo.repository;

import com.market.demo.entity.Venta;
import java.util.Date;
import java.util.Optional;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface VentaRepository extends CrudRepository<Venta, Long>{
    
    public Optional<Venta> findByFecha(Date fecha);
}
