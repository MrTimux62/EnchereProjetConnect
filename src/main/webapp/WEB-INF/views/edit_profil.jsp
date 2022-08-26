<!DOCTYPE html>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Enchère Projet</title>
<link rel="stylesheet" type="text/css"
	href="${ pageContext.request.contextPath }/css/main.css">
	<jsp:include page="bootstrap_fragment.jsp" />
  <style><%@include file="/css/main.css"%></style>
</head>
<body>

	<c:if
		test="${sessionScope.session_user == null || sessionScope.session_user == '-1' || sessionScope.session_user != u.noUtilisateur}">
		<c:redirect url="/ctrl/list_enchere"></c:redirect>
	</c:if>

	<jsp:include page="header.jsp" />

	<main>

		<div class="text text center m-4"> Mes informations</div>

		<h5>Mon pseudo : ${ u.pseudo }</h5>

		<form method="post"
			action="${ pageContext.request.contextPath }/ctrl/edit_profil/${sessionScope.session_user}">
			<h4>Informations</h4>
			<input type="hidden" name="noUtilisateur" value="${sessionScope.session_user}">
				 <input type="text" name="prenom" placeholder="Prénom" value="${ u.prenom }"> 
				<input type="text" name="telephone" placeholder="Téléphone" value="${ u.telephone }"> 
				<input type="text" name="codePostal" placeholder="Code Postal" value="${ u.codePostal }"> 
				<input type="email" name="email" placeholder="Email" value="${ u.email }"> 
				<input type="text" name="nom" placeholder="Nom" value="${ u.nom	 }"> 
				<input type="text" name="rue" placeholder="Rue" value="${ u.rue }"> 
				<input type="text" name="ville" placeholder="Ville" value="${ u.ville }">
			<input type="submit" value="Valider">

		</form>
		
		<form method="post" action="${ pageContext.request.contextPath }/ctrl/edit_profil_mdp/${sessionScope.session_user}">
		<h4>Mot de passe</h4>
			<input type="hidden" name="noUtilisateur" value="${sessionScope.session_user}">
			<input type="password" placeholder="Ancien mot de passe" name="motDePasse">
			<input type="password" placeholder="Nouveau mot de passe" name="new_motDePasse">
			<input type="password" placeholder="Confirmation" name="new_motDePasse2">
			<input type="submit" value="Valider">
		</form>

	</main>

	<script type="text/javascript"
		src="${ pageContext.request.contextPath }/js/main.js"></script>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>