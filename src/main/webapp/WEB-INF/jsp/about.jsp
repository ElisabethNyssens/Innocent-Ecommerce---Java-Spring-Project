<%@ page pageEncoding="UTF-8"
         contentType="text/html; charset=UTF-8"%>
<%@ include file="include/importTags.jsp"%>

<html>
<head>
  <title>Title</title>
</head>
<body>
  <h2 class="d-block text-center text-primary fw-bold pt-2 pb-4">
    <spring:message code="aboutUs"/>
  </h2>
  <section
          class="section-debut d-flex justify-content-center align-items-center"
  >
    <!-- <div class="border-white bg-white position-absolute w-100 top-0"></div> -->
    <div class="container">
      <div class="text-container">
        <h3 class="fw-bold h2">
          <spring:message code="aboutIntroTitle"/>
        </h3>
        <p>
          Alors nos trois fondateurs ont acheté 100Kg de fruits pour
          proposer des smoothies à un festival de musique. Devant leur stand
          un panneau : « Devons-nous quitter nos jobs pour faire des
          boissons saines ? » et 2 poubelles installées devant : OUI et NON.
          Les visiteurs devaient jeter leurs gobelets dans une des 2
          poubelles. A la fin du festival, la poubelle OUI était pleine. Le
          lendemain était le premier jour du reste de notre vie.
        </p>
        <img src="./images/yes-no.png" alt="" class="yesno" />
      </div>
    </div>
  </section>
  <section class="section-nature position-relative min-vh-100 d-flex justify-content-center align-items-center">
    <div class="nature position-absolute top-0 start-0 d-flex justify-content-between">
      <img class="leaves1" src="./images/feuilles1.svg" alt="" />
      <img class="leaves2" src="./images/feuilles2.svg" alt="" />
    </div>
    <div class="container">
      <div class="text-container">
        <h3 class="display-6 fw-bold text-primary">
          On fait des petites boissons,<br />
          mais on a de grands rêves.
        </h3>
        <p>
          Comme faire tout notre possible pour rendre le monde un peu
          meilleur. Un monde où on pourrait vivre mieux et mourir vieux, sur
          une <em>planète en bonne santé</em>.
        </p>
        <p>
          C’est pour ça que nous nous sommes donnés la mission de
          <em> diminuer au maximum nos émissions de carbone </em>et de
          compenser ce qui ne peut pas être réduit en menant des projets de
          restauration et de
          <em>protection d'espaces naturels en Amazonie</em>.
        </p>
        <p>
          Nous nous sommes même engagés à atteindre la
          <em>neutralité carbone d'ici 2025</em>. Et c'est aussi pour ça
          qu’on reverse chaque année 10% de nos bénéfices à des ONG et qu’on
          ne met que des petites bonnes choses dans nos boissons.
        </p>
        <p class="mb-0">Ah, et on fait quelques blagues aussi.</p>
      </div>
    </div>
  </section>
  <section
          class="min-vh-100 bg-light d-flex justify-content-center align-items-center text-center"
  >
    <div class="container">
      <div class="text-container">
        <h2 class="display-4 fw-bold text-primary"><spring:message code="follow"/></h2>
        <p class="h4 mt-4 mb-5">
          On écrit beaucoup de bétises sur les réseaux sociaux, qui parfois
          ne concernent même pas nos produits. Suivez-nous pour voir ça,
          vous aurez 32,7% de chance de ne pas le regretter (on sait aussi
          être très sérieux).
        </p>
        <ul class="d-flex justify-content-center mt-5">
          <li>
            <a href="" class="display-5 mx-3"
            ><i class="bi bi-facebook"></i
            ></a>
          </li>
          <li>
            <a href="" class="display-5 mx-3"
            ><i class="bi bi-instagram"></i
            ></a>
          </li>
          <li>
            <a href="" class="display-5 mx-3"
            ><i class="bi bi-twitter"></i
            ></a>
          </li>
        </ul>
      </div>
    </div>
  </section>
</section>

</body>
</html>