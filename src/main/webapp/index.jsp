<!DOCTYPE html>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>Enchère Projet</title>
<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/css/main.css">
</head>
<body>

<c:if test="${sessionScope.session_user != null && sessionScope.session_user != '-1'}">
	<c:redirect url="/ctrl/list_enchere"></c:redirect>
</c:if>



<header>
	<h2>ENI-Enchères</h2>
	<c:if test="${sessionScope.session_user != null && sessionScope.session_user != '-1'}">
		<span><img alt="accueil"
			src="${ pageContext.request.contextPath }/resources/accueil.png">
			<a href="${ pageContext.request.contextPath }/ctrl/list_enchere">Accueil</a>
		</span>
	</c:if>
	<c:if test="${sessionScope.session_user == null || sessionScope.session_user == '-1'}">
		<span><img alt="accueil"
			src="${ pageContext.request.contextPath }/resources/accueil.png">
			<a href="${ pageContext.request.contextPath }">Accueil</a> </span>
	</c:if>
	<span><img alt="vente"
		src="${ pageContext.request.contextPath }/resources/vente.png">
		<a href="${ pageContext.request.contextPath }/ctrl/nouvelle_vente">Nouvelle
			Vente</a> </span>
	<c:if
		test="${sessionScope.session_user != null && sessionScope.session_user != '-1'}">
		<span> <img alt="profil"
			src="${ pageContext.request.contextPath }/resources/utilisateur.png">
			<a href="${ pageContext.request.contextPath }/ctrl/profil">Mon
				profil</a></span>
	</c:if>
	<c:if
		test="${sessionScope.session_user == null || sessionScope.session_user == '-1'}">
		<span> <img alt="connexion/inscription"
			src="${ pageContext.request.contextPath }/resources/connexion.png">
			<a href="${ pageContext.request.contextPath }/ctrl/connexion">Connexion/Inscription</a></span>
	</c:if>
</header>

<h1>Liste Enchères Sans Connexion</h1>


<script type="text/javascript" src="${ pageContext.request.contextPath }/js/main.js"></script>
</body>
</html>