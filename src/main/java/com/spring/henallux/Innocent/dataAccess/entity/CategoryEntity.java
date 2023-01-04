package com.spring.henallux.Innocent.dataAccess.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="categories")
public class CategoryEntity {

    @Id
    @Column(name="id")
    private String id;

    @Column(name="name")
    private String name;

    @Column(name="bg_color")
    private String bgColor;

    @Column(name="color")
    private String color;

    public CategoryEntity() {}

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getId() {
        return id;
    }

    public void setBgColor(String bgColor) {
        this.bgColor = bgColor;
    }

    public String getBgColor() {
        return bgColor;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getColor() {
        return color;
    }
}
