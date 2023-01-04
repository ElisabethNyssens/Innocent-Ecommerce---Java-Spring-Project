<%@ page pageEncoding="UTF-8"
         contentType="text/html; charset=UTF-8"%>
<%@ include file="include/importTags.jsp"%>

<section class="section-intro min-vh-100 d-flex justify-content-center align-items-center">
    <div class="container text-center" style="max-width: 520px">
        <img class="hello d-block mx-auto w-25 h-auto" src="../images/supermarket-trolley.png" alt="Shopping cart" />
        <h2 class="d-block text-primary fw-bold pt-5 pb-4">Merci pour votre commande !</h2>
        <p class="mt-0">Nous fesons notre possible pour qu'elle vous soit livrée dans les plus brefs délais.</p>
        <a href="<spring:url value='/' />" class="text-primary mt-3">Retour accueil</a>
    </div>
</section>
