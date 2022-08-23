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

	<c:if
		test="${sessionScope.session_user == null || sessionScope.session_user == '-1' || sessionScope.session_user != u.noUtilisateur}">
		<c:redirect url="/ctrl/list_enchere"></c:redirect>
	</c:if>

	<jsp:include page="header.jsp" />

	<main>

		<h3>Mes infos</h3>

		<h4>Mon pseudo : ${ u.pseudo }</h4>

		<form method="post"
			action="${ pageContext.request.contextPath }/ctrl/edit_profil/${sessionScope.session_user}">

			<input type="hidden" name="noUtilisateur" value="${sessionScope.session_user}">
				 <input type="text" name="prenom" placeholder="Prénom" value="${ u.prenom }"> 
				<input type="text" name="telephone" placeholder="Téléphone" value="${ u.telephone }"> 
				<input type="text" name="codePostal" placeholder="Code Postal" value="${ u.codePostal }"> 
				<input type="email" name="email" placeholder="Email" value="${ u.email }"> 
				<input type="text" name="nom" placeholder="Nom" value="${ u.nom	 }"> 
				<input type="text" name="rue" placeholder="Rue" value="${ u.rue }"> 
				<input type="text" name="ville" placeholder="Ville" value="${ u.ville }">
			<input type="submit" value="Enregistrée">

		</form>

	</main>

	<script type="text/javascript"
		src="${ pageContext.request.contextPath }/js/main.js"></script>
</body>
</html>