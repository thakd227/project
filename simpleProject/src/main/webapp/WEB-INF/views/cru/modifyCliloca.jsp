<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>

<script type="text/javascript"
	src="/resources/scripts/jquery-1.11.1.min.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
	/* $("submit").click(function() */
	function formSubmit() {
		var params = $("#cliloca").serialize();


		$.ajax({
			type : 'POST',
			url : '/grid/modifyCliloca',
			data : params,

			/* 			data : params2, 
			 dataType : 'json',
			 contentType : 'application/json; charset=UTF-8',  */
			/* 	        url: 'grid/clilocaUpdate',
			 type: 'POST',
			 data:params,
			 contentType: 'application/x-www-form-urlencoded; charset=UTF-8', 
			 dataType: 'html', */
			success : function(data) {

				console.log(data);
				alert("저장되었습니다.");
				opener.location.reload();
				self.close();
			},
			error : function(xhr, status, error) {
				alert("실패" + error);
			}
		});
	};
</script>



<body>
	<form id="cliloca" name="cliloca" method="post">
		<table border="1">
			<tr>
				<td>코드 : <input type="text" name="LOCA_CD" id="LOCA_CD"
					value="${LOCA_CD}" readonly>
				</td>
			</tr>
			<tr>
				<td>명칭 : <input type="text" name="LOCA_NM" id="LOCA_NM"
					value="${LOCA_NM}">
				</td>
			</tr>
			<tr>
				<td>정렬순서: <input type="text" name="ARYL_ORD" id="ARYL_ORD"
					value="${ARYL_ORD}">
				</td>
			</tr>
			<tr>
				<td>사용여부 : <input type="text" name="USE_YN" id="USE_YN"
					value="${USE_YN}">
			</tr>
		</table>
		<input type="button" value="수정" onclick="formSubmit()" />
	</form>
</body>
</html>