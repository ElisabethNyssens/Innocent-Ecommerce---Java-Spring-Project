package com.spring.henallux.Innocent.dataAccess.dao;

import com.spring.henallux.Innocent.model.Category;

import java.util.ArrayList;

public interface CategoryDataAccess {
    ArrayList<Category> getAllCategories();
    Category getCategoryByName(String name);
}
