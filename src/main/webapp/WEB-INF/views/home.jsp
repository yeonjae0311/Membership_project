<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function session_check(){
		
	}
</script>
</head>
<body>
	<input type="button" value="story" onclick="location.href='story'">
	<input type="button" value="board" onclick="location.href='board'">
	<input type="button" value="shop" onclick="location.href='shop'">
	<c:choose>
<<<<<<< HEAD
		<c:when test="${empty m_id}">
			<input type="button" value="로그인" onclick="location.href='login_form'">
			<input type="button" value="회원가입" onclick="location.href='member_insert_form'">
			<input type="button" value="마이페이지" onclick="location.href='login_form'">
		</c:when>
		<c:when test="${not empty m_id }">
			<input type="button" value="로그아웃" onclick="location.href='logout'">
			<input type="button" value="마이페이지" onclick="location.href='user_edit'">
=======
		<c:when test="${empty m_username}">
			<input type="button" value="로그인" onclick="location.href='login_form.do'">
			<input type="button" value="회원가입" onclick="location.href='member_insert_form.do'">
		</c:when>
		<c:when test="${not empty m_username }">
			<input type="button" value="로그아웃" onclick="location.href='logout.do'">
>>>>>>> cwh_login
		</c:when>
	</c:choose>
</body>
</html>