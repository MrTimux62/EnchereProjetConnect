<!DOCTYPE html>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
</head>
<body>

<h1>Insert</h1>

<form method="post" action="ctrl/person" >

	<input type="text" name="prenom" />
	<input type="text" name="nom" />
	<input type="date" name="ddn" />

	<input type="text" name="address.codePostal" />
	<input type="text" name="address.nomVille" />

	<input type="submit" />

</form>

<a href="${ pageContext.request.contextPath }/ctrl/person/">Liste</a>

</body>
</html>