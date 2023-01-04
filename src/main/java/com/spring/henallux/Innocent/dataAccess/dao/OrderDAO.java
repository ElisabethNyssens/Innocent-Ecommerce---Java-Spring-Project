package com.spring.henallux.Innocent.dataAccess.dao;

import com.spring.henallux.Innocent.dataAccess.entity.OrderEntity;
import com.spring.henallux.Innocent.dataAccess.entity.OrderLineEntity;
import com.spring.henallux.Innocent.dataAccess.repository.OrderLineRepository;
import com.spring.henallux.Innocent.dataAccess.repository.OrderRepository;
import com.spring.henallux.Innocent.dataAccess.util.ProviderConverter;
import com.spring.henallux.Innocent.model.Order;
import com.spring.henallux.Innocent.model.OrderLine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
@Transactional
public class OrderDAO implements OrderDataAccess {
    private OrderRepository orderRepository;
    private OrderLineRepository orderLineRepository;
    private ProviderConverter providerConverter;

    @Autowired
    public OrderDAO(OrderRepository orderRepository, OrderLineRepository orderLineRepository, ProviderConverter providerConverter) {
        this.orderRepository = orderRepository;
        this.orderLineRepository = orderLineRepository;
        this.providerConverter = providerConverter;
    }

    @Transactional
    public Order saveOrder(Order order, List<OrderLine> orderLines) {
        OrderEntity orderEntity = providerConverter.orderModelToOrderEntity(order);
        System.out.println("COMMANDE :");
        System.out.println(orderEntity.getDate().toZonedDateTime().toLocalDate().toString());

        List<OrderLineEntity> orderLineEntities = orderLines.stream()
                .map(orderLine -> providerConverter.orderLineModelToOrderLineEntity(orderLine,orderEntity))
                .collect(Collectors.toCollection(ArrayList::new));
        orderRepository.save(orderEntity);
        orderLineRepository.saveAll(orderLineEntities);

        return providerConverter.orderEntityToOrderModel(orderEntity);
    }
}
