package com.spring.henallux.Innocent.model;

public class Category {
    private String id;
    private String name;
    private String bgColor;
    private String color;

    public Category(String id,String name) {
        setId(id);
        setName(name);
    }

    public Category() {}

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

    public void setColor(String color) {
        this.color = color;
    }


    public String getBgColor() {
        return bgColor;
    }

    public String getColor() {
        return color;
    }

    @Override
    public boolean equals(Object o) {
        System.out.println("WESH2");
        return o instanceof Category
                && ((Category) o).getId().equals(getId())
                && ((Category) o).getName().equals(getName()) ;
    }
}
