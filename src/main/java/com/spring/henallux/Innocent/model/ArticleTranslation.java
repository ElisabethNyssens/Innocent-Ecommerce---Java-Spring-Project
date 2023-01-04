package com.spring.henallux.Innocent.model;

public class ArticleTranslation {
    private Integer id;
    private String name;
    private String articleId;
    private String languageCode;

    public ArticleTranslation(Integer id, String name, String articleId, String languageCode) {
        setId(id);
        setName(name);
        setArticleId(articleId);
        setLanguageCode(languageCode);
    }

    public ArticleTranslation() {}

    public void setId(Integer id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setArticleId(String articleId) {
        this.articleId = articleId;
    }

    public void setLanguageCode(String languageCode) {
        this.languageCode = languageCode;
    }

    public Integer getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getArticleId() {
        return articleId;
    }

    public String getLanguageCode() {
        return languageCode;
    }
}
