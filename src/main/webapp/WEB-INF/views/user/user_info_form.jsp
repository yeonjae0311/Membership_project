<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>user_info_form</title>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/http_request.js"></script>
	<script>
		function modify(f){
			f.action="user_info_modify_form";
			f.method="POST";
			f.submit();
		}
	
		function delete_leave(f){
			if(!confirm("정말 탈퇴하시겠습니까?")) {
				return;
			}
		
			let url = "delete_update";
			let param = {
					"m_idx": f.m_idx.value
			}
			
			sendRequest(url, param, delete_check, "POST");
	 	}
		
	 	function delete_check(...args){
	 		
	 		console.log("here")
	 		
	 		console.log(args)
	 		
			let res = args[0]["param"];
	 		
			if(res == 'fail'){
				alert("탈퇴할 수 없습니다.")
			} else{
	 			alert("탈퇴 성공")
				location.href="logout";
			}
		}
	</script>
	</head>
	<body> <!-- a태그와 location.href를 통해 깔끔하게 바꿀 예정 -->
		<form>
			<div> 이름 : ${vo.m_name }		</div>
			<div> 연락처 : ${vo.m_tel }		</div>
			<div> 생년월일 : ${vo.m_date_of_birth }</div>
			<div> 이메일 : ${vo.m_email }		</div>
			<input type="hidden" name="m_idx" value="${vo.m_idx }">
			<input type="button" name="modify_form" value="수정하기" onclick="modify(this.form)">
			<input type="button" value="회원탈퇴" onclick="delete_leave(this.form)">
		</form>
	</body>
</html>