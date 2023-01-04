<%@ page pageEncoding="UTF-8"
         contentType="text/html; charset=UTF-8"%>
<%@ include file="include/importTags.jsp"%>

<section class="bg-${category.getBgColor()} text-white mt-5 d-flex align-items-center h-100 position-relative">
    <a class="position-absolute top-0 ps-5 py-4 text-white text-decoration-none" href="<spring:url value='/products/${category.getId()}' />">
        <i class="bi bi-chevron-left"></i> Tous les produits
    </a>
    <div class="container mx-auto row row-cols-1 row-cols-sm-2 h-100">
        <div class="position-relative col d-flex align-items-center justify-content-center h-100">
            <img
                    class="mx-auto detail-img max-vh-50"
                    src="../images/${category.getId()}/${article.getId()}.png"
                    alt="image boisson"
            />
            <div class="position-absolute h-50 w-75 d-flex align-items-center justify-content-center">
                <img
                        class="w-100 color-circle"
                        src="../images/${category.getColor()}.png"
                        alt="color circle"
                />
            </div>
        </div>
        <div class="text-center col d-flex flex-column align-items-center justify-content-center">
            <h2 class="h1 fw-bold">${articleName}</h2>
            <p>${article.getIngredients()}</p>
            <div class="d-flex justify-content-center">
                <p class="mx-3">${article.getCapacity()}</p>
                <p class="mx-3">${article.getUnitPrice()}€</p>
            </div>
            <form:form id="addCartForm" method="post" action="/innocent/cart/add/${article.getId()}" modelAttribute="orderLine">
                <form:button class="btn btn-light rounded-pill px-4 mt-3" >
                    <spring:message code="addToCart"/>
                </form:button>
            </form:form>
        </div>
    </div>
</section>
