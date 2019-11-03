<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link href="https://fonts.googleapis.com/css?family=Pacifico" rel="stylesheet">
  
  <script>
$(document).ready(function(e){
/* 	$('#managerList').click( function() {
	     var $form = $('<form></form>');
	     $form.attr('action', '/ad_managerlist');
	     $form.attr('method', 'get');
	     $form.appendTo('body');
	     $form.submit();
	});*/
	
	$('#memberList').click( function() {
	     var $form = $('<form></form>');
	     $form.attr('action', '/ad_regchart');
	     $form.attr('method', 'get');
	     $form.appendTo('body');
	     $form.submit();
	});
});

</script>
  <style>
    .navbar-nav{
    	width:100%;
    }
	#logo{
		margin: 15px 0 0 -8%
	}
  </style>
</head>
<body class="header-fixed sidebar-fixed" data-spy="scroll" data-target=".navbar" data-offset="60">
	    <div class="collapse navbar-collapse" id="myNavbar">
	      <ul class="nav navbar-nav">
	      	<li><a class="navbar-brand" id="logo" style="font-weight:bold;font-size:25pt;font-family: 'Pacifico', cursive;
	      	" href="/a_main">AdminMaster</a></li>
	        <li><a href="/a_main">&nbsp&nbsp</a></li>
	        <li class="active" style="font-weight:bold;font-size:12pt;"><a style="color:#353535;"href="/a_main">관리 홈</a></li>
	        <c:if test ="${sessionScope.login == 'admin'}">	        		        
		        <li style="font-weight:bold;font-size:12pt;"><a style="color:#353535;" href="/ad_memberlist" id="memberList">회원 관리</a></li>
		        <li style="font-weight:bold;font-size:12pt;"><a style="color:#353535;" href="/ad_managerlist" id="managerList">운영자 관리</a></li>
		        <li style="font-weight:bold;font-size:12pt;"><a style="color:#353535;" href="/ad_regchart" id="statistic">통계</a></li>
		        <li style="font-weight:bold;font-size:12pt;"><a style="color:#353535" href="/ad_signupform">회원가입 유효성 관리</a></li>
		        <li style="font-weight:bold;font-size:12pt;"><a style="color:#353535;" href="/ad_admininfo">관리자 정보</a></li>
	        </c:if>
	        <c:if test ="${sessionScope.login != null}">
	        <li><a href="/logout" class="pull-right" style="font-weight:bold;font-size:12pt;color:#353535;">로그아웃</a></li>
	        </c:if>
	        <c:if test="${sessionScope.login == null}">
	        <li><a href="/login" class="pull-right" style="font-weight:bold;font-size:12pt;color:#353535;">로그인</a></li>
	        </c:if>
	      </ul>
	    </div>
</body>
</html>
