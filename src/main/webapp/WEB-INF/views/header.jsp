<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="bootstrap_fragment.jsp" />
  <style><%@include file="/css/main.css"%></style>

<header>


	<a href="${ pageContext.request.contextPath }/ctrl/list_enchere"><h2>ENI-Enchères <i class="fa-solid fa-euro-sign"></i></h2></a>
	<a href="${ pageContext.request.contextPath }/ctrl/list_enchere"><span><img alt="accueil"
		src="${ pageContext.request.contextPath }/resources/accueil.png">
		<i>Accueil</i>
	</span></a>
	<c:if test="${sessionScope.session_user != null}">
		<a
			href="${ pageContext.request.contextPath }/ctrl/nouvelle_vente/${sessionScope.session_user}"><span><img alt="vente"
			src="${ pageContext.request.contextPath }/resources/vente.png">
			<i>Nouvelle
				Vente </i></span></a>
	</c:if>
	<c:if test="${sessionScope.session_user != null}">
		<a
			href="${ pageContext.request.contextPath }/ctrl/profil/${sessionScope.session_user}"><span> <img alt="profil"
			src="${ pageContext.request.contextPath }/resources/utilisateur.png">
			<i>Mon
				profil</i></span></a>
	</c:if>
	<c:if test="${sessionScope.session_user == null}">
		<a href="${ pageContext.request.contextPath }/ctrl/connexion"><span> <img alt="connexion/inscription"
			src="${ pageContext.request.contextPath }/resources/connexion.png">
			<i>Connexion/Inscription</i></span></a>
	</c:if>
	<c:if test="${sessionScope.session_admin != null}">
		<a href="${ pageContext.request.contextPath }/ctrl/admin"><span> <img alt="admin"
			src="${ pageContext.request.contextPath }/resources/admin.png">
			<i>Admin</i></span></a>
	</c:if>
</header>