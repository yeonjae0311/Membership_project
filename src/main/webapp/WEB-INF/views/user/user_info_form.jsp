<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>user_info_form</title>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
	<script>
	function modify(f){
		f.action="user_info_modify_form";
		f.method="POST";
		f.submit();
	}
	
	 function leave(f){
		if(!confirm("정말 탈퇴하시겠습니까?")) {
			return;
		}
		
		let url = "del";
		let param = "m_idx="+${id.m_idx};
		
		sendRequest(url,param,del_check,"POST");
	 }
	 
	 function del_check(){
		let res = args[0].param;
			
		let form = document.getElementsByTagName("form")[0];
		} 
	</script>
	</head>
	<body> <!-- a태그와 location.href를 통해 깔끔하게 바꿀 예정 -->
		<form>
			<div> 이름 : ${id.m_name }		</div>
			<div> 아이디 : ${id.m_id }		</div>
			<div> 연락처 : ${id.m_tel }		</div>
			<div> 생년월일 : ${id.m_date_of_birth } </div>		
			<div> 이메일 : ${id.m_email }		</div>
			<input type="hidden" name="m_idx" value="${id.m_idx }">
			<input type="button" name="modify_form" value="수정하기" onclick="modify(this.form)">
			<input type="button" value="회원탈퇴" onclick="leave(this.form)">
		</form>
	</body>
</html>