package com.spring.henallux.Innocent.dataAccess.repository;

import com.spring.henallux.Innocent.dataAccess.entity.ArticleTranslationEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ArticleTranslationRepository extends JpaRepository<ArticleTranslationEntity,Integer> {
    List<ArticleTranslationEntity> findArticleTranslationEntitiesByLanguageCode(String locale);
    ArticleTranslationEntity findArticleTranslationEntityByLanguageCodeAndArticleId(String locale,String articleId);
}
