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

<h1>Liste Enchères Avec Connexion</h1>

<a href="${ pageContext.request.contextPath }/ctrl/utilisateur/connexion">S'inscrire - Se connecter</a>


<script type="text/javascript" src="${ pageContext.request.contextPath }/js/main.js"></script>
</body>
</html>