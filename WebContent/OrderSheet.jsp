<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<style>
 h1{	  text-align:center;
          font-weight:bold;
          font-family:system-ui;
          }
 b{
 font-size:30px;

 }
form{
 border:1px solid #ccc;
 margin:auto;
 height:50%;
 width:900px;
 padding:30px;
 
}
select{
margin-left:28px;
width:400px;
height:35px;
}

#sample4_postcode{
width:400px;
height:35px;
margin-left:23px;
margin-bottom:10px;
}
#sample4_roadAddress{
width:320px;
height:35px;
margin-left:149px;
margin-bottom:10px;
}
#sample4_jibunAddress{
width:320px;
height:35px;
margin-bottom:10px;
}
#sample4_detailAddress{
width:320px;
height:35px;
margin-left:149px;
margin-bottom:10px;
}
#sample4_extraAddress{
height:35px;
width:320px;
margin-bottom:10px;
}
 
    #paybtn{
   			border-radius: 4px;
  		    background: #ff7300 !important;
  	 		border: none;
   			color: #FFFFFF;
  		    text-align: center;
            font-size: 17px;
            
            transition: all 0.4s;
            cursor: pointer;
            margin-left:400px;
           width:120px;
           height:50px;
         }
     #postbtn{
      width:100px;
      height:40px;
     }
      
</style>
</head>
<body>
<h1>주문 작성 페이지</h1>
<form action="payment">
<b>총 가격</b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${total}원<br><br>
<input type="hidden" name="total" value="${total}">

<b>지점선택</b>${branchList}<br><br>
<b>배송주소</b>
<input type="text" id="sample4_postcode" placeholder="우편번호">
<input type="button" id="postbtn" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
<input type="text" name='address' id="sample4_roadAddress" placeholder="도로명주소">
<input type="text" id="sample4_jibunAddress" placeholder="지번주소"><br>
<span id="guide" style="color:#999;display:none"></span>
<input type="text" id="sample4_detailAddress" placeholder="상세주소">
<input type="text" id="sample4_extraAddress" placeholder="참고항목"><br><br>

<button id="paybtn"><span>결제</span></button>
</form>
</body>


<script>
	document.getElementById("btn").addEventListener('click',function(){
		
	})
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>
</html>