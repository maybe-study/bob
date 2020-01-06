<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <!DOCTYPE html>
  <html>
    <head>
      <meta charset="UTF-8">
        <title>Insert title here</title>
        <link rel="stylesheet" href="css/bootstrap.css">
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.js"></script>

        <style>
          .cntdiv{
            text-align:center;
          	width:150px;
          }
          .cnt{
            align-content:center;
          	width:40px;
          }
          
          td {
            border: 1px solid black;
            padding: 10px;
          }
         .btn-img{
          width:150px;
          height:60px;
         }
          h1{
          font-weight:bold;
          font-family:system-ui;
          }
          #btndiv{

            position: fixed;
            right: 10px;
            top:50%
            
          
          }
        </style>

      </head>
      <body>
        <h1>상품 담기</h1><br>
        <div id="showList"></div>
        <div id="btndiv"><button class="btn" id="btn" type="submit"><img class="btn-img" src="img/btn.png"></button></div>
        
        
        
        
        
        
        
        <script>
          //functions---------------------------------------------------------
          
          //개수 선택 버튼을 추가하는 함수
          function selectButton(idx){
        	var bCnt="bCnt"+idx;
            var $div=$("<div>").attr("class","cntdiv");
            $("<button>").text("◀").appendTo($div).click(function(){
            	var c=$("#"+bCnt).val();
       			if(c>0){
       				$("#"+bCnt).val(--c);
       			}
            });
            $("<input>").attr("value","0").attr("class","cnt").attr("id","bCnt"+idx).appendTo($div);
            $("<button>").text("▶").appendTo($div).click(function(){
            	var c=$("#"+bCnt).val()*1+1;
            	$("#"+bCnt).val(++c);
            });
            return $div;
          }
          
          
          //장바구니 리스트를 추가하는 함수
          function cartList(){
        	  var $table = $("<table>").appendTo($("#showList"));
              $table.attr("id", "list"); //아이디가 list인 테이블

              for (var i = 0; i < 10; i++) {
                //행을 붙임
                var $tr = $("<tr>").appendTo($table);
               
                  var $img = $("<img>").attr("src", "img/buger01.jpg");
                  $("<td>").append($img).appendTo($tr);
                  console.log(selectButton(i));
                  $("<td>").append(selectButton(i)).appendTo($tr);
              }
          }
          
          
          
         
          
          //functionEnd-------------------------------------------------------
		  
          
          //main
          cartList();
          
          
          
          
          
          
          
          
        </script>
        
      
      </body>
    </html>
