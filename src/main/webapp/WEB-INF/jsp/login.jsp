<!DOCTYPE html>
<%@ page pageEncoding="UTF-8"
         contentType="text/html; charset=UTF-8"%>
<%@ include file="include/importTags.jsp"%>

<section class="section-identification px-3 px-md-5 d-flex justify-content-center align-items-start container">
  <div class="card card-form text-center w-100 p-4">
    <div class="card-header pb-4">
      <h2 class="h4 fw-bolder">Déjà client, je m’identifie</h2>
    </div>
    <div class="card-body px-0 px-md-3">
      <form:form class="mt-3 mb-5"
                 method="post"
                 modelAttribute="user">
        <div class="mb-3 text-start">
          <form:label path="username" class="form-label"><spring:message code="username"/></form:label>
          <form:input class="form-control rounded-pill"  path="username"/>
          <form:errors path="username" cssClass="errorMsg"/>
        </div>
        <div class="mb-3 text-start">
          <form:label path="password" class="form-label"><spring:message code="password"/></form:label>
          <form:input class="form-control rounded-pill"  path="password" type="password"/>
          <form:errors path="password" cssClass="errorMsg"/>
        </div>
        <form:button type="submit" class="btn btn-dark rounded-pill px-5 mt-3"><spring:message code="sendButton"/></form:button>
        <c:if test="${error != null}">
          <div class="form-group">
            <p class="text-red fs-6"><spring:message code="credentialsError" /></p>
          </div>
        </c:if>
      </form:form>
      <p class="mb-0 fs-6">Pas encore de compte ?
        <a class="nav_link fw-bold text-primary fs-6" href="<spring:url value='/register' />">
          Créer un compte
        </a>
      </p>
    </div>
  </div>
</section>

