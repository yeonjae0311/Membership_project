<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>user_info_modify_form</title>
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
		<table>
			<tr>
				<td> <input name="m_name"> </td>
			</tr>
			<tr>
				<td> <input name="m_tel"> </td>
			</tr>
			<tr>
				<td>
					<input name="m_date_of_birth">
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
					<input name="m_email" id="m_email" >
				</td>
			</tr>
			<tr>
				<td>
					<input type="button" value="수정완료" onclick="send(this.form)">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>