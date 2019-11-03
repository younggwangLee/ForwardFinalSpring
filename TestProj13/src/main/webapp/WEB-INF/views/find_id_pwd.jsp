<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="userheader.jsp"%>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="format-detection" content="telephone=no">
<link rel='dns-prefetch' href='//code.jquery.com' />
<link rel='dns-prefetch' href='//fonts.googleapis.com' />
<link rel='stylesheet' id='dashicons-css'
	href='./resources/css/dashicons.min.css' type='text/css' media='all' />
<link rel='stylesheet' id='post-views-counter-frontend-css'
	href='./resources/css/frontend.css?ver=4.7.3' type='text/css'
	media='all' />
<link rel='stylesheet' id='twentysixteen-fonts-css'
	href='https://fonts.googleapis.com/css?family=Montserrat%3A400%2C700%7CInconsolata%3A400&#038;subset=latin%2Clatin-ext'
	type='text/css' media='all' />
<link rel='stylesheet' id='genericons-css'
	href='./resources/css/genericons.css?ver=3.4.1' type='text/css'
	media='all' />
<link rel='stylesheet' id='twentysixteen-style-css'
	href='./resources/css/styleSmash.css?ver=4.7.3' type='text/css'
	media='all' />
<link rel="stylesheet"
	href="http://gangwon-fc.com/wp-content/themes/gangwonfc/css/template.css?20170607"
	type="text/css" media="all">
<link rel="stylesheet" href="./resources/css/mycss.css" type="text/css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type='text/javascript' src='./resources/js/jquerySmash.js'></script>
<script type='text/javascript'
	src='./resources/js/jquery-migrate.min.js'></script>
<script type='text/javascript'
	src='//code.jquery.com/ui/1.11.4/jquery-ui.min.js'></script>
<script type='text/javascript' src='./resources/js/unslider.js'></script>
<link rel="alternate" type="text/xml+oembed"
	href="./resources/json/embed.json" />

<meta charset="UTF-8">

<script type="text/javascript">
	var idcheck = 0;
	var resultMemberId;
	var pwdcheck = 0;
	
	
	jQuery(document).ready(function(e) {
		
		
		jQuery("#findPwdBtn").click(function(e) {

											var memberId = $("#rMemberId")
													.val();
											var memberPhone = $("#rMemberPhone")
													.val();
											var memberMail = $("#rMemberMail")
													.val();

											if (memberId.length == 0
													|| memberPhone.length == 0
													|| memberMail.length == 0) {
												$('#forward0').text("");
												$('#forward0').text("비밀번호 찾기");
												$('#searchId').text("입력사항을 모두 입력해주세요.");
												$('#myModal').show();
												if (memberId.length == 0) {
													$("rMemberId").focus();
													return false;
												} else if (memberPhone.length == 0) {
													$("rMemberPhone").focus();
													return false;
												} else {
													$("rMemberMail").focus();
													return false;
												}

											}

											$.ajax({
														async : true,
														type : 'POST',
														data : JSON
																.stringify({
																	"memberId" : memberId,
																	"memberPhone" : memberPhone,
																	"memberMail" : memberMail
																}),
														url : "/findpwd.do",
														dataType : "json",
														contentType : "application/json; charset=UTF-8",
														success : function(
																resultMap) {

															if (resultMap.cnt > 0) {

																$('#rMemberId')
																		.val("");
																$(
																		'#rMemberPhone')
																		.val("");
																$(
																		'#rMemberMail')
																		.val("");
																$('#myModal2')
																		.show();
																pwdcheck = 1;
															} else {
																$('#rMemberId')
																.val("");
														$(
																'#rMemberPhone')
																.val("");
														$(
																'#rMemberMail')
																.val("");
																$('#forward0').text("");
																$('#forward0').text("비밀번호 찾기");
																$('#searchId').text("일치하는 회원이 없습니다.");
																
																
																$('#myModal').show();
															}

														},
														error : function(error) {
															alert("error:"
																	+ error);
														}
													});

										});

						jQuery("#findIdBtn")
								.click(
										function(e) {

											var memberName = $("#lMemberName")
													.val();
											var memberPhone = $("#lMemberPhone")
													.val();
											var memberMail = $("#lMemberMail")
													.val();

											if (memberName.length == 0
													|| memberPhone.length == 0
													|| memberMail.length == 0) {
												$('#searchId').text("입력사항을 입력해주세요.");
												$('#myModal').show();
												if (memberName.length == 0) {
													$("lMemberName").focus();
													return false;
												} else if (memberPhone.length == 0) {

													$("lMemberPhone").focus();
													return false;

												} else {
													$("lMemberMail").focus();
													return false;
												}

											}

											$
													.ajax({
														async : true,
														type : 'POST',
														data : JSON
																.stringify({
																	"memberName" : memberName,
																	"memberPhone" : memberPhone,
																	"memberMail" : memberMail
																}),
														url : "/findid.do",
														dataType : "json",
														contentType : "application/json; charset=UTF-8",
														success : function(
																resultMap) {

															if (resultMap.cnt > 0) {
																/* alert("모달을 엽니다."); */
																/* alert(resultMap.memberId); */
																$('#searchId')
																		.text(
																				resultMap.memberId
																						);
																$('#frontSearchId').text("아이디는 ");
																$('#backSearchId').text(" 입니다.");
																$(
																		'#lMemberName')
																		.val("");
																$(
																		'#lMemberPhone')
																		.val("");
																$(
																		'#lMemberMail')
																		.val("");
																$('#myModal')
																		.show();
																idcheck = 1;
															} else {
																
																$(
																'#lMemberName')
																.val("");
														$(
																'#lMemberPhone')
																.val("");
														$(
																'#lMemberMail')
																.val("");
																$('#searchId').text("일치하는 회원이 없습니다.");
																$('#myModal').show();
															}

														},
														error : function(error) {
															alert("error:"
																	+ error);
														}
													});

										});

					});

	function close_pop(flag) {

		$('#myModal').hide();
		location.href = "/find_id_popup";
	};

	function close_pop2(flag) {
		
		$('#myModal').hide();
		$('#frontSearchId').text("");
		$('#backSearchId').text("");

	};

	function close_pop3(flag) {
		/* $('#searchId').text("비밀번호가 변경되었습니다.");
		$('#myModal').show(); */
		
		
		
		$('#myModal2').hide();
		var changePwd = $("#changePwd").val();
		var $form = $('<form></form>');
		$form.attr('action', '/find_pwd_popup');
		$form.attr('method', 'post');
		$form.appendTo('body');
		var newPwd = '<input type="hidden" value="' + changePwd + '" name="changePwd">';
		$form.append(newPwd);
	
		$form.submit();
		$('#changePwd').val("");
		
		
		
		
	};

	function close_pop4(flag) {
		$('#changePwd').val("");
		$('#frontSearchId').text("");
		$('#backSearchId').text("");
		$('#myModal2').hide();

	};
</script>
<style>

.tabbx:before {
    content: "";
    width: 200%;
    left: -2000px;
    position: absolute;
    top: 0;
    bottom: 0;
    background: #fff;
    border-bottom: solid 1px #e2e2e2;

}




#findIdDiv{
	position:absolute;
	float: left;
	margin: 5% 0 5% 10%;
}



#findPwdDiv{
	/* float:left;
	padding: 15% 0 0 5%;  */
	position:absolute;
	
	right:0;
	margin: 5% 15% 5% 5%; 
}

.form_itembx .text_inputbx{
	width: 350px;
}





body.modal-open{
	over-flow:hidden;
	position:fixed;
}



.modal {
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	over-flow:hidden;
	background-color: rgb(0, 0, 0);
	background-color: rgba(0, 0, 0, 0.4);
}

.modal-content {
	background-color: #fefefe;
	
	margin : 20% auto 50% auto;
	padding: 20px;
	padding-bottom:30px;
	
	border: 1px solid #888;
	width: 30%;
	height: 230px;

}

.modal {
        text-align: center;
}
 
@media screen and (min-width: 768px) { 
        .modal:before {
                display: inline-block;
                vertical-align: middle;
                content: " ";
                height: 0%;
        }
}
 
 .modal-dialog {
        display: inline-block;
        text-align: left;
        vertical-align: 70%;
}
 
p{
	margin: 0;
	margin-top:5px;
    padding: 0;
    border: 0;
    font-size: 18px;
    font-weight:bold;
    vertical-align: baseline;
    font-family: 'Nanum Gothic','Open Sans', sans-serif;
    line-height: normal;
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    -o-box-sizing: border-box;
    -ms-box-sizing: border-box;
    color: black;
   
}




div #loginDiv{

	font-size:18px;
	font-weight:bold;
	width:23%;
}


div #closeDiv{
	
	font-size:18px;
	font-weight:bold;
	width:23%;
}

div #cancelDiv{
	font-size:18px;
	font-weight:bold;
	width:23%;
}

div #changeDiv{
	font-size:18px;
	font-weight:bold;
	width:23%;
}

 
#btnDiv{
	margin-top:50px;
	
} 

#btnDiv2{
	margin-top:30px;
}
 
#loginDiv, #changeDiv{
	float:left;
	width:45%;
	height:40px;
	padding-right:5px;
	padding-top:10px;
	margin-left:25%;
	
}


#closeDiv, #cancelDiv{
	float:right;
	width:45%;
	height:40px;
	padding-left:5px;
	padding-top:10px;
	margin-right:25%;
}


.pop_bt {
	margin-top:5px;
    font-size: 18px;
    color: white;
    
}

#searchId{
	font-weight:bold;
	color:red;
	font-weight:bold;
	font-size:20px;

}

#changePwd{
	width:200px;
	height:35px;
	margin-top:35px;
	border: 1px solid black;
}

#captionPwd{
	margin-bottom:20px;
	padding-left:18%;
	color:white;
}

#captionId{
	margin-bottom:20px;
	
	margin-left:52%;
	color:white;
}


</style>



</head>
<body>

	<!-- 아이디찾기 모달시작 -->
	<div id="myModal" class="modal">
		<div class="modal-content">
			<p style="text-align: center;">
				<span style="font-size: 14pt;"><b><span
						style="font-size: 24pt;" id="forward0">아이디 찾기</span></b></span>
			</p>
			<p style="text-align: center; font-size:16px line-height: 1.5;">
				<br /><span id="frontSearchId"></span><span id="searchId"></span><span id="backSearchId"></span>
			</p>
			
			<div id=btnDiv>
			<div
				style="cursor: pointer; background-color: #dd5828; text-align: center;"
				onclick="close_pop()" id="loginDiv">
				<span class="pop_bt" style="font-size: 16pt color:white;" id="forward1"> 로그인 </span>
			</div>
			<div
				style="cursor: pointer; background-color: #dd5828; text-align: center;" 
				onClick="close_pop2()" id="closeDiv">
				<span class="pop_bt" style="font-size:16pt color:white;" id="forward2"> 닫기 </span>
			</div>
			</div>


		</div>


	</div>
	<!-- 아이디찾기 모달끝 -->


	<div id="myModal2" class="modal">
		<div class="modal-content">
			<p style="text-align: center;">
				<span style="font-size: 14pt;"><b><span
						style="font-size: 24pt;">비밀번호 변경</span></b></span>
			</p>
			<div id="passwordInput">
				<input type="text" id="changePwd" name="changePwd">
			</div>
			
			<div id=btnDiv2>
			
			<div
				style="cursor: pointer; background-color: #dd5828; text-align: center;"
				onClick="close_pop3();" id="changeDiv">
				<span class="pop_bt" style="font-size: 16pt color:white;"> 변경 </span>
			</div>
			<div
				style="cursor: pointer; background-color: #dd5828; text-align: center;"
				onClick="close_pop4();" id="cancelDiv">
				<span class="pop_bt" style="font-size:16pt color:white;"> 취소 </span>
			</div>
			</div>

		</div>


	</div>





	<div class="content_rowbx">
		<div class="site-main ">
			<div class="pg_topbannerbx">
				<div class="bg content-area"></div>
			</div>
			<!-- 리스트 -->
			<div class=" form_seach_list">
				
				<div class="form_container">
				
				<div id="tempDiv">
					<!-- 아이디 찾기 -->
					
					<div id=findIdDiv>
					<div id="captionId"><span style="font-size: 24pt; color:white">아이디 찾기</span></div>
					<form action="" method="POST" name="form_find_id" id="form_find_id">
						<input type="hidden" name="action" value="a_find_id"> <input
							type="hidden" name="nonce" value="91e1661a50" />
						<!-- 이름 -->
						<div class="form_itembx">
							<div class="inputbx">
								<label class="hidden_label" for="forget_1">이름</label> <input
									id="lMemberName" type="text" class="text_inputbx"
									placeholder="이름" data-validation="required" name="name">
								<p class="form_allet error alert_error" style="display: none"
									data-input-name="name"></p>
							</div>
						</div>
						<!-- .이름 -->
						<!-- 핸드폰 번호 -->
						<div class="form_itembx">
							<div class="inputbx">
								<label class="hidden_label" for="forget_1">핸드폰 번호</label> <input
									id="lMemberPhone" type="text" class="text_inputbx"
									placeholder="핸드폰 번호" data-validation="required"
									name="phoneNumber">
								<p class="form_allet error alert_error" style="display: none"
									data-input-name="name"></p>
							</div>
						</div>
						<!-- .핸드폰 번호 -->
						<!-- e-mail -->
						<div class="form_itembx">
							<div class="inputbx">
								<label class="hidden_label" for="forget_2">E-mail</label> <input
									id="lMemberMail" type="email" class="text_inputbx"
									placeholder="E-mail" data-validation="required" name="email">
								<p class="form_allet error alert_error" style="display: none"
									data-input-name="email"></p>
							</div>
						</div>
						<!-- .e-mail -->
						<div class="form_sub_btnbx">
							<button type="button" class="basic_btn black" id="findIdBtn">아이디 찾기</button>
							
						</div>
					</form>
					</div>
					
					
					<!-- .아이디 찾기 -->

					<!-- 비밀번호 찾기 -->
					
					<div id="findPwdDiv">
					<div id="captionPwd"><span style="font-size:24pt; color:white">비밀번호 찾기</span></div>
					<form action="" method="POST" name="form_find_pwd"
						id="form_find_pwd">
						<input type="hidden" name="action" value="a_find_pwd"> <input
							type="hidden" name="nonce" value="91e1661a50" />
						<!-- 아이디 -->
						<div class="form_itembx">
							<div class="inputbx">
								<label class="hidden_label" for="forget_1">아이디</label> <input
									id="rMemberId" type="text" class="text_inputbx"
									placeholder="아이디" data-validation="required" name="name">
								<p class="form_allet error alert_error" style="display: none"
									data-input-name="name"></p>
							</div>
						</div>
						<!-- .아이디 -->
						<!-- 핸드폰 번호 -->
						<div class="form_itembx">
							<div class="inputbx">
								<label class="hidden_label" for="forget_1">핸드폰 번호</label> <input
									id="rMemberPhone" type="text" class="text_inputbx"
									placeholder="핸드폰 번호" data-validation="required"
									name="phoneNumber">
								<p class="form_allet error alert_error" style="display: none"
									data-input-name="name"></p>
							</div>
						</div>
						<!-- .핸드폰 번호 -->
						<!-- e-mail -->
						<div class="form_itembx">
							<div class="inputbx">
								<label class="hidden_label" for="forget_2">E-mail</label> <input
									id="rMemberMail" type="email" class="text_inputbx"
									placeholder="E-mail" data-validation="required" name="email">
								<p class="form_allet error alert_error" style="display: none"
									data-input-name="email"></p>
							</div>
						</div>
						<!-- .e-mail -->
						<div class="form_sub_btnbx">
							<button type="button" class="basic_btn black" id="findPwdBtn">비밀번호 찾기</button>
						</div>
					</form>
					</div>
					<!-- .비밀번호 찾기 -->
					</div>
					<!-- tempDiv끝 -->
				</div>
			</div>
			<!-- .리스트 -->
			<!-- .컨텐츠 시작 -->
		</div>
	</div>
</body>
</html>