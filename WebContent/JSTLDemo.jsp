<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>C out Demo</title>
</head>
<body>
	<c:set var="TestMark" scope="session" value="${49}"></c:set>
	<br />
	<c:out value="${TestMark}"></c:out>
	<c:if test="${TestMark>60}">
		<h3>
			You passed the Exam:
			<c:out value="${TestMark}"></c:out>
		</h3>
	</c:if>

	<c:choose>
		<c:when test="${TestMark >= 80}">
			<h3>You Grade is: A</h3>
		</c:when>
		<c:when test="${TestMark >= 50 && TestMark <80}">
			<h3>You Grade is: B</h3>
		</c:when>
		<c:otherwise>
			<h3>You Grade is: Fail</h3>

		</c:otherwise>
	</c:choose>

	<%
	List<String> StdName = new ArrayList<>();
	StdName.add("Pk");
	StdName.add("Sk");
	StdName.add("Ok");
	request.setAttribute("StdName", StdName);
	%>
	<c:forEach var="i" items="${StdName}">
		<br>
		<c:out value="${i}"></c:out>
	</c:forEach>


	<c:remove var="TestMark" />
	<br />
	<b>After Removal the value is <c:out value="${TestMark}"></c:out></b>
</body>
</html>