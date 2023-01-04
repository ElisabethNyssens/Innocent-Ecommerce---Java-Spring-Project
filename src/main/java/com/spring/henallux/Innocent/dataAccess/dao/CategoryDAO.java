package com.spring.henallux.Innocent.dataAccess.dao;

import com.spring.henallux.Innocent.dataAccess.entity.CategoryEntity;
import com.spring.henallux.Innocent.dataAccess.repository.CategoryRepository;
import com.spring.henallux.Innocent.dataAccess.util.ProviderConverter;
import com.spring.henallux.Innocent.model.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
@Transactional
public class CategoryDAO implements CategoryDataAccess {
    private CategoryRepository categoryRepository;
    private ProviderConverter providerConverter;

    @Autowired
    public CategoryDAO(CategoryRepository categoryRepository, ProviderConverter providerConverter) {
        this.categoryRepository = categoryRepository;
        this.providerConverter = providerConverter;
    }

    public ArrayList<Category> getAllCategories() {
        List<CategoryEntity> categoryEntities = categoryRepository.findAll();
        return categoryEntities.stream().map(categoryEntity ->
                providerConverter.CategoryEntityToCategoryModel(categoryEntity)).
                collect(Collectors.toCollection(ArrayList::new));
    }

    public Category getCategoryByName(String name) {
        return providerConverter.CategoryEntityToCategoryModel(categoryRepository.getCategoryEntityByName(name));
    }
}
