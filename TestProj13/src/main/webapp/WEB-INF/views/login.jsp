<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="userheader.jsp" %>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=0">
	<meta name="format-detection" content="telephone=no">
	<link rel="shortcut icon" href="favicon.ico">
	<link rel="profile" href="http://gmpg.org/xfn/11">
<title>Smash Sports Matching</title>
<link rel='dns-prefetch' href='//code.jquery.com' />
<link rel='dns-prefetch' href='//fonts.googleapis.com' />
<style type="text/css">
img.wp-smiley,
img.emoji {
	display: inline !important;
	border: none !important;
	box-shadow: none !important;
	height: 1em !important;
	width: 1em !important;
	margin: 0 .07em !important;
	vertical-align: -0.1em !important;
	background: none !important;
	padding: 0 !important;
}


.max_container{
	width: 100%;
	text-align:center;
} 
.max_container > ul{
	padding: 0 0 0 40%;
}
.top{
	padding: 0 0 0 87%;
}
</style>
<link rel='stylesheet' id='dashicons-css'  href='http://192.168.43.115:8083/webProject/css/dashicons.min.css' type='text/css' media='all' />
<link rel='stylesheet' id='post-views-counter-frontend-css'  href='http://192.168.43.115:8083/webProject/css/frontend.css?ver=4.7.3' type='text/css' media='all' />
<link rel='stylesheet' id='twentysixteen-fonts-css'  href='https://fonts.googleapis.com/css?family=Montserrat%3A400%2C700%7CInconsolata%3A400&#038;subset=latin%2Clatin-ext' type='text/css' media='all' />
<link rel='stylesheet' id='genericons-css'  href='http://192.168.43.115:8083/webProject/css/genericons.css?ver=3.4.1' type='text/css' media='all' />
<link rel='stylesheet' id='twentysixteen-style-css'  href='http://192.168.43.115:8083/webProject/css/styleSmash.css?ver=4.7.3' type='text/css' media='all' />
<link rel='stylesheet' id='jquery-ui-css'  href='http://192.168.43.115:8083/webProject/css/jquery-ui.min.css' type='text/css' media='all' />
<link rel='stylesheet' id='unslider-css'  href='http://192.168.43.115:8083/webProject/css/unslider.css' type='text/css' media='all' />

<script type='text/javascript' src='http://192.168.43.115:8083/webProject/js/jquerySmash.js'></script>
<script type='text/javascript' src='http://192.168.43.115:8083/webProject/js/jquery-migrate.min.js'></script>
<script type='text/javascript' src='http://code.jquery.com/ui/1.11.4/jquery-ui.min.js'></script>
<script type='text/javascript' src='http://192.168.43.115:8083/webProject/js/unslider.js'></script>
<link rel="alternate" type="text/xml+oembed" href="./json/embed.json" />
<style type="text/css">.recentcomments a{display:inline !important;padding:0 !important;margin:0 !important;}</style>
	
	<link rel="stylesheet" href="http://192.168.43.115:8083/webProject/css/metabrain-editor.css" type="text/css" media="all">
	<script type="text/javascript" src="http://192.168.43.115:8083/webProject/js/common.js"></script>
</head>

<body class="page-template page-template-templates page-template-login page-template-templateslogin-php page page-id-300 group-blog">
<!-- <div class="site_wrap">모바일 메뉴 버튼 클릭시 m_nav_on 클래스 적용 -->

<div id="page" class="site">
	<div class="site-inner">
		<div id="content" class="site-content">
<div id="primary" class="content-area">
	<div id="main" class="site-main" role="main">
		<div class="content_rowbx">
			<div class="max_container">
				<article id="post-300" class="post-300 page type-page status-publish hentry">
					<div class="entry-content">
						<!-- 컨텐츠 시작 -->
						<!-- 리스트 -->
						<div class="form_listbx login">
						
							<form name="form_login"  action="login" method="POST">
							<!-- 나중에 index에서 데이터 끌고와서 회원가입 페이지까지 가져가는걸로 바꾸기 -->
							<%-- <input type="hidden" id="idRegEx" value="${idRegEx}">
							<input type="hidden" id="nickRegEx" value="${nickRegEx}">
							<input type="hidden" id="pwdRegEx" value="${pwdRegEx}"> 	 --%>
								<div class="container" style="height:130px;"><br/></div>
								<div class="form_container">
									<h3><span class="icon_text" style="color:gray">LOGIN</span></h3>
									<!-- 모듈 -->
									<div class="form_itembx">
										<div class="inputbx">
											<label class="hidden_label" for="login_10">아이디</label>
											<input id="memberId" type="text" class="text_inputbx" placeholder="아이디" name="memberId" data-validation="required">
											
											<p class="form_allet error alert_error" style="display:none" data-input-name="user_login"></p>
										</div>
									</div>
									<!-- .모듈 -->
									<!-- 모듈 -->
									<div class="form_itembx">
										<div class="inputbx">
											<label class="hidden_label" for="login_11">비밀번호</label>
											<input id="memberPwd" type="password" class="text_inputbx" placeholder="비밀번호" name="memberPwd" data-validation="required">
											<p class="form_allet error alert_error" style="display:none" data-input-name="password"></p>
										</div>
									</div>

									<!-- .모듈 -->
									<div class="form_sub_btnbx">
										<input type="submit" value="로그인" class="basic_btn black" id="loginBtn">
									</div>
									<div class="form_linkbx">
										<ul>
											<li><span class="text">*아이디와 비밀번호를 잊으셨나요?</span><a href="/find_id_pwd" class="btn gray">id/pw 찾기</a></li>
											<li><span class="text">*회원이 아니신가요?</span><a href="/m_signuppage" class="btn orange">회원가입</a></li>
										</ul>
									</div>
								</div>
							</form>
						</div>
						<!-- .리스트 -->
						<!-- .컨텐츠 시작 -->
					</div><!-- .entry-content -->
				</article><!-- #post-## -->
			</div>
		</div>
	</div><!-- .site-main -->

</div><!-- .content-area -->

<script type="text/javascript">
jQuery(document).ready(function($){
	
	
/* 	 var $form =  $('form[name="form_login"]');
	$form.submit(function(e){
		
		e.stopPropagation();
	
		e.preventDefault();

		var self = $(this);

		if(!isValid($(this), false) ) {
			scrollToErrorMsg();
			return false;
		}
		
		//맞으면 ajax를 사용해서 사용자를 로그인 시키고 로그인한 회원의 정보를 메인 화면에 보여준다.
		var memberId=$('#memberId').val();
		var memberPwd=$('#memberPwd').val();
	
		 $.ajax({
			
			type: "POST",
			url: ""
			data: {"memberId":memberId,"memberPwd":memberPwd},
			success: function(data){
				if(data=="True"){
					alert("aa");
				}else if(data=="False"){
					alert("bb");
				}
			
			}	
		}); 
	}); */
	
	
});
</script>
		</div><!-- .site-content -->
	</div><!-- .site-inner -->
</div><!-- .site -->


<!-- </div> -->

</body>
</html>
