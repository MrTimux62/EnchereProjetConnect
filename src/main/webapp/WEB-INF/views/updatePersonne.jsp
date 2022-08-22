<!DOCTYPE html>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>Update</h1>

<form method="post" action="../update" >

	<input type="hidden" name="id" value="${ p.id }">
	<input type="text" name="prenom" value="${ p.prenom }" />
	<input type="text" name="nom" value="${ p.nom }" />
	<input type="date" name="ddn" value="${ p.ddn }" />

	<input type="text" name="address.codePostal" value="${ p.address.codePostal }" />
	<input type="text" name="address.nomVille" value="${ p.address.nomVille }" />

	<input type="submit" />

</form>

<a href="${ pageContext.request.contextPath }/ctrl/person/">Retour</a>

</body>
</html>