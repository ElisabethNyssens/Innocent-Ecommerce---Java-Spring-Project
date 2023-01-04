package com.spring.henallux.Innocent.model;

public class Article {
    private String id;
    private Double unitPrice;
    private String capacity;
    private String ingredients;
    private Category category;

    public Article(String id,Double unitPrice,String capacity,String ingredients,Category category) {
        setId(id);
        setUnitPrice(unitPrice);
        setCapacity(capacity);
        setCapacity(capacity);
        setIngredients(ingredients);
        setCategory(category);
    }

    public Article() {}

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

    public void setCategory(Category category) {
        this.category = category;
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

    public Category getCategory() {
        return category;
    }
}
