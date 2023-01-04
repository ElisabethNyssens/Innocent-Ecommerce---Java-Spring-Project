<%@ page pageEncoding="UTF-8"
         contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ include file="../include/importTags.jsp" %>

<html>
<head>
    <link type="text/css" href="<spring:url value='/css/style.css' />" rel="Stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/png" sizes="32x32" href="<spring:url value='/images/favicon.png' />">
    <spring:url var="localeFr" value="">
        <spring:param name="locale" value="fr" />
    </spring:url>
    <spring:url var="localeEn" value="">
        <spring:param name="locale" value="en" />
    </spring:url>
    <link href="<spring:url value='https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;700&display=swap' />"
          rel="stylesheet" />
    <link href="<spring:url value='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css' />"
          rel="stylesheet" />
    <title>${title}</title>
</head>
<body>
    <header>
        <nav class="navbar navbar-expand-md w-100 d-flex justify-content-between px-5 py-3">
            <ul class="nav-left">
                <li>
                    <div class="dropdown">
                        <a class="nav_link dropdown-toggle" href="#" data-bs-toggle="dropdown" aria-expanded="false">
                            <spring:message code="ourDrinks"/>
                        </a>
                        <ul class="dropdown-menu">
                            <c:forEach items="${categories}" var="category">
                            <li>
                                <a class="dropdown-item nav_link" href="<spring:url value='/products/${category.getId()}' />">
                                        ${category.getName()}
                                </a>
                            </li>
                            </c:forEach>
                        </ul>
                    </div>
                </li>
                <li><a class="nav_link" href="<spring:url value='/about' />"><spring:message code="about"/></a></li>
            </ul>
            <a href="<spring:url value='/' />" class="logo-link position-absolute top-0 start-50 translate-middle-x ">
                <h1 class="logo mt-3">
                    Innocent
                </h1>
            </a>
            <ul class="nav-right">
                <li class="d-flex align-items-center">
                    <ul class="lang">
                        <li>
                            <a href="${localeFr}" class="nav_link pe-1">Fr</a>
                        </li>
                        -
                        <li><a href="${localeEn}" class="nav_link ps-1">En</a></li>
                    </ul>
                </li>
                <sec:authorize access="!isAuthenticated()">
                <li class="d-flex align-items-center">
                    <a class="nav_link" href="<spring:url value='/login' />">
                        <i class="bi bi-cart3"></i>
                    </a>
                </li>
                <li class="d-flex align-items-center">
                    <a class="nav_link" href="<spring:url value='/login' />">
                        <i class="bi bi-person"></i>
                    </a>
                </li>
                </sec:authorize>
                <sec:authorize access="isAuthenticated()">
                    <li class="d-flex align-items-center">
                        <a class="nav_link position-relative" href="<spring:url value='/cart' />">
                            <i class="bi bi-cart3"></i>
                            <c:if test="${nbCartItems.getValue() > 0}">
                            <span class="cart-badge text-white position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                                ${nbCartItems.getValue()}
                            </span>
                            </c:if>
                        </a>
                    </li>
                    <li class="d-flex align-items-center">
                        <a class="nav_link" href="<spring:url value='/account' />">
                            <i class="bi bi-person"></i>
                        </a>
                        <span class="ps-2 pe-1"><spring:message code="hello"/>,</span><span class="text-primary">${pageContext.request.userPrincipal.principal.firstname}</span>
                    </li>
                </sec:authorize>
            </ul>
        </nav>
    </header>
    <main>
        <tiles:insertAttribute name="main-content" />
    </main>
    <footer class="text-center">
        <div class="credits bg-primary text-light p-2">
            <small>
                <p>
                    Ce site est un e-commerce fictif réalisé à des fins de développement
                    et n'est ni approuvé ni certifié par Innocent.
                </p>
                <p>
                    © <a href="">Elisabeth Nyssens</a> - <a href="">Henallux</a> 2022 -
                    <a href="">GitHub <i class="bi bi-github"></i></a>
                </p>
            </small>
        </div>
        <small class="footer_joke bg-white fw-bold"
        >Stop looking at my bottom</small
        >
    </footer>

    <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
            crossorigin="anonymous"
    ></script>
</body>
</html>
