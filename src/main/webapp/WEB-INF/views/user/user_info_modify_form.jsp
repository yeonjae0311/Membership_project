<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>user_info_form</title>
	<script>
	function send(f){
		
		f.action = "modify_form";
		f.method = "POST";
		f.submit();
	}
	</script>
	</head>
	<body>
	<form>
		<div> 이름 : 	${id.m_name }	</div>
		<div> 아이디 : ${id.m_id }		</div>
		<div> 연락처 : ${id.m_tel  }		</div>
		<div> 생년월일 : ${id.m_date_of_birth }		</div>
		<div> 이메일 : ${id.m_email }	</div>
	<input type="button" value="수정완료" onclick="modify()">
	</form>
	</body>
</html>