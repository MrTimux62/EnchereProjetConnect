<!DOCTYPE html>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>Enchère Projet</title>
<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/css/main.css">
</head>
<body>

<jsp:include page="header.jsp" />

<main>
<h1>Connexion</h1>

<form method="post" action="${ pageContext.request.contextPath }/ctrl/connexion">

	<input type="text" name="username" placeholder="Pseudo">
	<input type="password" name="password" placeholder="Mot de passe">
	<input type="submit" value="Connexion">
	  <label for="souvenir"><input type="checkbox" name="souvenir">
	Se souvenir de moi</label>
	 <a>Mot de passe oublié</a>
</form>
<p style="color: red">
${incorrect}
</p>
<a href="${ pageContext.request.contextPath }/ctrl/inscription">Crée un compte</a>

</main>





<script type="text/javascript" src="${ pageContext.request.contextPath }/js/main.js"></script>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>