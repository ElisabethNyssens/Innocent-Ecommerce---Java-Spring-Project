package com.spring.henallux.Innocent.dataAccess.repository;

import com.spring.henallux.Innocent.dataAccess.entity.OrderEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderRepository extends JpaRepository<OrderEntity, Integer> {
}
