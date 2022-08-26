<!DOCTYPE html>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>Enchère Projet</title>
<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/css/main.css">
</head>
<body>

<jsp:include page="header.jsp" />

<main>

	<h1>Nouvelle Vente</h1>
	
	<div id="new-vente-container">
		<div id="img-new-vente">
			<img alt="new_vente_img" src="${ pageContext.request.contextPath }/resources/default_enchere.png">
		</div>
		<div id="new-vente-info">
			<form method="post" action="${ pageContext.request.contextPath }/ctrl/nouvelle_vente/${sessionScope.session_user}">
			
				<input type="text" name="nomArticle" placeholder="Article">
				<textarea rows="" cols="" name="description" placeholder="Description"></textarea>
				<label>Catégorie :
				<select name="categorieArticle.noCategorie">
					<c:forEach items="${ categories }" var="categorie">
						<option value="${ categorie.noCategorie }">${ categorie.libelle }</option>
					</c:forEach>
				</select> 
				</label>
				
				<label>Photo article <input type="file" accept="image/png, image/jpeg" name="imgArticle_file"></label>
				<label>Mise à prix : <input type="number" value="0" name="miseAPrix"> </label>
				
				<label>Début de l'enchère : <input type="date" name="dateDebutEncheres"> </label>
				<label>Fin de l'enchère : <input type="date" name="dateFinEncheres"> </label>
				
				<div id="new-vente-retrait">
					<b>Retrait</b>
					<input type="text" placeholder="Rue" value="${ u.rue }" name="lieuRetrait.rue">
					<input type="text" placeholder="Code Postal" value="${ u.codePostal }" name="lieuRetrait.code_postal">
					<input type="text" placeholder="Ville" value="${ u.ville }" name="lieuRetrait.ville">
				</div>
				
				<input type="hidden" name="prixVente" value="0">
				<input type="hidden" name="etatVente" value="En Vente">
			
				<input type="submit" value="Enregister">
			
			</form>
			
			<a> <button>Annuler</button> </a>
		</div>
	</div>

</main>

<script type="text/javascript" src="${ pageContext.request.contextPath }/js/main.js"></script>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>