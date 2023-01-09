package com.spring.henallux.Innocent.dataAccess.repository;

import com.spring.henallux.Innocent.dataAccess.entity.OrderLineEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface OrderLineRepository extends JpaRepository<OrderLineEntity, Integer> {
    @Query("SELECT SUM((ol.unitPrice * ol.nbArticles)) FROM OrderLineEntity ol WHERE ol.orderEntity.id = ?1")
    double getTotalAmountOrder(Integer orderId);
}
