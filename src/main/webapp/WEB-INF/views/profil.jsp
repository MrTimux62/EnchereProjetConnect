<!DOCTYPE html>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Ench�re Projet</title>
<link rel="stylesheet" type="text/css"
	href="${ pageContext.request.contextPath }/css/main.css">
</head>
<body>

	<jsp:include page="header.jsp" />

	<main>

		<h3>Mes infos</h3>
		<div id="info-user">
			<table>

				<tbody>
					<tr>
						<td>Pseudo</td>
						<td><c:if test="${ empty u.pseudo }">Non renseign�</c:if> ${ u.pseudo }</td>
					</tr>
					<tr>
						<td>Nom</td>
						<td><c:if test="${ empty u.nom }">Non renseign�</c:if> ${ u.nom }</td>
					</tr>
					<tr>
						<td>Pr�nom</td>
						<td><c:if test="${ empty u.prenom }">Non renseign�</c:if> ${ u.prenom }</td>
					</tr>
					<tr>
						<td>Email</td>
						<td><c:if test="${ empty u.email }">Non renseign�</c:if> ${ u.email }</td>
					</tr>
					<tr>
						<td>T�l�phone</td>
						<td><c:if test="${ empty u.telephone }">Non renseign�</c:if>
							${ u.telephone }</td>
					</tr>
					<tr>
						<td>Rue</td>
						<td><c:if test="${ empty u.rue }">Non renseign�</c:if> ${ u.rue }</td>
					</tr>
					<tr>
						<td>Code postal</td>
						<td><c:if test="${ empty u.codePostal }">Non renseign�</c:if>
							${ u.codePostal }</td>
					</tr>
					<tr>
						<td>Ville</td>
						<td><c:if test="${ empty u.ville }">Non renseign�</c:if> ${ u.ville }</td>
					</tr>
					<tr>
						<td>Credits</td>
						<td><c:if test="${ empty u.credit }">Non renseign�</c:if> ${ u.credit }</td>
					</tr>
				</tbody>

			</table>
			<c:if test="${sessionScope.session_user == u.noUtilisateur}">
			
			<a
				href="${ pageContext.request.contextPath }/ctrl/edit_profil/${sessionScope.session_user}">Editer
				profil</a> <a
				href="${ pageContext.request.contextPath }/ctrl/deconnecter">Se
				d�connecter</a>

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