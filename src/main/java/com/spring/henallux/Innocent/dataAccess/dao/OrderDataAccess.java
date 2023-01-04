package com.spring.henallux.Innocent.dataAccess.dao;

import com.spring.henallux.Innocent.model.Order;
import com.spring.henallux.Innocent.model.OrderLine;

import java.util.List;

public interface OrderDataAccess {
    Order saveOrder(Order order, List<OrderLine> orderLines);
}
