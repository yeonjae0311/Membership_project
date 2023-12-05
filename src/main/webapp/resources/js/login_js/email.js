	let code = "num";  /*인증번호 저장할 곳*/

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
						
						return;
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
					$("#mail_check_input_info").css("color","#3781E3");
				} else {                                            
					checkResult.html("인증번호를 다시 확인해주세요.");
					checkResult.attr("class", "correct");
					$(".mail_check_input").css("border","1.5px solid red");
					$(".mail_check_input").css("color","red");
					$("#mail_check_input_info").css("color","red");
				}
			});