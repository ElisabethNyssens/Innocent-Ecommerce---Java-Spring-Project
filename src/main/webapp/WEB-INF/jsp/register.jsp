<!DOCTYPE html>
<%@ page pageEncoding="UTF-8"
         contentType="text/html; charset=UTF-8"%>
<%@ include file="include/importTags.jsp"%>

<section class="section-identification px-3 px-md-5 d-flex justify-content-center align-items-start container">
    <div class="card card-form text-center w-100 p-4">
        <div class="card-header pb-4">
            <h2 class="h4 fw-bolder">Je crée mon compte</h2>
        </div>
        <div class="card-body px-0 px-md-3">
            <form:form class="mt-3 mb-5"
                    id="registerForm"
                    method="post"
                    modelAttribute="newUser"
                    action="/innocent/register/send">
                <div class="mb-3 text-start">
                    <form:label path="username" class="form-label"><spring:message code="username"/>*</form:label>
                    <form:input class="form-control rounded-pill" maxlength="15" path="username"/>
                    <form:errors path="username" class="errorMsg"/>
                </div>
                <div class="mb-3 text-start">
                    <form:label path="firstname" class="form-label"><spring:message code="firstname"/>*</form:label>
                    <form:input class="form-control rounded-pill" maxlength="30" path="firstname"/>
                    <form:errors path="firstname" class="errorMsg"/>
                </div>
                <div class="mb-3 text-start">
                    <form:label path="lastname" class="form-label"><spring:message code="name"/>*</form:label>
                    <form:input class="form-control rounded-pill" maxlength="30" path="lastname"/>
                    <form:errors path="lastname" class="errorMsg"/>
                </div>
                <div class="mb-3 text-start">
                    <form:label path="email" class="form-label">Email*</form:label>
                    <form:input class="form-control rounded-pill" maxlength="30" path="email"/>
                    <form:errors path="email" class="errorMsg"/>
                </div>
                <div class="mb-3 text-start">
                    <form:label path="phoneNumber" class="form-label"><spring:message code="phoneNumber"/></form:label>
                    <form:input class="form-control rounded-pill" path="phoneNumber" maxlength="13" />
                    <form:errors path="phoneNumber" class="errorMsg"/>
                </div>
                <div class="mb-3 text-start">
                    <form:label path="address" class="form-label"><spring:message code="address"/>*</form:label>
                    <form:input class="form-control rounded-pill" maxlength="50" path="address"/>
                    <form:errors path="address" class="errorMsg"/>
                </div>
                <div class="mb-3 text-start">
                    <form:label path="password" class="form-label"><spring:message code="password"/>*</form:label>
                    <form:input class="form-control rounded-pill" maxlength="30" path="password" type="password"/>
                    <form:errors path="password" class="errorMsg"/>
                </div>
                <div class="mb-3 text-start">
                    <form:label path="confirmedPassword" class="form-label"><spring:message code="confirmPassword"/>*</form:label>
                    <form:input class="form-control rounded-pill" maxlength="30" path="confirmedPassword" type="password"/>
                    <form:errors path="password" class="errorMsg"/>
                </div>
                <form:button class="btn btn-dark rounded-pill px-5 mt-3"><spring:message code="sendButton"/></form:button>
                 <c:if test="${error != null}">
                  <div class="form-group">
                    <p class="text-red"><spring:message code="error.unexpected"/></p>
                  </div>
                </c:if>
            </form:form>
            <p class="mb-0 fs-6">Déjà un compte ?
                <a class="nav_link fw-bold text-primary fs-6" href="<spring:url value='/login' />">
                    Se connecter
                </a>
            </p>
        </div>
    </div>
</section>

