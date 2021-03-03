<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>

	<script type="text/javascript" src="/resources/scripts/jquery-1.11.1.min.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

qwdwqdqwdwqdq
    hello world : ${param.LOCA_CD}
    hello world : ${param}
    <br>
    <input type="text" id="cInput"><br><br>


    <br>
    zzzz :  <%= request.getParameter("LOCA_CD") %>
    zzzz :  <% request.getParameter("LOCA_CD"); %>
</body>
</html>