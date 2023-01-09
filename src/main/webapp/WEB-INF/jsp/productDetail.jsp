<%@ page pageEncoding="UTF-8"
         contentType="text/html; charset=UTF-8"%>
<%@ include file="include/importTags.jsp"%>

<section class="section-detail bg-${category.getBgColor()} text-white mt-3 mt-md-5 d-flex align-items-center position-relative">
    <a class="position-absolute top-0 ps-3 ps-md-5 py-3 py-md-4 text-white text-decoration-none" href="<spring:url value='/products/${category.getId()}' />">
        <i class="bi bi-chevron-left"></i> Tous les produits
    </a>
    <div class="container mx-auto row row-cols-1 row-cols-sm-2 h-100 d-flex flex-column justify-content-center align-items-center min-vh-100">
        <div class="position-relative col d-flex align-items-center justify-content-center h-100 px-0 py-3 my-3 my-md-0">
            <img
                class="mx-auto detail-img"
                src="../images/${category.getId()}/${article.getId()}.png"
                alt="image boisson"
            />
            <div class="position-absolute p-xl-4 w-75 d-flex align-items-center justify-content-center" style="height: 55%;">
                <img
                    class="w-100 color-circle"
                    src="../images/${category.getColor()}.png"
                    alt="color circle"
                />
            </div>
        </div>
        <div class="detail-content text-center col d-flex flex-column align-items-center justify-content-center">
            <h2 class="h1 fw-bold">${articleName}</h2>
            <p>${article.getIngredients()}</p>
            <div class="d-flex justify-content-center fs-4 fw-bold text-${category.getColor()}">
                <p class="mx-3">${article.getCapacity()}</p>
                <p class="mx-3">${article.getUnitPrice()}€</p>
            </div>
            <form:form id="addCartForm" class="d-flex align-items-end justify-content-center w-100"
                       method="post"
                       action="/innocent/cart/add/${article.getId()}"
                       modelAttribute="orderLine">
                <div class="mx-3">
                    <form:label path="nbArticles" class="form-label fs-6"><spring:message code="quantity"/></form:label>
                    <form:input class="form-control rounded-pill border-white h-auto" path="nbArticles" type="number" value="1" min="1" max="99" />
                </div>
                <form:button class="btn btn-light rounded-pill px-4 mx-3 mt-3" >
                    <spring:message code="addToCart"/>
                </form:button>
            </form:form>
        </div>
    </div>
</section>
