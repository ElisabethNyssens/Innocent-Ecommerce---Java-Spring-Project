package com.spring.henallux.Innocent.dataAccess.repository;

import com.spring.henallux.Innocent.dataAccess.entity.ArticleEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ArticleRepository extends JpaRepository<ArticleEntity,String> {
    List<ArticleEntity> findArticleEntitiesByCategoryEntityId(String categoryId);
    ArticleEntity findArticleEntityById(String id);
}

