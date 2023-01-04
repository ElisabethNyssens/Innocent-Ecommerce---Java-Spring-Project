package com.spring.henallux.Innocent.dataAccess.util;

import com.spring.henallux.Innocent.dataAccess.entity.*;
import com.spring.henallux.Innocent.model.*;
import org.dozer.DozerBeanMapper;
import org.dozer.Mapper;
import org.springframework.stereotype.Component;

@Component
public class ProviderConverter {
    private Mapper mapper = new DozerBeanMapper();

    public Category CategoryEntityToCategoryModel(CategoryEntity categoryEntity) {
        return mapper.map(categoryEntity, Category.class);
    }

    public Article articleEntityToArticleModel(ArticleEntity articleEntity) {
        return mapper.map(articleEntity, Article.class);
    }

    public ArticleEntity articleModelToArticleEntity(Article article) {
        return mapper.map(article, ArticleEntity.class);
    }

    public ArticleTranslation articleTransEntityToArticleTransModel(ArticleTranslationEntity articleTranslation) {
        return mapper.map(articleTranslation, ArticleTranslation.class);
    }

    public User userEntityToUserModel(UserEntity userEntity) {
        User user = mapper.map(userEntity, User.class);
        user.setAccountNonExpired(userEntity.getAccountNonExpired());
        user.setAccountNonLocked(userEntity.getAccountNonLocked());
        user.setCredentialsNonExpired(userEntity.getCredentialsNonExpired());
        user.setEnabled(userEntity.getEnabled());
        user.setAuthorities(userEntity.getAuthorities());
        return user;
    }

    public UserEntity userModelToUserEntity(User user) {
        UserEntity userEntity = mapper.map(user, UserEntity.class);
        userEntity.setPhoneNumber(user.getPhoneNumber());
        return userEntity;
    }

    public OrderEntity orderModelToOrderEntity(Order order) {
        OrderEntity orderEntity = mapper.map(order, OrderEntity.class);
        orderEntity.setUserEntity(userModelToUserEntity(order.getUser()));
        return orderEntity;
    }

    public Order orderEntityToOrderModel(OrderEntity orderEntity) {
        Order order = mapper.map(orderEntity, Order.class);
        return order;
    }

    public OrderLineEntity orderLineModelToOrderLineEntity(OrderLine orderLine, OrderEntity orderEntity) {
        OrderLineEntity orderLineEntity = new OrderLineEntity();
        orderLineEntity.setUnitPrice(orderLine.getArticle().getUnitPrice());
        orderLineEntity.setNbArticles(orderLine.getNbArticles());
        orderLineEntity.setOrderEntity(orderEntity);
        orderLineEntity.setArticleEntity(articleModelToArticleEntity(orderLine.getArticle()));
        return orderLineEntity;
    }

}
