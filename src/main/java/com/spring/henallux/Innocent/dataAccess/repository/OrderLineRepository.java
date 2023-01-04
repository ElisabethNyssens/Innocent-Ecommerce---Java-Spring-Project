package com.spring.henallux.Innocent.dataAccess.repository;

import com.spring.henallux.Innocent.dataAccess.entity.OrderLineEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderLineRepository extends JpaRepository<OrderLineEntity, Integer> {
}
