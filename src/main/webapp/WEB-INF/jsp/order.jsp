<%@ page pageEncoding="UTF-8"
         contentType="text/html; charset=UTF-8"%>
<%@ include file="include/importTags.jsp"%>

<h2 class="d-block text-center text-primary fw-bold pt-2 pb-5">Détail de la commande</h2>

<section class="section-order d-flex justify-content-center">
  <div class="container py-2 mb-5">
    <div class="card py-4 px-5 mb-4 mx-auto w-75">
      <div class="card-header pb-4">
        <h3 class="h4 fw-bolder">Informations de livraison</h3>
      </div>
      <div class="card-body">
      <table class="table table-borderless mb-0">
        <tbody>
          <tr>
            <th scope="row" class="ps-0">Destinataire</th>
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

    <div class="card py-4 px-5 mb-4 mx-auto w-75">
      <div class="card-header pb-4">
        <h3 class="h4 fw-bolder">Moyen de payement</h3>
      </div>
      <div class="card-body">
        <p class="mb-0">Paypal <i class="bi bi-paypal"></i></p>
      </div>
    </div>

    <div class="card py-4 px-5 mx-auto w-75">

      <div class="card-header pb-4">
        <h3 class="h4 fw-bolder">Récapitulatif</h3>
      </div>

      <div class="card-body">
        <table class="table table-borderless align-middle">
          <thead>
          <tr>
            <th scope="col" class="ps-0">Article</th>
            <th scope="col">Prix</th>
            <th scope="col">Quantité</th>
            <th scope="col" class="pe-0">Prix total</th>
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
              <td class="pe-0">${cartItem.getTotalPrice()}€</td>
            </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
      <div class="card-footer text-center">
        <div class="d-flex justify-content-between w-100 py-1">
          <span class="fw-bold"><spring:message code="subtotal"/></span><span>${subtotal} €</span>
        </div>
        <div class="d-flex justify-content-between w-100 py-1">
          <span class="fw-bold"><spring:message code="shipping"/></span><span>3,00 €</span>
        </div>
        <div class="d-flex justify-content-between w-100 py-1">
          <span class="fw-bold">Total</span><span>${totalCost} €</span>
        </div>
        <form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post">
          <input hidden name="business" value="innocent@business.com" />
         <%-- <input hidden name="password" value="ELl8r4WHSXpWgPopT_4jxERKvbOctuHjHHRnhcRI_nSCLBi2ZhiIjWDokeGM-WhGuuzW603sDxqKEHTQ" />--%>
          <input hidden name="cert_id" value="AWiqYuUTraekdfjjwlBfn-g3GmaWSDZfROhzZvQ10EgV9Tjjd8BpmCsEDmJ20JG7ibGOWkmGkTUFMhdI" />
          <input hidden name="cmd" value="_xclick" />
          <input hidden name="amount" value="${amountToPay}" />
          <input hidden name="item_name" value="Innocent Order" />
          <input hidden name="lc" value="fr_BE" />
          <input hidden name="currency_code" value="EUR" />
          <input hidden name="return" value="http://localhost:8082/innocent/order/success" />
          <input hidden name="cancel_return" value="http://localhost:8082/innocent/cart" />
          <button type="submit" id="payBtn" class="btn btn-dark rounded-pill px-5 mt-3 mx-auto"><spring:message code="pay"/></button>
        </form>

      </div>
    </div>
  </div>
</section>