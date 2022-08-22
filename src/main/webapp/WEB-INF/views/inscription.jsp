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
<h1>Connexion</h1>

<form method="post" action="${ pageContext.request.contextPath }/ctrl/inscription">

	<input type="text" name="pseudo" placeholder="Pseudo">
	<input type="text" name="prenom" placeholder="Prénom">
	<input type="text" name="telephone" placeholder="Téléphone">
	<input type="text" name="codePostal" placeholder="Code Postal">
	<input type="password" name="motDePasse" placeholder="Mot de passe">
	<input type="text" name="nom" placeholder="Nom">
	<input type="email" name="email" placeholder="Email">
	<input type="text" name="rue" placeholder="Rue">
	<input type="text" name="ville" placeholder="Ville">
	<input type="password" name="password2" placeholder="Confirmation">
	<input type="submit" value="Créer">
</form>

<a href="${ pageContext.request.contextPath }/ctrl/connexion">Connexion</a>

</main>





<script type="text/javascript" src="${ pageContext.request.contextPath }/js/main.js"></script>
</body>
</html>