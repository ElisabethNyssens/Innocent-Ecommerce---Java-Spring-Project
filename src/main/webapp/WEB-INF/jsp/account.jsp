<%@ page pageEncoding="UTF-8"
         contentType="text/html; charset=UTF-8"%>
<%@ include file="include/importTags.jsp"%>

<h2 class="d-block text-center text-primary fw-bold pt-2 pb-5"><spring:message code="myAccount"/></h2>
<section class="section-account">
    <div class="container py-2 d-flex justify-content-center">
        <div class="nav flex-column nav-pills me-3" id="v-pills-tab" role="tablist" aria-orientation="vertical">
            <button class="nav-link link-dark active" data-bs-toggle="pill" data-bs-target="#info"><spring:message code="personalDetail"/></button>
            <button class="nav-link link-dark" data-bs-toggle="pill" data-bs-target="#orders"><spring:message code="myOrders"/></button>
            <a href="innocent/logout" class="btn btn-outline-dark rounded-pill px-5 mt-3"><spring:message code="logout"/></a>
        </div>
        <div class="tab-content card w-50 p-4">
            <div class="tab-pane fade show active" id="info" role="tabpanel"  tabindex="0">
                <div class="card-header pb-4">
                    <h3 class="h4 fw-bolder"><spring:message code="personalDetail"/></h3>
                </div>
                <div class="card-body">
                    <table class="table">
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

                </div>
            </div>
        </div>
    </div>
</section>
