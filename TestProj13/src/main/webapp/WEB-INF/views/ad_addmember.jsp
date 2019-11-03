<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<link rel='stylesheet' id='mycss'  href='http://192.168.43.115:8083/webProject/css/mycss.css' type='text/css' media='all' />
<script>
$(document).ready(function(e){
	$('#btnSubmit').click(function(e){
		var id = $("#memberId").val();
		var $form = $('#mainForm');
		$form.attr('method', 'post');
		$form.attr('action', '/ad_addmember');
		$form.submit();
	});
});

</script>
 <style>
  	#sidebar{
  		float: left;
  	}
  	#sidebar:before, #sidebar:after{
  		clear:both;
  		content:"";
  	}
  	.addMem{
  		background-image: url("http://192.168.43.115:8083/webProject/images/header.jpg") !important;
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
   	 	<div class="well text-center addMem">
   	 		<h2 style="font-weight:bold;color:white;">${boardName}회원 관리</h2>    
 	 	</div>
 	 	
        <div class="col-sm-10">
          <div class="well" style="height:100%;background:white;">
            <div class="container-fluid">
			  <h4 style="font-weight:bold;">회원 추가</h4>
			  <br>
			  
			  
				<form id="mainForm">
				<div class="form-group row">
				    <label class="col-sm-2 col-form-label" for="memberId">아이디</label>
				    <input id="memberId" name="memberId" type="text" class="input-sm" placeholder="2~15자" equired autofocus>
				</div>
				<div class="form-group row">
				    <label for="memberPwd" class="col-sm-2 col-form-label">비밀번호</label>
				    <input id="memberPwd" name="memberPwd" type="password" class="input-sm" placeholder="8~15자" required>
				</div>
				<div class="form-group row">
				    <label for="memberName" class="col-sm-2 col-form-label">이름</label>
				    <input id="memberName" name="memberName" type="text" placeholder="40자미만 공백없이" class="input-sm"  required>
				</div>
				<div class="form-group row">
				    <label for=memberNickname" class="col-sm-2 col-form-label">닉네임</label>
				    <input id="memberNickname" name="memberNickname" type="text" class="input-sm" required>
				</div>
				<div class="form-group row">
				    <label for="memberMail" class="col-sm-2 col-form-label">메일 주소</label>
				    <input id="memberMail" name="memberMail" type="email" placeholder="abcd@domain.com" class="input-sm"  required autocomplete="off">
				</div>
				<div class="form-group row">
				    <label for="memberPhone" class="col-sm-2 col-form-label">연락처</label>
				    <select class="0stnum input-sm" name="tel1">
				    	<option value="010">010</option>
				    </select>
				    <input class ="1stnum input-sm" id="1stnum" name="tel2" style="width:80px;">
				    <input class ="2stnum input-sm" id="2stnum" name="tel3" style="width:80px;">
				</div>  
				<div class="form-group row">
					<label id="birth" class="col-sm-2 col-form-label">생년월일</label>
					<input type="text" name="memberBirth" placeholder="yyyy-MM-dd" class="input-sm" required>
				</div>
				<div class="form-group row">
					<label  class="col-sm-2 col-form-label">주소</label>
					<input type="text" name="memberAddress" placeholder="주소" value="" class="input-sm">
				</div>

				<div class="form-group row ">
				  <a class="btn button" id="btnSubmit">제출</a>
				  <a href="/ad_memberlist" type="button" class="btn button" id="btnCancel"> 취소</a>
				</div>
			</form>
			
			</div>
		</div>
		</div>
	</div>
</body>
<script>
$(document).ready(function(){
	$('#btnSubmit').click( function() {
		$form = $("#mainForm");
		$form.attr('action','/ad_addmember');
		$form.attr('method', 'POST');
		$form.submit();
	});
});
</script>
</html>

