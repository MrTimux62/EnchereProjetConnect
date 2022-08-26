<!DOCTYPE html>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Enchère Projet</title>
<link rel="stylesheet" type="text/css"
	href="${ pageContext.request.contextPath }/css/main.css">
</head>
<body>

	<jsp:include page="header.jsp" />

	<main>

		<h1>Nouvelle Vente</h1>

		<div id="new-vente-container">
			<div id="img-new-vente">
				<img alt="new_vente_img"
					src="${ pageContext.request.contextPath }/resources/default_enchere.png">
			</div>
			<div id="new-vente-info">

				<h4>${ vente.nomArticle }</h4>

				<p>
					Description : <br> ${vente.description }
				</p>

				<p>Catégorie ${ vente.categorieArticle.libelle }</p>
				<p>
					Meilleure offre:
					<c:if test="${ vente.prixVente != 0 }"> ${ vente.prixVente } par ${ enchere_user } </c:if>
					<c:if test="${ vente.prixVente == 0 }">Aucune</c:if>
				</p>
				<p>Mise à prix: ${ vente.miseAPrix }</p>
				<p>Fin de l'enchère: ${ vente.dateFinEncheres }</p>
				<p>
					Retrait: ${ vente.lieuRetrait.rue } <br> ${ vente.lieuRetrait.code_postal }
					${ vente.lieuRetrait.ville }
				</p>
				<p>Vendeur: ${ u.pseudo }</p>
				<form method="post"
					action="${ pageContext.request.contextPath }/ctrl/enchere/${sessionScope.session_user}">
					<input type="hidden" name="id_article" value="${ vente.noArticle }">
					<p>
						Ma proposition: <input type="number" name="prixVente" value="">
						<input type="submit" value="Enchérir">
					</p>
					<p style="color: red">${incorrect}</p>
				</form>



			</div>
		</div>

	</main>





	<script type="text/javascript"
		src="${ pageContext.request.contextPath }/js/main.js"></script>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>