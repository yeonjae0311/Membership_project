<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="${pageContext.request.contextPath}/resources/js/http_request.js"> </script>
	<script>
		let b_isliked;
		if('${vo.b_isliked}' == '1'){
			b_isliked = '1';
		}else{
			b_isliked = '0';
		}
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
		
		function delete_board_post(){
			let m_idx = '${id.m_idx}';
			let b_idx = '${vo.b_idx}';
			
			let url = "delete_board_post";
			
		   	const param = {
                "m_idx": encodeURIComponent(m_idx),
                "b_idx": encodeURIComponent(b_idx)
            };			
			
			sendRequest(url,param,resultFn,'post');
		}
		function resultFn(...args){
			let res = args[0].res;
			if(res == 'success'){
				alert('게시글 삭제 성공');
				location.href='board';
			}else{
				alert('글 삭제 권한이 없습니다.');
			}
		}
		function board_like(b_idx){
			let b_idx = b_idx;
		}
		function board_dislike(b_idx){
			
		}
	    </script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/login_check.jsp" />
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
			<tr>
				<th>조회수</th>
				<td>${vo.b_read_hit}</td>
			</tr>
			<tr>
				<th>좋아요 !</th>
				<td>${vo.b_like_count}</td>
				<td>
					<c:choose>
						<c:when test="${vo.b_isliked eq '0'}">
							<input type="button" value="좋아요" onclick="board_like('${vo.b_idx}')">
						</c:when>
						<c:when test="${vo.b_isliked eq '1'}">
							<input type="button" value="좋아요 해제" onclick="board_dislike('${vo.b_idx}')">
						</c:when>
					</c:choose>
				</td>
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
						<img src="${pageContext.request.contextPath}/resources/upload/board/${vo.b_filename}" width="200">
						<br>
					</c:if>
					${vo.b_content }
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<!-- 목록으로 -->
					<img src="resources/img2/btn_list.gif" onclick="location.href='board'">
					<!-- 답변 -->
					<%-- <img src="resources/img2/btn_reply.gif" onclick="location.href='board_reply&b_idx='${vo.b_idx}"> --%>
					<!-- 삭제 -->
					<img src="resources/img2/btn_delete.gif" onclick="delete_board_post();">
				</td>
			</tr>
		</table>
	</div>
	<div id="reply_form" align="center">
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
		<!-- order by로 불러오기 -->

		<c:forEach var="i" items="${reply_list}">
			<div class="reply_div">
				<div class="user_info_div">
					<div class="user_photo">
						<img src="${pageContext.request.contextPath}/resources/upload/user${i.m_photo_name}" alt="이미지 유실">
					</div>
					<div>${i.m_username}</div>
					<div>${i.r_date}</div>
				</div>
				${i.r_content}
			</div>
		</c:forEach>
	</div>
</body>
</html>