<!DOCTYPE html>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
</head>
<body>
	<table style="border-spacing: 10px;">
	
	<thead>
	<tr>
	<td>Id</td>
	<td>Prenom</td>
	<td>Nom</td>
	<td>Date de naissance</td>
	<td>Code Postal</td>
	<td>Ville</td>
	<td></td>
	<td></td>
	</tr>
	</thead>
	
	<tbody>
	<c:forEach items="${ listePersonnes }" var="p" >
		<tr>
		<td> ${ p.id } </td>
		<td> ${ p.prenom } </td>
		<td> ${ p.nom } </td>
		<td> ${ p.ddn } </td>
		
		<td> ${ p.address.codePostal } </td>
		<td> ${ p.address.nomVille } </td>
		
		<td> <a href="${ pageContext.request.contextPath }/ctrl/person/load/${ p.id }">Editer</a> </td>
		<td> <a href="${ pageContext.request.contextPath }/ctrl/person/delete/${ p.id }">Supprimer</a> </td>
	
		</tr>
	</c:forEach>
	</tbody>
	</table>
	<a href="${ pageContext.request.contextPath }">Ajouter</a>
</body>
</html>
