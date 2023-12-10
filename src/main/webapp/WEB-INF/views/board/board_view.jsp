<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head data-id="board">
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/default_css.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/default_js.js"></script>
	<script>
		let bl_isliked;
		let b_idx='${vo.b_idx}';
		window.onload = function(){
			if('${vo.bl_isliked}' == '1'){
				bl_isliked = '1';
			}else{
				bl_isliked = '0';
			}
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
			
			sendRequest(url,param,resultFn3,'post');
		}
		function resultFn3(...args){
			let res = args[0].res;
			if(res == 'success'){
				alert('게시글 삭제 성공');
				location.href='board';
			}else{
				alert('글 삭제 권한이 없습니다.');
			}
		}
		function board_like(b_idx){
			let like_button_class = document.getElementsByClassName('board_like_button');
			
			if(like_button_class[0].value == '좋아요'){
				
				let url ="add_board_like";
				
				let param={
						"bl_isliked":encodeURIComponent("0"),
						"b_idx":encodeURIComponent(b_idx)
				};
				
				sendRequest(url,param,resultFn,'post');
				
				like_button_class[0].value='좋아요 해제'
			}else{
				let url ="delete_board_to_unlike";
				
				let param={
						"bl_isliked":encodeURIComponent("1"),
						"b_idx":encodeURIComponent(b_idx)
				};
				
				sendRequest(url,param,resultFn,'post');
				
				like_button_class[0].value='좋아요'
			}
		}
		
		function resultFn(...args){
			let res = args[0].param;
			let like_count_id = document.getElementById('b_like_count');
			if(res=='plus'){
				like_count_id.value = Number(like_count_id.value)+1;
			}else if(res=='minus'){
				like_count_id.value = Number(like_count_id.value)-1;
			}
		}
		
		function reply_like(r_idx){
			let id = document.getElementById('rl_isliked_'+r_idx);
			
			if(id.value=='0'){
				console.log('up');
				let url ="add_reply_like";
				
				let param={
						"rl_isliked":encodeURIComponent("0"),
						"r_idx":encodeURIComponent(r_idx)
				};
				
				sendRequest(url,param,resultFn2,'post');
				id.value='1';
			}else{
				console.log('down');
				let url ="delete_reply_to_unlike";
				
				let param={
						"rl_isliked":encodeURIComponent("1"),
						"r_idx":encodeURIComponent(r_idx)
				};
				
				sendRequest(url,param,resultFn2,'post');
				id.value='0';
			}
		}
		
		function resultFn2(...args){
			console.log(args[0]);
			let res = args[0].res;
			let r_idx = args[0].r_idx;
			let b_like_count_id = document.getElementById('r_like_count_'+r_idx);
			if(res == 'plus'){     
				b_like_count_id.value= Number(b_like_count_id.value)+1;
			}else if(res=='minus'){
				b_like_count_id.value= Number(b_like_count_id.value)-1;				
			}else{
				alert('권한이 없습니다.');
			}
		}
		
		function delete_reply(r_idx){
			
			let url='delete_reply';
			let param = {
				"r_idx":encodeURIComponent(r_idx)
			}
			
			sendRequest(url,param,after_delete_reply,'post');
		}
		
		function after_delete_reply(...args){
			console.log(args[0]);
			let res = args[0].res;
			if(res=='success'){
				alert('댓글 삭제');
				location.href='board_view?b_idx='+b_idx;
			}else if(res=='fail'){
				alert('댓글 삭제 권한이 없습니다.');
			}else{
				alert('예외 발생 res값 : '+res);
			}
		}
		
	    </script>
</head>
<body>
	<div id="header_bar"></div>
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
				<td><input type="text" id="b_like_count" value="${vo.b_like_count}"></td>
				<td>
					<c:choose>
						<c:when test="${vo.bl_isliked eq '0'}">
							<input type="button" class="board_like_button" value="좋아요" onclick="board_like('${vo.b_idx}')">
						</c:when>
						
						<c:when test="${vo.bl_isliked eq '1'}">
							<input type="button" class="board_like_button" value="좋아요 해제" onclick="board_like('${vo.b_idx}')">
						</c:when>
						
						<c:otherwise>
							${vo.bl_isliked }
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			
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
					<!-- 삭제 -->
					<img src="resources/img2/btn_delete.gif" onclick="delete_board_post();">
				</td>
			</tr>
		</table>
	</div>
	
	<div id="reply_form" align="center">
		<form>
			<input type="hidden" name="b_idx" value="${vo.b_idx}">
		
			<textarea name="r_content" style="display:block; width: 60%"></textarea>
					
			<input type="button" value="답글 작성 완료" onclick="send_reply(this.form);">
		</form>

		<c:forEach var="i" items="${reply_list}">
			<div class="reply_div">
				<div class="user_info_div">
					<div class="user_photo">
						<img src="${pageContext.request.contextPath}/resources/upload/user${i.m_photo_name}" alt="이미지 유실">
					</div>
					
					<div>${i.m_username}</div>
					
					<div>${i.r_date}</div>
				</div>
				
				${i.r_content}<br>
				
				누적 좋아요 : <input id="r_like_count_${i.r_idx}" type="text" value="${i.r_like_count}"><br>
				
				<input id="rl_isliked_${i.r_idx}" type="button" value="${i.rl_isliked}" onclick="reply_like(${i.r_idx})">
				
				<input id="r_del_button_${i.r_idx}" type="button" value="댓글 삭제" onclick="delete_reply(${i.r_idx})">
			</div>
		</c:forEach>
	</div>
	
	<div id="footer_bar"></div>
</body>
</html>