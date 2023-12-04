<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script>
			function send_reply(f){
				let r_content = f.r_content.value.trim();
				if(r_content==''){
					alert('빈 답글은 달 수 없습니다.');
					f.r_content.focus();
					return;
				}
				
				f.method="post";
				f.action="board_reply";
				f.submit();
			}
		</script>
	</head>
	<body>
		<jsp:include page="/WEB-INF/views/login_check.jsp"/>
		<div id="id1">
			<table border="1" align="center">
				<caption>:::게시글 상세보기:::</caption>
				<tr>
					<th>제목</th>
					<td>${vo.b_title}</td>			
				</tr>
				<tr>
					<th>작성자</th>
					<td>${vo.m_username}</td>
				</tr>
				<tr>
					<th>작성일</th>
					<td>${vo.b_posted_date}</td>
				</tr>
				<!-- 관리자계정일 경우만 ip가 보이게 -->
				<c:if test="${id.m_ismaster eq '1'}">
				<tr>
					<th>ip</th>
					<td>${vo.b_ip}</td>
				</tr>
				</c:if>
				<tr>
					<td colspan="2" width="500px" height="200px">
					<c:if test="${not empty vo.b_filename and vo.b_filename ne 'no_file'}">
					<img src="${pageContext.request.contextPath}/resources/upload/${vo.b_filename}" width="200"><br>
					</c:if>				
					${vo.b_content }</td>
				</tr>
				<tr>
				<td colspan="3">
				<!-- 목록으로 -->
					<img src="resources/img2/btn_list.gif" onclick="location.href='board'">
				<!-- 답변 -->
					<img src="resources/img2/btn_reply.gif" onclick="location.href='board_reply&b_idx='${vo.b_idx}">
				<!-- 삭제 -->
					<img src="resources/img2/btn_delete.gif" onclick="del();">
				</td>
			</tr>
			</table>
		</div>
		<div id="reply_form">
			<form>
				<input type="hidden" name="b_idx" value="${vo.b_idx}">
			<table border="1">
				<tr>
					<td>
					<textarea name="r_content" width="90%"></textarea>
					</td>
				</tr>
			</table>
			<input type="button" value="답글 작성 완료" onclick="send_reply(this.form);">
		</form>
		</div>
	</body>
</html>