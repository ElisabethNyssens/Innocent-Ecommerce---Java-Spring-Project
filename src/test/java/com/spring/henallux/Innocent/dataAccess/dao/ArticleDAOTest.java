package com.spring.henallux.Innocent.dataAccess.dao;

import com.spring.henallux.Innocent.dataAccess.entity.ArticleEntity;
import com.spring.henallux.Innocent.dataAccess.entity.ArticleTranslationEntity;
import com.spring.henallux.Innocent.dataAccess.entity.CategoryEntity;
import com.spring.henallux.Innocent.dataAccess.repository.ArticleRepository;
import com.spring.henallux.Innocent.dataAccess.repository.ArticleTranslationRepository;
import com.spring.henallux.Innocent.dataAccess.util.ProviderConverter;
import com.spring.henallux.Innocent.model.Article;
import com.spring.henallux.Innocent.model.Category;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Comparator;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.Mockito.when;

@RunWith(MockitoJUnitRunner.class)
@SpringBootTest
class ArticleDAOTest {
    private ArticleDAO articleDAO;

    @Mock
    private ArticleRepository articleRepository;

    @Mock
    private ArticleTranslationRepository articleTranslationRepository;

    @BeforeEach
    void setUp() {
        articleDAO = new ArticleDAO(articleRepository,articleTranslationRepository,new ProviderConverter());
    }

    @Test
    void getArticlesByCategory() {
        ArrayList<ArticleTranslationEntity> articleTranslations = new ArrayList<>();
        articleTranslations.add(new ArticleTranslationEntity(1,"noisette","dairynoisette","fr"));
        articleTranslations.add(new ArticleTranslationEntity(3,"amande","dairyamande","fr"));
        articleTranslations.add(new ArticleTranslationEntity(5,"coco","dairycoco","fr"));

        when(articleTranslationRepository.findArticleTranslationEntitiesByLanguageCode("fr")).thenReturn(articleTranslations);

        CategoryEntity boissonVegeEntity = new CategoryEntity("boissonsvegetales","Boissons végétales");
        ArrayList<ArticleEntity> articleEntities = new ArrayList<>();
        articleEntities.add(new ArticleEntity("dairyamande",2.48,"1 L","eau, amandes",boissonVegeEntity));
        articleEntities.add(new ArticleEntity("dairycoco",2.48,"1 L","eau, noisettes",boissonVegeEntity));
        articleEntities.add(new ArticleEntity("dairynoisette",2.48,"1 L","eau, noisettes",boissonVegeEntity));

        when(articleRepository.findArticleEntitiesByCategoryEntityId("boissonsvegetales")).thenReturn(articleEntities);

        Category boissonVege = new Category("boissonsvegetales","Boissons végétales");
        ArrayList<Article> articles = new ArrayList<>();
        articles.add(new Article("dairyamande",2.48,"1 L","eau, amandes",boissonVege));
        articles.add(new Article("dairycoco",2.48,"1 L","eau, noisettes",boissonVege));
        articles.add(new Article("dairynoisette",2.48,"1 L","eau, noisettes",boissonVege));

        Collection<Article> result = articleDAO.getArticlesByCategory("boissonsvegetales").values();
        ArrayList<Article> resultList = new ArrayList<>(result);
        resultList.sort(Comparator.comparing(a -> a.getId()));

        assertThat(resultList).isEqualTo(articles);
    }
}