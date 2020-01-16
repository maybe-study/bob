<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <!DOCTYPE html>
  <html>
    <head>
      <meta charset="UTF-8">
        <title>Insert title here</title>
        <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

        <style>
        
        tr{
        height:200px;
        }
        h1{
       	text-align:center;
        }
        table{
        margin: auto;
        width:550px;
        text-align:center;
        border:1px solid #c0c0c0;
        }
        ul,li{
        text-align: center;
        }
          .bobimg{
            width:100%;
            height:100%;
          }
          .cntdiv{
            text-align:center;
          	width:150px;
          }
          .cnt{
            align-content:center;
          	width:40px;
          }

          td {
           border-bottom:1px solid #c0c0c0;
            padding: 10px;
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
         #btn{
   			border-radius: 4px;
  		    background: #ff7300 !important;
  	 		border: none;
   			color: #FFFFFF;
  		    text-align: center;
            font-size: 17px;
            
            transition: all 0.4s;
            cursor: pointer;
            margin:30px 5px;
           width:120px;
           height:50px;
         }
         #btn span {
   			 cursor: pointer;
  			 display: inline-block;
  			 position: relative;
   			 transition: 0.4s;
 			}
 	#btn span:after {
   content: ">>";
   position: absolute;
   opacity: 0;
   top: 0;
   right: -20px;
   transition: 0.5s;
 }
 #btn:hover span {
   padding-right: 25px;
 }
 #btn:hover span:after {
   opacity: 1;
   right: 0;
 }
         
        </style>

      </head>
      <body>
      <h1>상품 담기</h1><br>
      <!-- Nav Tabs -->
      <form action="addcart" name="bList" action="post">
         <ul class="nav nav-tabs justify-content-center" >
             <li class="nav-item">
                 <a class="nav-link active" href="#n" data-toggle="tab">일반</a>
             </li>
             <li class="nav-item">
                 <a class="nav-link" href="#m" data-toggle="tab">고기</a>
             </li>
             <li class="nav-item">
                 <a class="nav-link" href="#t" data-toggle="tab">튀김</a>
             </li>
             <li class="nav-item">
                 <a class="nav-link" href="#tt" data-toggle="tab">떡갈비</a>
             </li>
             <!--
             <li class="nav-item">
                 <a class="nav-link disabled" href="#tab4" data-toggle="tab">Disabled</a>
             </li>
              -->
         </ul>
         <div class="tab-content px-1 pt-2">
        
             <div class="tab-pane active" id="n">

             </div>
             <div class="tab-pane" id="m">

             </div>
             <div class="tab-pane" id="t">

             </div>
             <div class="tab-pane" id="tt">

             </div>
         </div>



        <div id="showList"></div>
        <div id="btndiv"><button class="btn" id="btn" onclick="submit()" ><span>장바구니</span></button></div>


</form>


        <script>
          //functions---------------------------------------------------------
          console.dir("pListn:",${pListn});
          console.log("pListm:",${pListm});
          console.log("pListt:",${pListt});
          console.log("pListtt:",${pListtt}); 

          function submit() {
        	  var queryString = $("form[name=bList]").serialize();
        	  
              var form = document.createElement("form");
              form.setAttribute("charset", "UTF-8");
              form.setAttribute("method", "Post");  //Post 방식
              form.setAttribute("action", "addcart"); //요청 보낼 주소

              var hiddenField = document.createElement("input");
              hiddenField.setAttribute("type", "hidden");
              hiddenField.setAttribute("name", "queryString");
              hiddenField.setAttribute("value", queryString);
              form.appendChild(hiddenField);
              document.body.appendChild(form);
              form.submit();

           }

          //select 버튼에 들어갈 ajax 함수

          function aj(){
        	  //장바구니의 개수를 수정한다.
        	  var queryString = $("form[name=bList]").serialize();
        	  console.log(queryString);
        	  $.ajax({
      			type : 'post',
      			url : 'changecart',
      			data : queryString,
      			dataType : 'json',
      			error: function(error){

      			},
      			success : function(json){
      				console.log(json)
      			},
      		});

          }
          //개수 선택 버튼을 추가하는 함수


          function selectButton(idx,bobid,cnt){
        	console.log("밥아이디:"+bobid)
        	var bCnt="bCnt"+idx;
            var $div=$("<div>").attr("class","cntdiv");
            $("<input type='button'>").val("◀").appendTo($div).click(function(){
            	var c=$("#"+bCnt).val();
       			if(c>0){
       				$("#"+bCnt).val(--c);
       				aj();

       			}
            });
            $("<input>").attr("value",cnt).attr("class","cnt").attr("id","bCnt"+idx).attr("name",bobid).appendTo($div);
            $("<input type='button'>").val("▶").appendTo($div).click(function(){
            	var c=$("#"+bCnt).val()*1+1;
            	$("#"+bCnt).val(c);
            	aj();

            });
            return $div;
          }


          //장바구니 리스트를 추가하는 함수
          function cartList(tab,bList){
        	  console.log(tab);
        	  //var $form=$("<form name='bList'>");
        	  //var $table =$("<table>").appendTo($form);
        	  var $table =$("<table>");
              $table.attr("id", "tab"+tab.attr("id")); //아이디가 list인 테이블
	              $.each(bList,function(idx,item){
	            	  console.log(item);
	            	//행을 붙임
	                  var $tr = $("<tr>").appendTo($table);
	                  var $img = $("<img class='bobimg'>").attr("src", 'upload/'+item.pic);
	                  $("<td>").append($img).appendTo($tr);
	                  $("<td>").append(selectButton("tab"+tab.attr("id")+idx,item.bobid,item.cnt)).appendTo($tr);
	                  $("<td>").append(item.bobname).appendTo($tr);
              	})
              	$table.appendTo(tab);
              	//$form.appendTo(tab);
              	console.log($table);
          }




          //functionEnd-------------------------------------------------------


          //main
          cartList($("#n"),${pListn});
          cartList($("#m"),${pListm});
          cartList($("#t"),${pListt});
          cartList($("#tt"),${pListtt});








        </script>


      </body>
    </html>
