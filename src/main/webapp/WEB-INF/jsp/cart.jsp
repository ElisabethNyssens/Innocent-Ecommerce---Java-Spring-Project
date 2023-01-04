<%@ page pageEncoding="UTF-8"
         contentType="text/html; charset=UTF-8"%>
<%@ include file="include/importTags.jsp"%>

<h2 class="d-block text-center text-primary fw-bold pt-2 pb-5"><spring:message code="shoppingCart"/></h2>

<section class="section-cart d-flex justify-content-center">
  <div class="container py-2 mb-5">
    <div class="card py-4 px-5 mx-auto w-75">
      <div class="card-body">

        <c:if test="${cart.isEmpty()}">
          <p class="text-center"><spring:message code="cartEmpty"/></p>
        </c:if>
        <c:if test="${!cart.isEmpty()}">
          <c:forEach items="${cart.values()}" var="cartItem">
          <div class="cart-item px-4 py-2 mb-3 rounded-3 bg-white text-dark d-flex justify-content-between align-items-center">
            <div class="d-flex align-items-center">
              <img class="card-img-top me-3" src="./images/${cartItem.getArticle().getCategory().getId()}/${cartItem.getArticle().getId()}.png" alt=""/>
              <div class="d-flex flex-column justify-content-center">
                <span class="text-black-50 h6 m-0">${cartItem.getArticle().getCategory().getName()}</span>
                <span class="fw-bold h6 m-0">${cartItem.getArticleName()}</span>
              </div>
            </div>
            <div class="d-flex align-items-center">
              <span class="mx-3">${cartItem.getArticle().getUnitPrice()}€</span>

              <div class="d-flex align-items-center px-3">
                <form:form id="addToCartForm" method="post" action="/innocent/cart/remove/${cartItem.getArticle().getId()}" modelAttribute="orderLine" class="m-0">
                  <form:button class="cartBtn btn btn-dark rounded-pill px-1 m-0" >
                    -
                  </form:button>
                </form:form>
                <span class="mx-2">${cartItem.getNbArticles()}</span>
                <form:form id="addToCartForm" method="post" action="/innocent/cart/add/${cartItem.getArticle().getId()}" modelAttribute="orderLine"  class="m-0">
                  <form:button class="cartBtn btn btn-dark rounded-pill px-1 m-0" >
                    +
                  </form:button>
                </form:form>
              </div>
              <form:form id="addToCartForm" method="post" action="/innocent/cart/removeall/${cartItem.getArticle().getId()}" modelAttribute="orderLine"  class="m-0">
                <form:button class="btn p-0" >
                  <i class="bi bi-x-lg ms-3 fs-5"></i>
                </form:button>
              </form:form>
            </div>
          </div>
          </c:forEach>
        </c:if>
      </div>
      <c:if test="${!cart.isEmpty()}">
        <div class="card-footer d-flex justify-content-center flex-column pt-3">
          <div class="d-flex justify-content-between w-100 py-1">
            <span class="fw-bold"><spring:message code="subtotal"/></span><span>${subtotal} €</span>
          </div>
          <div class="d-flex justify-content-between w-100 py-1">
            <span class="fw-bold"><spring:message code="shipping"/></span><span>3,00 €</span>
          </div>
          <div class="d-flex justify-content-between w-100 py-1">
            <span class="fw-bold">Total</span><span>${totalCost} €</span>
          </div>
          <button id="orderBtn" class="btn btn-dark rounded-pill px-5 mt-3 mx-auto"><spring:message code="order"/></button>
        </div>
      </c:if>
    </div>
  </div>
</section>

<%-- JAVASCRIPT : confirm order handler --%>

<script>
  window.onload = () => {
    let orderBtn = document.getElementById("orderBtn");

    orderBtn.addEventListener('click', () => {
      if (window.confirm(`<spring:message code="orderConfirmation" />`)) {
        document.location = "<spring:url value='/order' />";
      }
    })
  }
</script>

