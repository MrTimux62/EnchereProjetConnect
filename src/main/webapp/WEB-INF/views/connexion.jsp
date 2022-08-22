<!DOCTYPE html>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>Ench�re Projet</title>
<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/css/main.css">
</head>
<body>

<jsp:include page="header.jsp" />

<main>
<h1>Connexion</h1>

<form method="post" action="${ pageContext.request.contextPath }/ctrl/connexion">

	<input type="text" name="username">
	<input type="password" name="password">
	<input type="submit" value="Connexion">
	 <input type="checkbox" name="souvenir">
	 <label for="souvenir">Se souvenir de moi</label>
	 <a>Mot de passe oubli�</a>
</form>

</main>



<a href="${ pageContext.request.contextPath }/ctrl/inscription">Cr�e un compte</a>

<script type="text/javascript" src="${ pageContext.request.contextPath }/js/main.js"></script>
</body>
</html>