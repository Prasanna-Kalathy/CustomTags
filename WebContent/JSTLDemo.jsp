<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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

	<c:set var="accbal" value="12344.658954"></c:set>
	
	<fmt:parseNumber var="accbalNo" type="number" value="${accbal}" />
	<p> Amount is: <c:out value="${accbalNo}"/></p>
	<p>Formatted Number 1:<fmt:formatNumber value="${accbalNo}" type="currency"/></p>
	<p>Formatted Number 2:<fmt:formatNumber value="${accbalNo}" type="number"/></p>
	<p>Formatted Number 3:<fmt:formatNumber value="${accbalNo}" type="number" maxFractionDigits="2"/></p>
	<p>Formatted Number 4:<fmt:formatNumber value="${accbalNo}" type="number" maxIntegerDigits="2"/></p>
	<p>Formatted Number 5:<fmt:formatNumber value="${accbalNo}" type="percent"/></p>
	<p>Formatted Number 5:<fmt:formatNumber value="${accbalNo}" type="number" pattern="Rs###.##"/></p>
	
	<c:set var="mydate" value="12-05-2004"/>
	<fmt:parseDate var="prsdate" value="${mydate}" pattern="dd-mm-yyyy"/>
	<p>Parsed Date: <c:out value="${prsdate}"/>
	<c:remove var="TestMark" />
	<br />
	<b>After Removal the value is <c:out value="${TestMark}"></c:out></b>

</body>
</html>