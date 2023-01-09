<%@ page pageEncoding="UTF-8"
         contentType="text/html; charset=UTF-8"%>
<%@ include file="include/importTags.jsp"%>

<h2 class="d-block text-center text-primary fw-bold pt-2 pb-3 pb-md-5"><spring:message code="myAccount"/></h2>
<section class="section-account">
    <div class="py-2 d-flex flex-column flex-md-row justify-content-center mx-sm-3 mx-md-auto" style="max-width: 960px">
        <div class="menu ms-3 ms-md-0 me-3" id="v-pills-tab">
            <div class="nav nav-pills d-flex d-md-block my-3 my-md-0" role="tablist" aria-orientation="vertical">
                <button class="nav-link link-dark active" data-bs-toggle="pill" data-bs-target="#info"><spring:message code="personalDetail"/></button>
                <button class="nav-link link-dark" data-bs-toggle="pill" data-bs-target="#orders"><spring:message code="myOrders"/></button>
            </div>
            <a href="innocent/logout" class="d-none d-md-block btn btn-outline-dark rounded-pill px-5 mt-3"><spring:message code="logout"/></a>
        </div>
        <div class="tab-content card py-4 px-3 px-md-4 mx-0">
            <div class="tab-pane fade show active" id="info" role="tabpanel"  tabindex="0">
                <div class="card-header pb-4">
                    <h3 class="h4 fw-bolder"><spring:message code="personalDetail"/></h3>
                </div>
                <div class="card-body px-0 px-md-3">
                    <table class="table mb-0">
                        <tbody>
                        <tr>
                            <th scope="row"><spring:message code="username"/></th>
                            <td>${pageContext.request.userPrincipal.principal.username}</td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="firstname"/></th>
                            <td>${pageContext.request.userPrincipal.principal.firstname}</td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="name"/></th>
                            <td>${pageContext.request.userPrincipal.principal.lastname}</td>
                        </tr>
                        <tr>
                            <th scope="row">Email</th>
                            <td>${pageContext.request.userPrincipal.principal.email}</td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="phoneNumber"/></th>
                            <td>${pageContext.request.userPrincipal.principal.phoneNumber}</td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="address"/></th>
                            <td>${pageContext.request.userPrincipal.principal.getAddressLine1()}
                                <br>${pageContext.request.userPrincipal.principal.getAddressLine2()}
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="tab-pane fade show" id="orders" role="tabpanel" tabindex="0">
                <div class="card-header pb-4">
                    <h3 class="h4 fw-bolder"><spring:message code="myOrders"/></h3>
                </div>
                <div class="card-body">
                    <c:if test="${orders.isEmpty()}">
                        <p><spring:message code="noOrderYet"/></p>
                    </c:if>
                    <c:if test="${!orders.isEmpty()}">
                        <table class="table mb-0">
                            <thead>
                            <tr>
                                <th scope="row"><spring:message code="orderNb"/></th>
                                <th scope="row">Date</th>
                                <th scope="row"><spring:message code="price"/></th>
                            </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${orders}" var="order">
                                <tr>
                                    <td>${order.getId()}</td>
                                    <td>${order.getDate().toZonedDateTime().toLocalDate().toString()}</td>
                                    <td>${String.format("%.2f", order.getTotalAmount())}€</td>
                                </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </c:if>
                </div>
            </div>
        </div>
        <a href="innocent/logout" class="d-block d-md-none mx-auto btn btn-outline-dark rounded-pill px-5 mt-4"><spring:message code="logout"/></a>
    </div>
</section>
