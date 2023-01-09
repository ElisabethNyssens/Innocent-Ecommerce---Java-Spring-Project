package com.spring.henallux.Innocent.dataAccess.dao;

import com.spring.henallux.Innocent.dataAccess.entity.CategoryEntity;
import com.spring.henallux.Innocent.dataAccess.repository.CategoryRepository;
import com.spring.henallux.Innocent.dataAccess.util.ProviderConverter;
import com.spring.henallux.Innocent.model.Category;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.ArrayList;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.Mockito.when;

@RunWith(MockitoJUnitRunner.class)
@SpringBootTest
class CategoryDAOTest {

    private CategoryDAO categoryDAO;

    @Mock
    private CategoryRepository categoryRepository;

    @BeforeEach
    void setUp() {
        categoryDAO = new CategoryDAO(categoryRepository, new ProviderConverter());
    }

    @Test
    void getAllCategories() {
        ArrayList<CategoryEntity> categoryEntities = new ArrayList<>();
        categoryEntities.add(new CategoryEntity("boissonsvegetales","Boissons Végétales"));
        categoryEntities.add(new CategoryEntity("jus","Jus"));
        categoryEntities.add(new CategoryEntity("smoothies","Smoothies"));
        categoryEntities.add(new CategoryEntity("supersmoothies","Super smoothies"));
        when(categoryRepository.findAll()).thenReturn(categoryEntities);

        ArrayList<Category> categories = new ArrayList<>();
        categories.add(new Category("boissonsvegetales","Boissons Végétales"));
        categories.add(new Category("jus","Jus"));
        categories.add(new Category("smoothies","Smoothies"));
        categories.add(new Category("supersmoothies","Super smoothies"));

        assertThat(categoryDAO.getAllCategories()).isEqualTo(categories);
    }
}