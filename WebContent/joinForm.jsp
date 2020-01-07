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
</style>
</head>
<body>
	<h1>회원가입 페이지</h1>
	<form name="joinForm" action="joinfrm">
		<tr>
			<td>이름:<input id="name" type="text" placeholder="이름" class="txt" />
			</td>
			<br>
		</tr>
		<tr>
			생년월일:
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
			<td>이메일:<input id="email" type="text" placeholder="이메일"
				class="txt" />@ <input type="text" name="str_email02"
				id="str_email02" disabled value="선택하세요"> <select
				name="email1" id="email1">
					<option value="0">선택하세요</option>
					<option value="1">직접입력</option>
					<option value="naver.com">naver.com</option>
					<option value="nate.com">nate.com</option>
					<option value="gmail.com">gmail.com</option>
					<option value="daum.net">daum.net</option>
			</select>
			</td>
			<br> 아이디:
			<input id="id" type="text" placeholder="아이디" class="txt" />
			<button id=check>중복확인</button>
			<br> 비밀번호:
			<input id="pw" type="password" placeholder="비밀번호" class="txt" />
			<br> 비밀번호확인:
			<input id="pw1" type="password" placeholder="비밀번호확인" class="txt" />
			<br>
		</tr>
		<div id="pwdiv"></div>
		<tr>
			<td>전화번호<select name="year" id="year" class="foot1">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="018">018</option>
					<option value="019">019</option>
			</select></td>
			<td>-<input type="text" class="txt" />-<input type="txt"
				class="txt">
			</td>
			<br>
		</tr>
		<tr>
		<form action="joinfrm" name="joinfrm" method="post">
			<td>
				<button>회원가입하기</button>
			</td>
			</form>
			<td>
				<button>회원가입취소</button>
			</td>
		</tr>
	</form>
	<script>
		$(document).ready(function() {
			$("#str_email02").hide();
		});
		$("#check").click(function() {
			alert("사용가능합니다.")
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
					}
					if (pw == pw1) {
						$("#pwdiv").text("");
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