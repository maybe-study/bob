<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
table, tr, td {
	border: solid black 1px;
}

h1 {
	text-align: center;
}

form {
	border: 1px solid #ccc;
	margin: auto;
	height: 50%;
	width: 610px;
	padding: 30px;
}

#name {
	width: 175px;
	height: 23px;
	margin-left: 69px;
	margin-bottom: 8px;
}

#year {
	width: 56px;
	height: 23px;
	margin-left: 32px;
	margin-bottom: 8px;
}

#birth {
	width: 56px;
	height: 23px;
	margin-bottom: 8px;
}

#day {
	width: 56px;
	height: 23px;
	margin-bottom: 8px;
}

#email {
	width: 176px;
	height: 23px;
	margin-left: 53px;
	margin-right: 8px;
	margin-bottom: 8px;
}

#str_email02 {
	width: 176px;
	height: 23px;
	margin-bottom: 8px;
}

#email1 {
	width: 100px;
	height: 29px;
	margin-left: 8px;
	margin-bottom: 8px;
}

#buyerid {
	width: 176px;
	height: 23px;
	margin-left: 48px;
	margin-bottom: 8px;
}

#pw {
	width: 176px;
	height: 23px;
	margin-left: 32px;
	margin-bottom: 8px;
}

#pw1 {
	width: 176px;
	height: 23px;
	margin-bottom: 8px;
}

#phone {
	width: 47px;
	height: 29px;
	margin-left: 42px;
	margin-bottom: 8px;
}

#phone1 {
	width: 41px;
	height: 23px;
	margin-left: 8px;
	margin-right: 8px;
	margin-bottom: 8px;
}

#phone2 {
	width: 41px;
	height: 23px;
	margin-left: 8px;
	margin-bottom: 8px;
}

#subbtn1 {
	margin: 20px;
	margin-left: 139px;
	width: 100px;
	height: 40px;
	background-color: #DF7401;
}

#cancel1 {
	margin-left: 97px;
	width: 100px;
	height: 40px;
	background-color: #DF7401;
}
</style>
</head>
<body>
	<h1>회원가입 페이지</h1>
	<form name="joinForm" action="joinfrm">
		<tr>
			<td><b>이름:</b><input id="name" name="name" type="text"
				placeholder="이름" class="txt" /></td>
			<br>
		</tr>
		<tr>
			<b>생년월일:</b>
			<td><select name="year" id="year" class="foot1">
					<option value="">년도</option>
					<option value="2019">2019</option>
					<option value="2018">2018</option>
					<option value="2017">2017</option>
					<option value="2016">2016</option>
					<option value="2015">2015</option>
					<option value="2014">2014</option>
					<option value="2013">2013</option>
					<option value="2012">2012</option>
					<option value="2011">2011</option>
					<option value="2010">2010</option>
					<option value="2009">2009</option>
					<option value="2008">2008</option>
					<option value="2007">2007</option>
					<option value="2006">2006</option>
					<option value="2005">2005</option>
					<option value="2004">2004</option>
					<option value="2003">2003</option>
					<option value="2002">2002</option>
					<option value="2001">2001</option>
					<option value="2000">2000</option>
					<option value="1999">1999</option>
					<option value="1998">1998</option>
					<option value="1997">1997</option>
					<option value="1996">1996</option>
					<option value="1995">1995</option>
					<option value="1994">1994</option>
					<option value="1993">1993</option>
					<option value="1992">1992</option>
					<option value="1991">1991</option>
					<option value="1990">1990</option>
					<option value="1989">1989</option>
					<option value="1988">1988</option>
					<option value="1987">1987</option>
					<option value="1986">1986</option>
					<option value="1985">1985</option>
					<option value="1984">1984</option>
					<option value="1983">1983</option>
					<option value="1982">1982</option>
					<option value="1981">1981</option>
					<option value="1980">1980</option>
					<option value="1979">1979</option>
					<option value="1978">1978</option>
					<option value="1977">1977</option>
					<option value="1976">1976</option>
					<option value="1975">1975</option>
					<option value="1974">1974</option>
					<option value="1973">1973</option>
					<option value="1972">1972</option>
					<option value="1971">1971</option>
					<option value="1970">1970</option>
			</select></td>
			<td><select name="birth" id="birth" class="foot1">
					<option value="">월</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					<option value="7">7</option>
					<option value="8">8</option>
					<option value="9">9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
			</select></td>
			<td><select name="day" id="day" class="foot1">
					<option value="">일</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					<option value="7">7</option>
					<option value="8">8</option>
					<option value="9">9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
					<option value="13">13</option>
					<option value="14">14</option>
					<option value="15">15</option>
					<option value="16">16</option>
					<option value="17">17</option>
					<option value="18">18</option>
					<option value="19">19</option>
					<option value="20">20</option>
					<option value="21">21</option>
					<option value="22">22</option>
					<option value="23">23</option>
					<option value="24">24</option>
					<option value="25">25</option>
					<option value="26">26</option>
					<option value="27">27</option>
					<option value="28">28</option>
					<option value="29">29</option>
					<option value="30">30</option>
					<option value="31">31</option>
			</select></td>
			<br>
		</tr>
		<tr>
			<td><b>이메일:</b><input id="email" name="email" type="text"
				placeholder="이메일" class="txt" />@ <input type="text" name="email2"
				id="str_email02" disabled value="선택하세요"> <select
				name="email1" id="email1">
					<option value="0">선택하세요</option>
					<option value="1">직접입력</option>
					<option value="naver.com">naver.com</option>
					<option value="nate.com">nate.com</option>
					<option value="gmail.com">gmail.com</option>
					<option value="daum.net">daum.net</option>
			</select></td>
			<br>
			<b>아이디:</b>
			<input id="buyerid" name="buyerid" type="text" placeholder="아이디"
				class="username_input" />
			<button type="button" id="checkbtn" onclick="checkbtn"
				class="btn btn-default">중복확인</button>
			<img id="id_check_sucess" style="display: none;">
			<br>
			<b>비밀번호:</b>
			<input id="pw" name="pw" type="password" placeholder="비밀번호"
				class="txt" />
			<br>
			<b>비밀번호확인:</b>
			<input id="pw1" name="pw1" type="password" placeholder="비밀번호확인"
				class="txt" />
			<br>
		</tr>
		<div id="pwdiv"></div>
		<tr>
			<td><b>전화번호</b><select name="phone" id="phone" class="foot1">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="018">018</option>
					<option value="019">019</option>
			</select></td>
			<td>-<input type="text" id="phone1" name="phone1" class="txt" />-<input
				type="txt" id="phone2" name="phone2" class="txt">
			</td>
			<br>
		</tr>
		<div>
			<tr>
				<td><input type="button" onclick="subbtn" id="subbtn1"
					value="회원가입" /></td>

				<td><a href='' onClick="history.back()"><input
						type="button" onclick="cancel" id="cancel1" value="회원가입취소">
				</a></td>
			</tr>
		</div>
	</form>
	<script>
		$(document).ready(function() {
			$("#str_email02").hide();

		});
		$('.username_input').change(function() {
			$('#id_check_sucess').hide();
			$('.btn btn-default').show();
			$('.username_input').attr("check_result", "fail");

		});

		$("#cancel1").on('click', function() {
			location.href = 'history.back()';
		});
		$('#checkbtn').on('click', function() {
			var buyerid = $("#buyerid").val();
			$.ajax({
				type : 'POST',
				url : './joinchk',
				data : {
					buyerid : buyerid
				},
				success : function(result) {
					if (result == 1) {
						alert('사용가능합니다');
						$('.username_input').attr("check_result", "success");
						$('#id_check_sucess').show();
						$('.btn btn-default').hide();
					} else if (result == 0) {
						alert('아이디가 중복입니다.');
					} else {
						alert('아이디가 입력되지 않았습니다');
					}
				}
			}); //end ajax    
		}); //end on   

		$("#subbtn1")
				.on(
						'click',
						function() {
							var joinForm = document.joinForm; //joinForm=form 태그의 name값
							var name = joinForm.name.value;
							var year = joinForm.year.value;
							var birth = joinForm.birth.value;
							var day = joinForm.day.value;
							var email = joinForm.email.value;
							var email2 = joinForm.email2.value;
							var email1 = joinForm.email1.value;
							var id = joinForm.buyerid.value;
							var pw = joinForm.pw.value; //pw=비밀번호input태그의 name값 (응용해서 아이디도 사용가능)
							var pw1 = joinForm.pw1.value;//위와같지만 pw1은 비밀번호 input태그의 name값임
							var phone1 = joinForm.phone1.value;
							var phone2 = joinForm.phone2.value;

							if (!name) {
								alert("이름을 입력해 주세요")
							} else if (!year || !birth || !day) {
								alert("생년월일을 선택해주세요")
							} else if (!email || !email1 || !email2) {
								alert("이메일을 입력해주세요")
							} else if (email2 == "선택하세요") {
								alert("이메일을 선택하거나 직접 입력하여주세요")
							} else if (!id) {
								alert("아이디를 입력해주세요")
							} else if ($('.username_input')
									.attr("check_result") == "fail") {
								alert("아이디 중복체크를 해주시기 바랍니다.");
								$('.username_input').focus();
								return false;
							} else if (!pw || !pw1) { //이건 그냥 유도리있게 써라 !에 var값 추가한거 쓰면 됨)
								alert("비밀번호를 입력해주세요")
							} else if (pw.length < 8) {
								alert("비밀번호는 8자 이상이어야 합니다.");
							} else if (pw.length > 20) {
								alert("비밀번호는 20자 이하이어야 합니다.");
							} else if (pw1.length < 8) {
								alert("비밀번호는 8자 이상이어야 합니다.");
							} else if (pw1.length > 20) {
								alert("비밀번호는 20자 이하이어야 합니다.");
							} else if (pw == pw1 && pw.length < 8) {
								alert("비밀번호는 8자 이상이어야 합니다.");
							} else if (pw == pw1 && pw.length > 20) {
								alert("비밀번호는 20자 이하이어야 합니다.");
							} else if (!phone1 || !phone2) {
								alert("전화번호를 입력해주세요")
							} else {
								alert("회원가입이 완료되었습니다.")
								joinForm.submit();
							}
						});

		$("#pw").keyup(
				function() {
					var pw = $("#pw").val();
					if (pw.length < 8) {
						$("#pwdiv").text("비밀번호는 8자 이상이어야 합니다.").css("color",
								"orangered");
					}
					if (pw.length > 20) {
						$("#pwdiv").text("비밀번호는 20자 이하이어야 합니다.").css("color",
								"orangered");
					}
				});

		$("#pw1").keyup(
				function() {
					var pw = $("#pw").val();
					var pw1 = $("#pw1").val();
					if (pw1.length < 8) {
						$("#pwdiv").text("비밀번호는 8자 이상이어야 합니다.").css("color",
								"orangered");
					} else if (pw1.length > 20) {
						$("#pwdiv").text("비밀번호는 20자 이하이어야 합니다.").css("color",
								"orangered");
					} else if (pw == pw1 && pw.length > 8) {
						$("#pwdiv").text("");
					} else if (pw == pw1 && pw.length < 8) {
						$("#pwdiv").text("비밀번호는 8자 이상이어야 합니다.").css("color",
								"orangered");
					} else if (pw == pw1 && pw.length < 20) {
						$("#pwdiv").text("");
					} else if (pw == pw1 && pw.length > 20) {
						$("#pwdiv").text("비밀번호는 20자 이하이어야 합니다.").css("color",
								"orangered");
					} else {
						$("#pwdiv").text("비밀번호가 다릅니다.").css("color",
								"orangered");
					}
				});
		$("#email1").change(function() {
			$("#email1 option:selected").each(function() {
				if ($(this).val() == '1') {
					$("#str_email02").show();
					$("#str_email02").val('');
					$("#str_email02").attr("disabled", false);
				} else if ($(this).val() == '0') {
					$("#str_email02").hide();
				} else {
					$("#str_email02").show();
					$("#str_email02").val($(this).text()); //선택값 입력 
					$("#str_email02").attr("disabled", true); //비활성화
				}
			});
		});
	</script>
</body>
</html>