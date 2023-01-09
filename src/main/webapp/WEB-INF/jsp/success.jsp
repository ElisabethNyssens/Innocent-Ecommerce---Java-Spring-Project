<%@ page pageEncoding="UTF-8"
         contentType="text/html; charset=UTF-8"%>
<%@ include file="include/importTags.jsp"%>

<section class="section-intro min-vh-100 d-flex justify-content-center align-items-center">
    <div class="container text-center" style="max-width: 520px">
        <div class="hello trolley d-block mx-auto w-25"></div>
        <h2 class="d-block text-primary fw-bold pt-5 pb-4"><spring:message code="thanksForOrder"/></h2>
        <p class="mt-0"><spring:message code="deliveryMessage"/></p>
        <a href="<spring:url value='/' />" class="text-primary mt-3"><spring:message code="backHome"/></a>
    </div>
</section>
