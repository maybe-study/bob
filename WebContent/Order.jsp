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
      <!-- Nav Tabs -->
      <form action="addcart">
         <ul class="nav nav-tabs">
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
         <h1>상품 담기</h1><br>
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
        <div id="btndiv"><button class="btn" id="btn" type="submit" ><img class="btn-img" src="img/btn.png"></button></div>

        </form>




        <script>
          //functions---------------------------------------------------------
          console.dir("pListn:",${pListn});
          console.log("pListm:",${pListm});
          console.log("pListt:",${pListt});
          console.log("pListtt:",${pListtt});



          //select 버튼에 들어갈 ajax 함수
          /*
          function aj(c){
        	  //장바구니의 개수를 수정한다.
        	  var queryString = $("form[name=bList]").serialize();
        	  console.log(queryString);
        	  $.ajax({
      			type : 'post',
      			url : 'cartchange',
      			data : queryString,
      			dataType : 'json',
      			error: function(error){

      			},
      			success : function(json){
      				console.log(json)
      			},
      		});

          }
          */



          //개수 선택 버튼을 추가하는 함수

         /*  function selectButton(idx){

          function selectButton(idx,bobid){
        	  console.log("밥아이디:"+bobid)

        	var bCnt="bCnt"+idx;
            var $div=$("<div>").attr("class","cntdiv");
            $("<input type='button'>").val("◀").appendTo($div).click(function(){
            	var c=$("#"+bCnt).val();
       			if(c>0){
       				$("#"+bCnt).val(--c);

       			}
            });
            $("<input>").attr("value","0").attr("class","cnt").attr("id","bCnt"+idx).attr("name",bobid).appendTo($div);
            $("<input type='button'>").val("▶").appendTo($div).click(function(){
            	var c=$("#"+bCnt).val()*1+1;
            	$("#"+bCnt).val(c);

            });
            return $div;
          }


          //장바구니 리스트를 추가하는 함수
          function cartList(tab,bList){
        	  console.log(tab);
        	  var $form=$("<form name='bList'>");
        	  var $table =$("<table>").appendTo($form);
              $table.attr("id", "tab"+tab.attr("id")); //아이디가 list인 테이블
	              $.each(bList,function(idx,item){
	            	  console.log(item);
	            	//행을 붙임
	                  var $tr = $("<tr>").appendTo($table);
	                  var $img = $("<img>").attr("src", 'upload/'+item.pic);
	                  $("<td>").append($img).appendTo($tr);
	                  $("<td>").append(selectButton("tab"+tab.attr("id")+idx,item.bobid)).appendTo($tr);
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
