<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="resources/js/httpRequest.js"></script>
<script type="text/javascript">

	var b_idCheck = false;
	
	function send(f){
		var m_id = f.m_id.value.trim();
		var m_password = f.m_password.value.trim();
		
		
		if(m_id == ''){
			alert('아이디를 입력하세요')
			return;
		}
		
		if(m_password == ''){
			alert('비밀번호를 입력하세요')
			return;
		}
		
		
		if(!b_idCheck){
			alert('아이디 중복체크를 하세요')
			return;
		}
		
		
		
		f.action = "member_insert";
		f.submit();
	}


	function check_id(){
		var m_id = document.getElementById("m_id").value.trim();
		
		if(m_id == ''){
			alert('아이디를 입력하세요')
			return;
		}
		
		var url = "check_id";
		var param = "id="+encodeURIComponent(m_id);
		
		sendRequest(url,param,resultFn,"POST");
		
	}
	
	function resultFn(){
		if(xhr.readyState == 4 && xhr.status == 200){
			let data = xhr.responseText;
			let json = (new Function('return'+data))();
			
			if(json[0].res == 'no'){
				alert('이미 사용중인 아이디입니다.')
				return
			} else {
				alert('사용 가능한 아이디 입니다.')
				b_idCheck = true;
			}
		}
	}
	
	function che(){
		b_idCheck = false;
	}
	
	
	
	
	
</script>
</head>
<body>
	<form>
		<table border="1" align="center">
			<caption>:::회원가입:::</caption>
			<tr>
				<th>아이디</th>
				<td><input name="m_id" id="m_id" onchange="che()">
					<input type="button" value="중복체크" onclick="check_id()"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input name="m_password" type="password"></td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td><input name="m_check_password" type="password"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input name="m_name"></td>
			</tr> 
			<tr>
				<th>이메일</th>
				<td><input name="m_email" id="m_email" >
				<button id="auth_btn">이메일 인증하기</button><br>
				<input class="mail_check_input" ><br>
				<div id="mail_check_input_info" ></div>
				</td>
				
			</tr>
			
			<script>
			let code = "";  /*인증번호 저장할 곳*/
			$('#auth_btn').click(function() {
				let m_email = $('#m_email').val();  /*입력한 이메일*/
				console.log('완성된 이메일 : ' + m_email); /* 이메일 오는지 확인*/
				let checkInput = $('.mail_check_input') /* 인증번호 입력 */

				$.ajax({
					type: 'GET',
					url: 'mail_check?m_email=' + m_email, /*url을 통해 데이터를 보낼 수 있도록 GET방식, url명을 "mailCheck"로 지정 */
					success: function(data) {
						console.log("data : " + data);
						checkInput.attr('disabled', false); /*데이터가 성공적으로 들어오면 인증번호 입력란이 활성화되도록*/
						code = data;
						alert('인증번호가 전송되었습니다.')
					}
					
				});
			});
				
			$('.mail_check_input').on('input',function() {
				let inputCode = $(".mail_check_input").val();   /*사용자가 입력한 전송 번호*/
				let checkResult = $("#mail_check_input_info");  /* 비교 결과 */
				
				if (inputCode == code) {                 // 일치할 경우
					checkResult.html("인증번호가 일치합니다.");
					checkResult.attr("class", "correct");
					$(".mail_check_input").css("border","1.5px solid #3781E3");/*일치할 경우 테두리 색 변경*/
					$(".mail_check_input").css("color","#3781E3");/*일치할 경우 글자 색 변경*/
				} else {                                            
					checkResult.html("인증번호를 다시 확인해주세요.");
					checkResult.attr("class", "correct");
					$(".mail_check_input").css("border","1.5px solid red");
					$(".mail_check_input").css("color","red");
				}
			});
			
			</script>
			

			
			<tr>
				<td colspan="2" align="center"><input type="button" value="가입"
					onclick="send(this.form)"> <input type="button" value="취소"
					onclick="location.href='main'"></td>
			</tr>
		</table>
	</form>
</body>
</html>