<%@ page pageEncoding="UTF-8"
         contentType="text/html; charset=UTF-8"%>
<%@ include file="include/importTags.jsp"%>

<h2 class="d-block text-center text-primary fw-bold pt-2 pb-5">
    ${categoryName}
</h2>
<section class="section-produits">
    <div class="container">
        <div class="text-center row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3 g-lg-5">
            <c:forEach items="${articles}" var="article">
            <div class="col">
                <a href="<spring:url value='/detail/${article.getValue().getId()}' />" class="item-link">
                    <div class="card item-card p-3">
                        <img class="card-img-top mx-auto"
                             src="../images/${categoryId}/${article.getValue().getId()}.png"
                             alt=""
                        />
                        <div class="card-body d-inline-block mx-auto">
                            <div class="d-flex justify-content-around my-1">
                                <span class="mx-2">${article.getValue().getCapacity()}</span>
                                <span class="fw-bold mx-2">${article.getValue().getUnitPrice()}€</span>
                            </div>
                            <form:form id="addToCartForm" method="post" action="/innocent/cart/add/${article.getValue().getId()}" modelAttribute="orderLine">
                                <form:button class="btn btn-dark rounded-pill px-4 mt-3" >
                                    <spring:message code="addToCart"/>
                                </form:button>
                            </form:form>
                        </div>
                    </div>
                    <p class="fw-bold">${article.getKey()}</p>
                </a>
            </div>
            </c:forEach>
        </div>
    </div>
</section>

</body>
</html>
