package com.spring.henallux.Innocent.dataAccess.dao;

import com.spring.henallux.Innocent.model.Article;

import java.util.HashMap;

public interface ArticleDataAccess {
    HashMap<String,Article> getArticlesByCategory(String categoryId);
    Article getArticleById(String id);
    String getArticleNameById(String id);
}
