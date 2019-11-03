<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous"> -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
  <style>
  	#sidebar{
  		float: left;
  	}
  	#sidebar:before, #sidebar:after{
  		clear:both;
  		content:"";
  	}
  	.signupf{
  			background-image: url("http://192.168.43.115:8083/webProject/images/header.jpg") !important;
	  		background-repeat: no-repeat;
	  		background-size: cover;
  		}
  		.container > input{
		backgroundcolor: rgb(255, 255, 255);
		background color: gray-lighter;
		input-color: gray;
		input-border: rgb(204, 204, 204);
		
	}
	input > .disabled{
		background color: gray-lighter
	} 
	input{
		text-color: gray;
		border-color: rgb(204, 204, 204);
	}

	.form-control{
		width: 20% !important;
		margin: 0 0 0 5%;
	}
	.col-lg-10{
	
	}
	.cip{
		width: 14% !important;
		margin: 0 0 0 -2%;
	}
	.bnt{
		float: right;
		margin: 6px 12px;
	}
	.interval{
		height: 5px;
	}
	.control-label{
		/* width: 15px !important; */
	}
	.col-lg-6{
		margin: 0 0 0 25%; 
	}	
	.live-less-editor-hovercontainer{
		background-color:#F6F6F6;
		width: 70%;
	}
  </style>
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="http://192.168.43.115:8083/webProject/css/theme.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<link rel='stylesheet' id='mycss'  href='http://192.168.43.115:8083/webProject/css/mycss.css' type='text/css' media='all' />
</head>
<body>
<div id="header">
		<%@ include file="adminheader.jsp"%>
	</div>
	<div id="sidebar">
		<%@ include file="adminsidebar.jsp"%>
	</div>
	<div class="well text-center signupf">
   	 	<h2 style="font-weight:bold;color:white;">회원가입 유효성 관리</h2>    
 	 </div>
	<div class="container" id="content">
		<div class="bs-docs-section">
	 	 	<legend>회원가입 유효성 관리</legend>
		        <div class="well bs-component live-less-editor-hovercontainer"> 	 
					<form id="regExForm" action="/signupform" method="POST">
						<div class="form-group">
							<label class="col-lg-2 control-label">아이디 조합</label>
							<select id="selectId" name="selectId" class="form-control">
								<option>영문</option>
								<option>숫자</option>
								<option>영문+숫자</option>
							</select>
						</div>
						<div class="form-group">
							<label for="idCipher" class="col-lg-2 control-label">아이디 자릿수</label>
							<input type="text" id="idCipher" name="idCipher"class="form-control cip">
						</div>
						
						<div class="form-group">
							<div>
								<label class="col-lg-2 control-label">닉네임 조합</label>
								<select id="selectNick" name="selectNick" class="form-control">
									<option>영문</option>
									<option>숫자</option>
									<option>영문+숫자</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<div>
								<label for="nickCipher" class="col-lg-2 control-label">닉네임 자릿수</label>
								<input type="text" id="nickCipher" name="nickCipher" class="form-control cip" >
							</div>						
						</div>
						
						
						<div class="form-group">
							<label class="col-lg-2 control-label">비밀번호 조합</label>
							<select id="selectPwd" name ="selectPwd" class="form-control">
								<option>영문</option>
								<option>숫자</option>
								<option>영문+숫자</option>
								<option>영문+숫자+특수문자</option>
							</select>
						</div>
						<div class="form-group">
							<label for="pwdCipher" class="col-lg-2 control-label">비밀번호 자릿수</label>
							<input type="text" id="pwdCipher" name="pwdCipher" class="form-control cip" >
						</div>
						<!-- <input type="button" value="취소" id="cancelBtn" class="btn btn-default"> -->
						<a href="/a_main" id="cancelBtn" class="btn button" style="font-weight: bold;">취소</a>	
						<!-- <input type="button" value="등록" id="regBtn" class="btn btn-primary"> -->
						<a href="#" id="regBtn" class="btn button" style="font-weight: bold;">등록</a>
					</form>
				</div>			
			</div>	
</div>
</body>
</html>


<script>
	$(document).ready(function(e){
		/* 전송 버튼 클릭시 데이터 전송 */
		$("#regBtn").on("click", function(e){
			$("#regExForm").submit();
		})
	});
</script>