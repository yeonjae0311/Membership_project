<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>user_info_form</title>
	<script>
	
	 function leave(f){
		if(confirm("정말 탈퇴하시겠습니까?")) {
			"location.href='del.do'"
			//삭제 ajax코드필요
			alert("탈퇴완료");
		}
		
	 }
	 
		
	</script>
	</head>
	<body>
		<form>
			<table>
			<!--  첫번째 m_username : session에 담긴 자료의 자료명 -->
				<tr>
					<td colspan="5"> <input type="button" value="이름 : ${m_username.m_username }" onclick="modify()"> </td>
				</tr>
				<tr>
					<td colspan="5"> <input type="button" value="유효기간 : ${m_username.m_validdate }" onclick="modify()"> </td>
				</tr>
				<tr>
					<td colspan="5"> <input type="button" value=" 연락처 : ${m_username.m_username }" onclick="modify()"> </td>
				</tr>
				<tr>
					<td colspan="5"> <input type="button" value="회원탈퇴" onclick="leave()" > </td>
				</tr>
				<tr>
					<td colspan="5"> <input type="button" value="home" onclick="location.href='/membership/'"></td>
				</tr>
			<!--  /c:forEach-->
			</table>
		</form>
	
	</body>
</html>