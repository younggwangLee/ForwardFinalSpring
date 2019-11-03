<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Insert title here</title>
  <meta charset="utf-8">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel='stylesheet' id='mycss'  href='http://192.168.43.115:8083/webProject/css/mycss.css' type='text/css' media='all' />
   <style>
  	#sidebar{
  		float: left;
  	}
  	#sidebar:before, #sidebar:after{
  		clear:both;
  		content:"";
  	}
  	.addAr{	
  		background-image: url("http://192.168.43.115:8083/webProject/images/header.jpg");
  		background-repeat: no-repeat;
  		background-size: cover;
  	}
  </style>
</head>
<body>

<div id="header">
<%@ include file="adminheader.jsp" %>
</div>
<div id="sidebar">
<%@ include file="adminsidebar.jsp" %>
</div>
<div id="content">
   	 <div class="well text-center addAr">
   	 		<h2 style="font-weight:bold;color:white">게시글 관리</h2>    
 	 </div>

     <div class="col-sm-10">
        <div class="well" style="height:100%;background:white;">
          <div class="container-fluid">
          <h4 style="font-weight:bold;">게시글 추가</h4><br>  
          
			<form class="mainForm col-sm-6" method="post" action="/a_addarticle">				
				<input type="hidden" name="selectBoardName" value="${selectBoardName}">
				
				<div class="form-group"> 
					<label for="articleTitle">제목</label> 
					<input type="text" class="form-control" name ="articleTitle" id="articleTitle" placeholder="제목을 입력하세요."> 
				</div> 
				
				<div class="form-group"> 
					<label for="articleContent">내용</label> 
					<textarea class="form-control" rows="10" name="articleContent" id="articleContent" placeholder="내용을 입력하세요."></textarea> 
				</div>
				
				<div class="form-group">
					<label for="notice">공지사항</label>
					<input type="radio" name="notice" id="notice" value="true" checked> 공지글
					<input type="radio" name="notice" id="notice" value="false"> 일반글
				</div>
				<div class="center-float text-center"> 
					<!-- <input type="submit" class="btn btn-success" id="addBtn" value="등록"> -->
					<a href="#" class="btn button" id="addBtn" style="font-weight: bold;">등록</a>
					<!-- <input type="button" class="btn btn-warning" id="goListBtn" value="취소"> -->
					<a href="#" class="btn button" id="goListBtn" style="font-weight: bold;">취소</a>
				</div> 
			</form>
		</div>
	   </div>
	</div>
</div>		
</body>
<script>
$(document).ready(function(){
	$('#goListBtn').click( function() {
		var bn = '${selectBoardName}';
		location.href = '/a_articlelist?selectBoardName='+bn;
	});
	$('#addBtn').click( function() {
		$form = $(".mainForm");
		$form.submit();
	});
});
</script>
</html>