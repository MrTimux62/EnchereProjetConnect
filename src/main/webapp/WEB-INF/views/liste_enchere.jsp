<!DOCTYPE html>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>Enchère Projet</title>
<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/css/main.css">
</head>
<body>

<c:if test="${sessionScope.session_user == null || sessionScope.session_user == '-1'}">
	<c:redirect url="${ pageContext.request.contextPath }"></c:redirect>
</c:if>

<jsp:include page="header.jsp" />

<main>
	
	<h1>Liste des enchères</h1>
	
	
	<div id="enchere-filtre">
		<h3>Filtre</h3>
		<input type="text" placeholder="Rechercher" name="search">
		<label for="categorie">Catégorie :<select name="categorie">
			<option value="all" selected>Toutes</option>
		</select></label>
		<input type="submit" value="Rechercher">
	</div>
	
	<div id="list-enchere">
		<div class="enchere">
			<div class="enchere-img">
				<img alt="enchere_img" src="${ pageContext.request.contextPath }/resources/default_enchere.png">
			</div>
			<div class="enchere-info">
				<a href="#" >Pc gamer pour travailler</a>
				<p>Prix : 210 points</p>
				<p>Fin de l'enchère : 30/08/2022</p>
				<b>Vendeur : Tim</b>
			</div>
		</div>
	</div>
	
</main>


<script type="text/javascript" src="${ pageContext.request.contextPath }/js/main.js"></script>
</body>
</html>