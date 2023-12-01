<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>user_info_form</title>
	<script>
	 function leave(){
		if(confirm("정말 탈퇴하시겠습니까?")) {
			"location.href='del'";
			//삭제 ajax코드필요
			alert("탈퇴완료");
			
			"location.href='logout'";
			"location.href='home'";
		}
	 }
	 
		
	</script>
	</head>
	<body>
		<div> 이름 : ${m_id.m_name }		</div>
		<div> 연락처 : ${m_id.m_tel }		</div>
		<div> 생년월일 : ${m_id.m_date_of_birth }		</div>
		<div> 이메일 : ${m_id.m_email }		</div>
		<input type="button" value="회원탈퇴" onclick="leave()">
	
	</body>
</html>