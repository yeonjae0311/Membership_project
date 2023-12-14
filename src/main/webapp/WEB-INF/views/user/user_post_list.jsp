<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head  data-id="user">
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/default_css.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/user/user_post_list.js" defer></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/main.js" defer></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/http_request.js"></script>
</head>
<body>
	<div id="header_bar"></div>
	<div id="user_post_list_body_div">
		<div id="user_post_list_div">
			<div id="user_post_list_header_div">
			내가 쓴 글
			</div>
			<c:forEach var="list" items="${user_post_list}">
				<div class="user_post_one_div">
					<div id="user_post_list_title">
						<a href="board_view?b_idx=${list.b_idx}">${list.b_title}[${list.b_reply_count}]</a>
					</div>
					<div id="user_post_list_posted_date">
						${list.b_posted_date}
					</div>
				</div>
				<div class="user_post_list_hr">
				</div>
			</c:forEach>
		</div>
	</div>
	<div id="footer_bar"></div>
</body>
</html>