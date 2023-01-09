package com.spring.henallux.Innocent.dataAccess.dao;

import com.spring.henallux.Innocent.dataAccess.entity.OrderEntity;
import com.spring.henallux.Innocent.dataAccess.entity.UserEntity;
import com.spring.henallux.Innocent.dataAccess.repository.OrderLineRepository;
import com.spring.henallux.Innocent.dataAccess.repository.OrderRepository;
import com.spring.henallux.Innocent.dataAccess.util.ProviderConverter;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.GregorianCalendar;
import java.util.Optional;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.Mockito.when;

@RunWith(MockitoJUnitRunner.class)
@SpringBootTest
class OrderDAOTest {

    private OrderDAO orderDAO;

    @Mock
    private OrderRepository orderRepository;
    @Mock
    private OrderLineRepository orderLineRepository;

    @BeforeEach
    void setUp() {
        orderDAO = new OrderDAO(orderRepository,orderLineRepository,new ProviderConverter());
    }

    @Test
    void updatePaymentOrder() {
        OrderEntity orderEntity = new OrderEntity(1, new GregorianCalendar(),false, new UserEntity());

        when(orderRepository.findById(1)).thenReturn(Optional.of(orderEntity));

        assertThat(orderDAO.updatePaymentOrder(1).getPaid()).isEqualTo(true);
    }
}
