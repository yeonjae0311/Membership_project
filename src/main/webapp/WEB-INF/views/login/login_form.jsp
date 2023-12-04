<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>login form</title>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/login_js/login_form.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/http_request.js"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script>
		Kakao.init('ecd3cb4b8375bdc2a818dc7c63c0b938'); //발급받은 키 중 javascript키를 사용해준다.
		console.log(Kakao.isInitialized()); // sdk초기화여부판단
		//카카오로그인 구현중
		function kakaoLogin() {
		    Kakao.Auth.login({
		      success: function (response) {
		        Kakao.API.request({
		          url: '/v2/user/me',
		          success: function (response) {
		        	  console.log(response)
		          },
		          fail: function (error) {
		            console.log(error)
		          },
		        })
		      },
		      fail: function (error) {
		        console.log(error)
		      },
		    })
		  }
		//카카오로그아웃  
		function kakaoLogout() {
		    if (Kakao.Auth.getAccessToken()) {
		      Kakao.API.request({
		        url: '/v1/user/unlink',
		        success: function (response) {
		        	console.log(response)
		        },
		        fail: function (error) {
		          console.log(error)
		        },
		      })
		      Kakao.Auth.setAccessToken(undefined)
		    }
		  }
	</script>
</head>
<body>
	<form>
		<table border="1" align="center">
			<caption>:::로그인:::</caption>
			<tr>
				<th>아이디</th>
				<td>
					<input name="m_id">
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input name="m_password" type="password">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="로그인" onclick="javascript:send(this.form)">
					<input type="button" value="회원가입" onclick="location.href='member_insert_form'">
					<input type="button" value="취소" onclick="location.href='main'">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="아이디 찾기" onclick="location.href='register_find_id'">
					<input type="button" value="비밀번호 찾기" onclick="location.href='register_find_password'">
					<input type="button" value="결제" onclick="location.href='kakao_pay'">
				</td>
			</tr>
			
			<ul>
				<li onclick="kakaoLogin();">
				    <a href="javascript:void(0)">
				    	<span>카카오 로그인</span>
				    </a>
				</li>
				<li onclick="kakaoLogout();">
				    <a href="javascript:void(0)">
				    	<span>카카오 로그아웃</span>
				    </a>
				</li>
			</ul>
		</table>
	</form>
</body>
</html>