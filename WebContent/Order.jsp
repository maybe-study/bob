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
        
        
        <ul class="nav nav-tabs">
                                        <li class="nav-item">
                                            <a class="nav-link active" href="#tab1" data-toggle="tab">Tab</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="#tab2" data-toggle="tab">Tab</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="#tab3" data-toggle="tab">Tab</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link disabled" href="#tab4" data-toggle="tab">Disabled</a>
                                        </li>
                                    </ul>
                                    <div class="tab-content px-1 pt-2">
                                        <div class="tab-pane active" id="tab1">
                                            <p>
                                                Welcome to my custom Bootstrap 4 test page that is a simple way to see various Bootstrap component examples. Customize Bootstrap with <a href="https://themestr.app">Themestr.app</a>.
                                            </p>
                                            <nav aria-label="Page navigation example">
                                                <ul class="pagination">
                                                    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                                                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                                                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                                                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                                                    <li class="page-item"><a class="page-link" href="#">Next</a></li>
                                                </ul>
                                            </nav>
                                        </div>
                                        <div class="tab-pane" id="tab2">2. Put a little content in your pane.</div>
                                        <div class="tab-pane" id="tab3">3. Put some more content in your pane here.</div>
                                    </div>
        
        
        
        
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
