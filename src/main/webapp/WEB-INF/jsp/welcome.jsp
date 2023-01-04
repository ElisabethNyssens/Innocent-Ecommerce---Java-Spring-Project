<%@ page pageEncoding="UTF-8"
         contentType="text/html; charset=UTF-8"%>
<%@ include file="include/importTags.jsp"%>

<section class="section-intro">
    <div class="intro d-flex justify-content-center align-items-start w-100 vh-100">
        <div class="d-flex flex-column justify-content-start">
            <img class="hello px-5" src="./images/innocent-hello.svg" alt="Hello"/>
            <h2 class="hello_txt fw-bold display-4 text-center">
                <span><spring:message code="welcome"/> </span><span>innocent.</span>
            </h2>
        </div>
    </div>

    <div class="decoration">
        <div class="hero_smoothie framb4"></div>
        <div class="hero_smoothie smoothie1"></div>
        <div class="hero_smoothie smoothie4"></div>
        <div class="hero_smoothie smoothie2"></div>
        <div class="hero_smoothie smoothie5"></div>
        <div class="hero_smoothie smoothie3"></div>
        <div class="hero_smoothie framb1"></div>
        <div class="hero_smoothie framb2"></div>
        <div class="hero_smoothie framb3"></div>
    </div>
</section>

<section class="section-produits min-vh-100 d-flex justify-content-center align-items-center">
    <div class="container">
        <div class="text-container">
            <h2 class="fw-bold text-primary">
                <spring:message code="homeTitle"/>
            </h2>
            <p>
                <spring:message code="homeTxt"/>
            </p>
            <a href="#produits" class="btn btn-outline-primary rounded-pill px-4">
                <spring:message code="discover"/>
            </a>
        </div>
    </div>
</section>

<section class="section-slider" id="produits">
    <div class="carousel slide carousel-fade overflow-hidden" id="monCarousel">
        <ul class="carousel-indicators my-0 mx-5 d-flex justify-content-around text-light">
            <c:forEach items="${categories}" var="category" varStatus="loop">
                <li
                    data-bs-target="#monCarousel"
                    data-bs-slide-to="${loop.index}"
                    class="${loop.index == 0 ? 'active':''}"
                >
                    <span class="h5 m-0">${category.getName()}</span>
                </li>
            </c:forEach>
        </ul>

        <div class="carousel-inner align-middle h-100">
            <c:forEach items="${categories}" var="category" varStatus="loop">
                <div class="carousel-item bg-${category.getBgColor()} d-flex justify-content-center align-content-center ${loop.index == 0 ? 'active':''}">
                    <div class="carousel-caption text-white">
                        <h3 class="title-slider display-1 fw-bold mb-4 lh-1 mx-auto">${category.getName()}</h3>
                        <a href="<spring:url value='/products/${category.getId()}' />"
                           class="btn btn-outline-light rounded-pill px-4">
                            <spring:message code="buy"/>
                        </a>
                    </div>
                    <div class="carousel-menu bg-${category.getColor()}"></div>
                </div>
            </c:forEach>
        </div>

        <a href="#monCarousel" class="carousel-control-prev ms-2" data-bs-slide="prev">
            <span class="carousel-control-prev-icon"></span>
        </a>
        <a href="#monCarousel" class="carousel-control-next me-2" data-bs-slide="next">
            <span class="carousel-control-next-icon"></span>
        </a>
    </div>
</section>
