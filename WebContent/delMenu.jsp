<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<style>
@import url(//fonts.googleapis.com/earlyaccess/nanumpenscript.css);
h1{
margin-bottom:30px;
font-family: 'Jeju Gothic';
text-align:center;
}
table{
}
tr{
height:200px;
margin:10px;
}
td{

text-align:center;
border-bottom:1px solid #40464b;

}
table{
margin: auto;
}

.bobimg{
 width:100%;
 height:100%;
}
.checkedMenu{
width:18px;
height:18px;
margin-right:20px;
}
  #delbtn{
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
            position: fixed;
            right: 10px;
            top:50%
         }

</style>
<body>
<h1>메뉴 삭제</h1>
<form action="delmenu" method="post">
<ul class="nav nav-tabs">
             <li class="menu-kind">
                 <a class="nav-link active" href="#tab1" data-toggle="tab">일반</a>
             </li>
             <li class="menu-kind">
                 <a class="nav-link" href="#tab2" data-toggle="tab">고기</a>
             </li>
             <li class="menu-kind">
                 <a class="nav-link" href="#tab3" data-toggle="tab">튀김</a>
             </li>
             <li class="menu-kind">
                 <a class="nav-link" href="#tab4" data-toggle="tab">떡갈비</a>
             </li>
            
            
         </ul>
         <div class="tab-content px-1 pt-2">
             <div class="tab-pane active" id="tab1">
                 ${mnListHtmln}
             </div>
             <div class="tab-pane" id="tab2">
             	${mnListHtmlm}
             </div>
             <div class="tab-pane" id="tab3">
             	${mnListHtmlt}
             </div>
             <div class="tab-pane" id="tab4">
             	${mnListHtmltt}
             </div>
         </div>
                   
    <button id='delbtn'>삭제하기</button>
    </form>
</body>


</html>