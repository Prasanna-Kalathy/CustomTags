<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>C out Demo</title>
</head>
<body>
	<c:set var="TestMark" scope="session" value="${65}"></c:set>
	<br />
	<c:out value="${TestMark}"></c:out>
	<c:if test="${TestMark>60}">
		<h3>You passed the Exam: <c:out value="${TestMark}"></c:out></h3>					
	</c:if>
	<c:remove var="TestMark" />
	<br />
	<b>After Removal the value is <c:out value="${TestMark}"></c:out></b>
</body>
</html>