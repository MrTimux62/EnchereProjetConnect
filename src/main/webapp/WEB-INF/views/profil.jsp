<!DOCTYPE html>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Enchère Projet</title>
<link rel="stylesheet" type="text/css"
	href="${ pageContext.request.contextPath }/css/main.css">
	<link rel="stylesheet" type="text/css"
	href="${ pageContext.request.contextPath }/css/profil.css">
</head>
<body>

	<jsp:include page="header.jsp" />

	<main>

		<h3 class="text text-center"> Mes Informations</h3>
		<div id="info-user">
			<div class="container m-4">
			<table>

				<tbody>
					<tr>
						<td>Pseudo :</td>
						<td><c:if test="${ empty u.pseudo }">Non renseigné</c:if> ${ u.pseudo }</td>
					</tr>
					<tr>
						<td>Nom :</td>
						<td><c:if test="${ empty u.nom }">Non renseigné</c:if> ${ u.nom }</td>
					</tr>
					<tr>
						<td>Prénom :</td>
						<td><c:if test="${ empty u.prenom }">Non renseigné</c:if> ${ u.prenom }</td>
					</tr>
					<tr>
						<td><i class="fa-solid fa-at"></i> Email :</td>
						<td><c:if test="${ empty u.email }">Non renseigné</c:if> ${ u.email }</td>
					</tr>
					<tr>
						<td><i class="fa-solid fa-phone"></i> Téléphone : </td>
						<td><c:if test="${ empty u.telephone }">Non renseigné</c:if>
							${ u.telephone }</td>
					</tr>
					<tr>
						<td>Rue :</td>
						<td><c:if test="${ empty u.rue }">Non renseigné</c:if> ${ u.rue }</td>
					</tr>
					<tr>
						<td>Code postal :</td>
						<td><c:if test="${ empty u.codePostal }">Non renseigné</c:if>
							${ u.codePostal }</td>
					</tr>
					<tr>
						<td>Ville :</td>
						<td><c:if test="${ empty u.ville }">Non renseigné</c:if> ${ u.ville }</td>
					</tr>
				</tbody>

			</table>
			</div>
			<c:if test="${sessionScope.session_user == u.noUtilisateur}">
			
			<a
				href="${ pageContext.request.contextPath }/ctrl/edit_profil/${sessionScope.session_user}">Editer
				profil</a> <a
				href="${ pageContext.request.contextPath }/ctrl/deconnecter">Se
				déconnecter</a>

			<form method="post"
				action="${ pageContext.request.contextPath }/ctrl/delete">
				<input type="hidden" name="id" value="${sessionScope.session_user}">
				<input type="password" name="motdepasse"
					placeholder="Confirmation mot de passe"> <input
					type="submit" value="Supprimer son compte">
			</form>
			<p style="color: red">${incorrect}</p>
			<p style="color: green">${valid}</p>
			
			</c:if>
			
		</div>



	</main>

	<script type="text/javascript"
		src="${ pageContext.request.contextPath }/js/main.js"></script>
</body>
</html>