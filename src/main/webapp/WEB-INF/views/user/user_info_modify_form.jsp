<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>user_info_modify_form</title>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/http_request.js"></script>
	<script>
	function send(f){
		f.action="user_info_modify";
		f.method="POST";
		f.submit();
	}
	</script>
</head>
<body>
	<form>
		
			<div>
				 이름 : <input name="m_name" value="${vo.m_name }" >
			</div>
			<div>
				 연락처 :  <input name="m_tel" value="${vo.m_tel }" >
			</div>
			<div>
				 생년월일<input name="m_date_of_birth" value="${vo.m_date_of_birth }">
			</div>
			<div>
					이메일<input name="m_email" value="${vo.m_email }" >
			</div>
			<div>
				 <input type="hidden" name="m_idx" value="${vo.m_idx }">
			</div>
			<div>
				<input type="button" value="수정완료" onclick="send(this.form)">
			</div>
	</form>
</body>
</html>