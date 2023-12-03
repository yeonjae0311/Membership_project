<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
//이 부분을 백으로 빼서 보안을 올려야함
function login_asking_alert() {
	alert('로그인 후 이용하실수 있습니다.');
	location.href="login_form";
}
</script>
<c:if test="${empty id}">
	<script>
		login_asking_alert();
	</script>
</c:if>