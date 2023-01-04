package com.spring.henallux.Innocent.dataAccess.entity;

import javax.persistence.*;

@Entity
@Table(name="articles")
public class ArticleEntity {
    @Id
    @Column(name="id")
    private String id;

    @Column(name="unit_price")
    private Double unitPrice;

    @Column(name="capacity")
    private String capacity;

    @Column(name="ingredients")
    private String ingredients;

    @JoinColumn(name = "category_id", referencedColumnName = "id")
    @ManyToOne
    private CategoryEntity categoryEntity;

    public ArticleEntity() {}

    public void setId(String id) {
        this.id = id;
    }

    public void setUnitPrice(Double unitPrice) {
        this.unitPrice = unitPrice;
    }

    public void setCapacity(String capacity) {
        this.capacity = capacity;
    }

    public void setIngredients(String ingredients) {
        this.ingredients = ingredients;
    }

    public void setCategory(CategoryEntity categoryEntity) {
        this.categoryEntity = categoryEntity;
    }

    public String getId() {
        return id;
    }

    public Double getUnitPrice() {
        return unitPrice;
    }

    public String getCapacity() {
        return capacity;
    }

    public String getIngredients() {
        return ingredients;
    }

    public CategoryEntity getCategory() {
        return categoryEntity;
    }
}
