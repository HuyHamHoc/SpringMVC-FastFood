<%@   page pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Admin</title>
<tiles:insertAttribute name="head" />
</head>
<body>
	<div class="container">
		<header class="row">
			<h1 class="alert alert-success text-center">Quản Lý</h1>
		</header>
		<nav class="row">
			<tiles:insertAttribute name="menu" />
		</nav>
		<div class="row">
			<tiles:insertAttribute name="body" />
		</div>
	</div>
</body>
</html>