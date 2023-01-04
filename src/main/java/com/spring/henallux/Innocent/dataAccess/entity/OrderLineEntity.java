package com.spring.henallux.Innocent.dataAccess.entity;

import javax.persistence.*;

@Entity
@Table(name="order_lines")
public class OrderLineEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    private Integer id;

    @Column(name="unit_price")
    private double unitPrice;

    @Column(name="nb_articles")
    private Integer nbArticles;

    @JoinColumn(name = "order_id", referencedColumnName = "id")
    @ManyToOne
    private OrderEntity orderEntity;

    @JoinColumn(name = "article_id", referencedColumnName = "id")
    @ManyToOne
    private ArticleEntity articleEntity;

    public OrderLineEntity() {}

    public void setId(Integer id) {
        this.id = id;
    }

    public void setArticleEntity(ArticleEntity articleEntity) {
        this.articleEntity = articleEntity;
    }

    public void setNbArticles(Integer nbArticles) {
        this.nbArticles = nbArticles;
    }

    public void setOrderEntity(OrderEntity orderEntity) {
        this.orderEntity = orderEntity;
    }

    public void setUnitPrice(double unitPrice) {
        this.unitPrice = unitPrice;
    }

    public Integer getId() {
        return id;
    }

    public ArticleEntity getArticleEntity() {
        return articleEntity;
    }

    public Integer getNbArticles() {
        return nbArticles;
    }

    public OrderEntity getOrderEntity() {
        return orderEntity;
    }

    public double getUnitPrice() {
        return unitPrice;
    }
}

