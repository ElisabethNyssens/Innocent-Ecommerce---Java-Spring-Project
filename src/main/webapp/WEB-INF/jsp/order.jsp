<%@ page pageEncoding="UTF-8"
         contentType="text/html; charset=UTF-8"%>
<%@ include file="include/importTags.jsp"%>

<h2 class="d-block text-center text-primary fw-bold pt-2 pb-4 pb-md-5"><spring:message code="orderDetail"/></h2>

<section class="section-order d-flex justify-content-center">
  <div class="container py-2 mb-4 mb-md-5">
    <div class="card py-4 px-3 px-md-5 mb-4 mx-auto">
      <div class="card-header pb-4">
        <h3 class="h4 fw-bolder"><spring:message code="shippingInfo"/></h3>
      </div>
      <div class="card-body px-0 px-md-3">
      <table class="table table-borderless mb-0">
        <tbody>
          <tr>
            <th scope="row" class="ps-0"><spring:message code="recipient"/></th>
            <td>${pageContext.request.userPrincipal.principal.firstname} ${pageContext.request.userPrincipal.principal.lastname}</td>
          </tr>
          <tr>
            <th scope="row" class="ps-0"><spring:message code="address"/></th>
            <td>${pageContext.request.userPrincipal.principal.getAddressLine1()}
              <br>${pageContext.request.userPrincipal.principal.getAddressLine2()}
            </td>
          </tr>
        </tbody>
      </table>
      </div>
    </div>

    <div class="card py-4 px-3 px-md-5 mb-4 mx-auto">
      <div class="card-header pb-4">
        <h3 class="h4 fw-bolder"><spring:message code="paymentMethod"/></h3>
      </div>
      <div class="card-body px-0 px-md-3">
        <p class="mb-0"><i class="bi bi-paypal"></i> Paypal</p>
      </div>
    </div>

    <div class="card py-4 px-3 px-md-5 mx-auto">

      <div class="card-header pb-4">
        <h3 class="h4 fw-bolder"><spring:message code="summary"/></h3>
      </div>

      <div class="card-body px-0 px-md-3">
        <table class="table table-borderless align-middle">
          <thead>
          <tr>
            <th scope="col" class="ps-0">Article</th>
            <th scope="col"><spring:message code="price"/></th>
            <th scope="col"><spring:message code="quantity"/></th>
            <th scope="col" class="pe-0"><spring:message code="totalPrice"/></th>
          </tr>
          </thead>
          <tbody>
            <c:forEach items="${cart.values()}" var="cartItem">
            <tr>
              <td class="d-flex flex-column ps-0">
                <span class="text-black-50 fs-6 m-0">${cartItem.getArticle().getCategory().getName()}</span>
                <span class="fs-6 m-0">${cartItem.getArticleName()}</span>
              </td>
              <td>${cartItem.getArticle().getUnitPrice()}€</td>
              <td>${cartItem.getNbArticles()}</td>
              <td class="pe-0">${String.format("%.2f", cartItem.getTotalPrice())}€</td>
            </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
      <div class="card-footer text-center pt-3 px-0 px-md-3">
        <div class="d-flex justify-content-between w-100 py-1">
          <span class="fw-bold"><spring:message code="subtotal"/></span><span>${String.format("%.2f", subtotal)} €</span>
        </div>
        <div class="d-flex justify-content-between w-100 py-1">
          <span class="fw-bold"><spring:message code="shipping"/></span><span>0,00 €</span>
        </div>
        <div class="d-flex justify-content-between w-100 py-1">
          <span class="fw-bold">Total</span><span>${String.format("%.2f", subtotal)} €</span>
        </div>
        <form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post" class="mb-0">
          <input hidden name="business" value="innocent@business.com" />
         <%-- <input hidden name="password" value="ELl8r4WHSXpWgPopT_4jxERKvbOctuHjHHRnhcRI_nSCLBi2ZhiIjWDokeGM-WhGuuzW603sDxqKEHTQ" />--%>
          <input hidden name="cert_id" value="AWiqYuUTraekdfjjwlBfn-g3GmaWSDZfROhzZvQ10EgV9Tjjd8BpmCsEDmJ20JG7ibGOWkmGkTUFMhdI" />
          <input hidden name="cmd" value="_xclick" />
          <input hidden name="amount" value="${subtotal}" />
          <input hidden name="item_name" value="Innocent Order" />
          <input hidden name="lc" value="fr_BE" />
          <input hidden name="currency_code" value="EUR" />
          <input hidden name="return" value="http://localhost:8082/innocent/order/success/${orderId}/" />
          <input hidden name="cancel_return" value="http://localhost:8082/innocent/cart" />
          <button type="submit" id="payBtn" class="btn btn-dark rounded-pill px-5 mt-3 mx-auto"><spring:message code="pay"/></button>
        </form>

      </div>
    </div>
  </div>
</section>