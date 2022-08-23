<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<header>
	<h2>ENI-Enchères</h2>
	<c:if test="${sessionScope.session_user != null}">
		<span><img alt="accueil"
			src="${ pageContext.request.contextPath }/resources/accueil.png">
			<a href="${ pageContext.request.contextPath }/ctrl/list_enchere">Accueil</a>
		</span>
	</c:if>
	<c:if test="${sessionScope.session_user == null}">
		<span><img alt="accueil"
			src="${ pageContext.request.contextPath }/resources/accueil.png">
			<a href="${ pageContext.request.contextPath }">Accueil</a> </span>
	</c:if>
	<span><img alt="vente"
		src="${ pageContext.request.contextPath }/resources/vente.png">
		<a href="${ pageContext.request.contextPath }/ctrl/nouvelle_vente">Nouvelle
			Vente</a> </span>
	<c:if
		test="${sessionScope.session_user != null}">
		<span> <img alt="profil"
			src="${ pageContext.request.contextPath }/resources/utilisateur.png">
			<a href="${ pageContext.request.contextPath }/ctrl/profil/${sessionScope.session_user}">Mon
				profil</a></span>
	</c:if>
	<c:if
		test="${sessionScope.session_user == null}">
		<span> <img alt="connexion/inscription"
			src="${ pageContext.request.contextPath }/resources/connexion.png">
			<a href="${ pageContext.request.contextPath }/ctrl/connexion">Connexion/Inscription</a></span>
	</c:if>
	<c:if
		test="${sessionScope.session_admin != null}">
		<span>	<img alt="admin"
			src="${ pageContext.request.contextPath }/resources/admin.png">
			<a href="${ pageContext.request.contextPath }/ctrl/admin">Admin</a></span>
	</c:if>
</header>