package com.spring.henallux.Innocent.dataAccess.dao;

import com.spring.henallux.Innocent.dataAccess.repository.ArticleRepository;
import com.spring.henallux.Innocent.dataAccess.repository.ArticleTranslationRepository;
import com.spring.henallux.Innocent.dataAccess.util.ProviderConverter;
import com.spring.henallux.Innocent.model.Article;
import com.spring.henallux.Innocent.model.ArticleTranslation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.stream.Collectors;

@Service
@Transactional
public class ArticleDAO implements ArticleDataAccess {
    private ArticleRepository articleRepository;
    private ArticleTranslationRepository articleTranslationRepository;
    private ProviderConverter providerConverter;

    @Autowired
    public ArticleDAO(ArticleRepository articleRepository, ArticleTranslationRepository articleTranslationRepository, ProviderConverter providerConverter) {
        this.articleRepository = articleRepository;
        this.articleTranslationRepository = articleTranslationRepository;
        this.providerConverter = providerConverter;
    }

    public HashMap<String, Article> getArticlesByCategory(String categoryId) {
        HashMap<String,Article> articleHashMap = new HashMap<>();
        ArrayList<ArticleTranslation> articleTranslations = articleTranslationRepository
                .findArticleTranslationEntitiesByLanguageCode(LocaleContextHolder.getLocale().getLanguage()).stream()
                .map(articleTranslationEntity -> providerConverter.articleTransEntityToArticleTransModel(articleTranslationEntity))
                .collect(Collectors.toCollection(ArrayList::new));
        ArrayList<Article> articles = articleRepository
                .findArticleEntitiesByCategoryEntityId(categoryId)
                .stream().map(articleEntity -> providerConverter.articleEntityToArticleModel(articleEntity))
                .collect(Collectors.toCollection(ArrayList::new));
        for(Article article: articles) {
            String articleName = articleTranslations.stream().filter(a ->
                    a.getArticleId().equals(article.getId())).findFirst().orElse(null).getName();
            articleHashMap.put(articleName,article);
        }
        return articleHashMap;
    }

    public String getArticleNameById(String id) {
        ArticleTranslation articleTranslation = providerConverter.articleTransEntityToArticleTransModel(articleTranslationRepository.
                findArticleTranslationEntityByLanguageCodeAndArticleId(LocaleContextHolder.getLocale().getLanguage(),id));
        return articleTranslation.getName();
    }

    public Article getArticleById(String id) {
        return providerConverter.articleEntityToArticleModel(articleRepository.findArticleEntityById(id));
    }
}
