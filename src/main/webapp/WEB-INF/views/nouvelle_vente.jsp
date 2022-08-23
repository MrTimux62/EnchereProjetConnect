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
			<form action="">
			
				<input type="text" name="" placeholder="Article">
				<textarea rows="" cols="" name="" placeholder="Description"></textarea>
				<select>
					<option></option>
				</select>
				<label>Photo article <input type="file" accept="image/png, image/jpeg"></label>
				<label>Mise à prix : <input type="number" value="0"> </label>
				<label>Début de l'enchère : <input type="date"> </label>
				<label>Fin de l'enchère : <input type="date"> </label>
				<div id="new-vente-retrait">
					<b>Retrait</b>
					<input type="text" placeholder="Rue" value="${ u.rue }">
					<input type="text" placeholder="Code Postal" value="${ u.codePostal }">
					<input type="text" placeholder="Ville" value="${ u.ville }">
				</div>
			
				<input type="submit" value="Enregister">
			
			</form>
			
			<a> <button>Annuler</button> </a>
		</div>
	</div>

</main>

<script type="text/javascript" src="${ pageContext.request.contextPath }/js/main.js"></script>
</body>
</html>