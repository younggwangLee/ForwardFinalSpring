<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
</head>
<style>
    .sidebar {
      /* background-color: #f2f2f2; */
		height: 800px;
		width: 250px;
		background-image: url("http://192.168.43.115:8083/webProject/images/sideBar.jpg");
  		background-repeat: no-repeat;
		background-size: cover;
    }
	body{
		font-family: 'Nanum Gothic', sans-serif;
	}
</style>

<body>
	<form id="form" action="/logout" method="GET"></form>
	<div class="sidebar container" style="font-weight:bold;">
      <h3 class="text-center"style="color:white;font-weight:bold;padding:15px 0;">관리 홈</h3>

      <ul class="nav nav-pills nav-stacked text-center">
      <c:if test ="${sessionScope.login != null}">
      	<li>&nbsp;</li>  
      	<li style="color:#F6F6F6"><c:out value="${sessionScope.login}"/> 님</li>
      	<li style="color:#F6F6F6"><c:out value="(${sessionScope.boardName}"/> 담당자)</li> 
      	<li>&nbsp;</li>
        <li><a style="font-weight:bold;color:#F6F6F6" href="/ad_boardlist">게시판 관리</a></li>
        </c:if>
       	 <li><a style="color:#F6F6F6" href="/logout" id="memPage">회원 페이지로</a></li>
      </ul><br>
      
    </div>
</body>
</html>