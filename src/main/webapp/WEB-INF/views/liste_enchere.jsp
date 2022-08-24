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

		<h1>Liste des ventes</h1>


		<div id="enchere-filtre">
			<h3>Filtre</h3>
			<input type="text" placeholder="Rechercher" name="search"> <label
				for="categorie">Catégorie :<select name="categorie">
					<option value="all" selected>Toutes</option>
			</select></label> <input type="submit" value="Rechercher">
			<c:if test="${sessionScope.session_user != null}">
				<span> <input type="checkbox"
					<c:if test="${ filter == null }">checked</c:if>
					onclick="location.href = '${ pageContext.request.contextPath }/ctrl/list_enchere';">
					Liste des Ventes <input type="checkbox"
					<c:if test="${ filter != null }">checked</c:if>
					onclick="location.href = '${ pageContext.request.contextPath }/ctrl/list_enchere/${sessionScope.session_user}';">
					Mes Ventes
				</span>
			</c:if>

		</div>

		<div id="list-enchere">

			<c:if test="${ filter == null }">
				<c:forEach items="${ utilisateurs }" var="utilisateur">

					<c:forEach items="${ utilisateur.getVend() }" var="vente">
						<div class="enchere">
							<div class="enchere-img">
								<img alt="enchere_img"
									src="${ pageContext.request.contextPath }/resources/default_enchere.png">
							</div>
							<div class="enchere-info">
								<a href="#">${ vente.nomArticle }</a>
								<p>Prix : ${ vente.miseAPrix } points</p>
								<p>Fin de l'enchère : ${ vente.dateFinEncheres }</p>
								<b>Vendeur : <a href="${ pageContext.request.contextPath }/ctrl/profil/${ utilisateur.noUtilisateur }"> ${ utilisateur.pseudo } </a></b>
							</div>
						</div>
					</c:forEach>
				</c:forEach>
			</c:if>

			<c:if test="${ filter != null }">
				<c:forEach items="${ utilisateurs }" var="utilisateur">

					<c:forEach items="${ utilisateur.getVend() }" var="vente">
						<c:if test="${ utilisateur.noUtilisateur == filter }">
							<div class="enchere">
								<div class="enchere-img">
									<img alt="enchere_img"
										src="${ pageContext.request.contextPath }/resources/default_enchere.png">
								</div>
								<div class="enchere-info">
									<a href="#">${ vente.nomArticle }</a>
									<p>Prix : ${ vente.miseAPrix } points</p>
									<p>Fin de l'enchère : ${ vente.dateFinEncheres }</p>
									<b>Vendeur : <a href="${ pageContext.request.contextPath }/ctrl/profil/${ utilisateur.noUtilisateur }"> ${ utilisateur.pseudo } </a></b>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</c:forEach>
			</c:if>


		</div>

	</main>


	<script type="text/javascript"
		src="${ pageContext.request.contextPath }/js/main.js"></script>
</body>
</html>