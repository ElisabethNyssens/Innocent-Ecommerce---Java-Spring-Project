package com.spring.henallux.Innocent.dataAccess.dao;

import com.spring.henallux.Innocent.model.Order;
import com.spring.henallux.Innocent.model.OrderLine;

import java.util.ArrayList;
import java.util.List;

public interface OrderDataAccess {
    Order saveOrder(Order order, List<OrderLine> orderLines);
    double getTotalAmountOrder(Integer orderId);
    ArrayList<Order> getAllOrdersFromUser(String username);
    Order updatePaymentOrder(Integer orderId);
}
