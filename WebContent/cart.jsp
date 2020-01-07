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
          
          th,td {
            border: 1px solid black;
            padding: 10px;
          }
          #btndiv{
           position: fixed;
            right: 10px;
            top:50%
          }
          h1{
          font-weight:bold;
          font-family:system-ui;
          }
         
        </style>
      </head>
      <body>
        <h1>장바구니</h1>
        <div id="cartList"></div>
        <div id="btndiv">총가격:<br>
        <button class="btn" id="changebtn" type="submit"><img class="btn-img" src="img/change.png"></button><br>
        <button class="btn" id="orderbtn" type="submit"><img class="btn-img" src="img/btn2.png"></button></div>
        <script>
          //functions---------------------------------------------------------
          
       
              
          //장바구니 리스트를 추가하는 함수
          function cartList(){
        	  var $table = $("<table>").appendTo($("#cartList"));
              $table.attr("id", "list"); //아이디가 list인 테이블
         
              var $tr=$("<tr>").appendTo($("#list"));
    		  $("<th>").text('상품').appendTo($tr);
    		  $("<th>").text('수량').appendTo($tr);
    		
    		      
              for (var i = 0; i < 10; i++) {
                //행을 붙임
                var $tr = $("<tr>").appendTo($("#list"));
                var $img = $("<img>").attr("src", "img/buger01.jpg");
                $("<td>").append($img).appendTo($tr);
                $("<td>").append("    개").appendTo($tr);
                
                
                  
                  console.log(selectButton(i));
                 
              }
          }
          
          
          
         
          
          //functionEnd-------------------------------------------------------
		  
          
          //main
          cartList();
          
          
          
          
          
          
          
          
        </script>
        
        
      </body>
    </html>
