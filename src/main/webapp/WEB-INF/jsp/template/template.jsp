<%@ page pageEncoding="UTF-8"
         contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ include file="../include/importTags.jsp" %>

<html>
<head>
    <link type="text/css" href="<spring:url value='/css/style.css' />" rel="Stylesheet">
    <link type="text/css" href="<spring:url value='/css/responsive.css' />" rel="Stylesheet">
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
        <sec:authorize access="isAuthenticated()">
            <p class="d-block d-md-none px-3 my-0 py-2" style="background-color: rgba(var(--bs-pink-rgb), 0.1)">
                <span class="pe-1">Bonjour,</span><span class="text-primary">Elisabeth</span>
            </p>
        </sec:authorize>
        <nav class="navbar navbar-expand-md w-100 d-flex justify-content-between px-0 px-md-3 px-lg-5 pt-3 pb-3 pb-md-4">
            <button class="navbar-toggler mx-3" data-bs-toggle="collapse" data-bs-target="#navbarText">
                <span class="navbar-toggler-icon"></span>
            </button>
            <ul id="navbarText" class="nav-left mt-3 mb-0 p-3 my-md-0 p-md-0 collapse navbar-collapse">
                <li>
                    <div class="dropdown d-none d-md-block">
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
                    <div class="d-block d-md-none">
                        <p class="mt-0 mb-2">
                            <spring:message code="ourDrinks"/>
                        </p>
                        <ul class="ps-2">
                            <c:forEach items="${categories}" var="category">
                                <li>
                                    <a class="nav_link" href="<spring:url value='/products/${category.getId()}' />">
                                            ${category.getName()}
                                    </a>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </li>
                <li class="w-100 mt-2 pt-2 mt-md-0 pt-md-0"><a class="nav_link" href="<spring:url value='/about' />"><spring:message code="about"/></a></li>
            </ul>
            <a href="<spring:url value='/' />" class="navbar-brand logo-link position-absolute top-0 start-50 translate-middle-x p-0">
                <h1 class="logo mt-3">
                    Innocent
                </h1>
            </a>
            <ul class="nav-right m-3 m-md-0">
                <li class="dropdown">
                    <a class="nav_link dropdown-toggle ps-0" href="#" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="bi bi-globe2"></i>
                    </a>
                    <ul class="dropdown-menu lang">
                        <li>
                            <a href="${localeFr}" class="dropdown-item nav_link ps-2">Fr</a>
                        </li>
                        <li><a href="${localeEn}" class="dropdown-item nav_link ps-2">En</a></li>
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
                        <span class="ps-2 pe-1 d-none d-md-inline-block"><spring:message code="hello"/>,</span><span class="text-primary d-none d-md-inline-block">${pageContext.request.userPrincipal.principal.firstname}</span>
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

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</body>
</html>
