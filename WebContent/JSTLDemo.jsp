<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>C out Demo</title>
</head>
<body>
	<c:out value="${45+5}" />
	<c:set var="TestMark" scope="session" value="${99}" ></c:set>
	<br/>
	<c:out value="${TestMark}"></c:out>
	<c:remove var="TestMark"/>
	<br/>
	<b>After Removal the value is <c:out value="${TestMark}"></c:out></b>
</body>
</html>