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

          table{
          text-align:center;
 			width:70%;
 			margin:auto;
 			border-collapse:collapse;
 			font-size:15px;
          }
          
         tr{
         height:40px;
         }
         th{border-bottom:3px solid #168;
           font-size:20px;
         }

          h1{
          font-weight:bold;
          font-family:system-ui;
          text-align:center;
          margin-bottom:30px;
          }
  	#modibtn{
   			border-radius: 4px;
  		    background: #ff7300 !important;
  	 		border: none;
   			color: #FFFFFF;
  		    text-align: center;
            font-size: 17px;
           
            
            transition: all 0.4s;
            cursor: pointer;
            margin:30px 5px;
         
           
           width:110px;
           height:50px;
           
 }
 #totcosttd{
 border-top:3px solid #168;
 font-size:25px;
 }
  	#orderbtn{
   			border-radius: 4px;
  		    background: #ff7300 !important;
  	 		border: none;
   			color: #FFFFFF;
  		    text-align: center;
            font-size: 17px;
            
            transition: all 0.4s;
            cursor: pointer;
            margin:30px 5px;
           width:110px;
           height:50px;
          
 }
  #btntd{
  border: none;  
  }
 

 .btn span {
   cursor: pointer;
   display: inline-block;
   position: relative;
   transition: 0.4s;
 }
 #modibtn span:before {
   content: "<<";
   position: absolute;
   opacity: 0;
   top: 0;
   left: -20px;
   transition: 0.5s;
 }
 #orderbtn span:after {
   content: ">>";
   position: absolute;
   opacity: 0;
   top: 0;
   right: -20px;
   transition: 0.5s;
 }
 #orderbtn:hover span {
   padding-right: 25px;
 }
 #modibtn:hover span {
   padding-left: 25px;
 }
 #orderbtn:hover span:after {
   opacity: 1;
   right: 0;
 }
 #modibtn:hover span:before {
   opacity: 1;
   left: 0;
 }

        </style>
      </head>
      <body>
        <h1>장바구니</h1>
        <div id="cartList">${cList}</div>


        <script>
          //functions---------------------------------------------------------



          //장바구니 리스트를 추가하는 함수
      /*     function cartList(){
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


           */


          //functionEnd-------------------------------------------------------


          //main









        </script>


      </body>
    </html>
