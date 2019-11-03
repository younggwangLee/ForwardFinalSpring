<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>게시판 관리</title>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel='stylesheet' id='my-css'  href='http://192.168.43.115:8083/webProject/css/mycss.css' type='text/css' media='all' />
<style>
#sidebar {
	float: left;
}

#sidebar:before, #sidebar:after {
	clear: both;
	content: "";
}
#searchButton{
	margin: 0; 
}
.artl{
  		/* background: #EAEAEA !important; */	
  		background-image: url("http://192.168.43.115:8083/webProject/images/header.jpg");
  		background-repeat: no-repeat;
  		background-size: cover;
  	}

</style>
</head>
<body>
	<div id="header">
		<%@ include file="adminheader.jsp"%>
	</div>
	<div id="sidebar">
		<%@ include file="adminsidebar.jsp"%>
	</div>
	<div id="content">
		<div class="well text-center artl" style="color:white;">
			<h2 style="font-weight: bold;">${selectBoardName}&nbsp;관리</h2>
		</div>
		
		<form id="formValue">

			<div class="col-sm-10">
				<div class="well" style="height: 100%; background: white;">
					<div class="container-fluid">
						<h4 style="font-weight: bold;">${selectBoardName}&nbsp;관리</h4>		
						<input type="hidden" name="selectBoardCode" value="${selectBoardCode}">
						<input type="hidden" name="selectBoardName" value="${selectBoardName}">					
						<br>
						<div class="">
							<select id="searchWay" name="searchWay" class="form-control col-md-6" style="width: 150px">
								<option value="nickname">닉네임</option>
								<option value="title">제목</option>
								<option value="content">내용</option>
							</select>
							<input type="text" name="keyword" class="form-control col-md-4" style="width: 200px" />
							<a href="#" class="btn button" id="searchButton" style="font-weight: bold;">검색</a>
						</div>
						<br>
						<table class="table table-striped active" id="tb">
							<thead>
								<tr>
									<th><input type="checkbox" id="checkall"></th>
									<th>글번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일자</th>
									<th>조회수</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${articlelist}" var="articleVO">
										<tr id="tr" style="cursor:pointer;">
											<td><input type="checkbox" class="checkthis" name="chk"  value="${articleVO.articleCode}"></td>
											<!-- no -->
											<td>${articleVO.articleCode}</td>
											<!-- 제목 -->
											<td>${articleVO.articleTitle}</td>
											<!-- 작성자 -->
											<td>${articleVO.memberNickname}</td>
											<!-- 작성일 -->
											<td>${articleVO.articleDate}</td>
											<!-- 조회수-->
											<td><span class="badge bg-red">${articleVO.articleHits }</span></td>
										</tr>
									</c:forEach>
							</tbody>
						</table>
						<hr />
						<div class="text-center">
							<ul class="pagination">
								<!-- 이전 페이지로 가는 링크가 있어야 하는지 boolean 값으로 if 조건식을 통해 처리 -->
								<c:if test="${pageMaker.prev }">
									<li><a href="/a_articlelist${pageMaker.makeQuery(pageMaker.startPage - 1 )}&selectBoardName=${selectBoardName}">&laquo;</a></li>
								</c:if>
								<!-- 각 페이지 번호의 출력 -->
								<c:forEach begin="${pageMaker.startPage }"
									end="${pageMaker.endPage }" var="idx">
									<li
										<c:out value="${pageMaker.cri.page == idx?'class = active':'' }"/>>
										<a href="/a_articlelist${pageMaker.makeQuery(idx)}&selectBoardName=${selectBoardName}">${idx}</a>
									</li>
								</c:forEach>
		
								<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
									<li><a href="/a_articlelist${pageMaker.makeQuery(pageMaker.endPage + 1 )}&selectBoardName=${selectBoardName}">&raquo;</a></li>
								</c:if>
							</ul>
						</div>
						
						<!-- <button class="btn btn-danger pull-right" id="removeBtn">삭제</button> -->
						<a href="#" class="btn button pull-right" id="removeBtn" style="font-weight: bold;">삭제</a>
						<!-- <button class="btn btn-success pull-right" id="addBtn">글쓰기</button> -->
						<a href="#" class="btn button pull-right" id="addBtn" style="font-weight: bold;">글쓰기</a>
						<!-- <button class="btn btn-warning pull-left" id="themeChange">테마 변경</button> -->
						<a href="#" id="themeChange" class="btn button" style="font-weight: bold;">테마 변경</a>
						<!-- <button class="btn btn-primary pull-left" id="editBtn">게시판수정</button> -->
						<a href="#" id="editBtn" class="btn button" style="font-weight: bold;">게시판수정</a>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
<script>
	$(document).ready(function() {
		var c =$('input[name=selectBoardCode]').val();
		var n =$('input[name=selectBoardName]').val();

		$('#tb #tr').click(function(){
			var tr = $(this);
			var td  = tr.children();
			var tmp = td.eq(1).text();
			var $form =$('<form></form>');
			$form.attr('action','/a_detailarticle');
			$form.attr('method','get');
			$form.appendTo('body');
			var input1 = '<input type="hidden" value="' + tmp + '" name="selectArticleCode">';
			var input2 = '<input type="hidden" value="' + c + '" name="selectBoardCode">';
			var input3 = '<input type="hidden" value="' + n + '" name="selectBoardName">';
			$form.append(input1);
			$form.append(input2);
			$form.append(input3);
			$form.submit();
		}); 
		 
		$('#tb tr').on('click', ':checkbox', function(e) {
			    e.stopPropagation();
		});
		
		$('#addBtn').click( function() {
			var $form = $('#formValue');
			$form.attr('action', '/a_addarticle');
			$form.attr('method', 'get');
			$form.appendTo('body');
		    $form.submit();
		});
		
		$('#editBtn').click( function() {
			var $form = $('#formValue');
			$form.attr('action', '/a_editboard');
			var input1 = '<input type="hidden" value="' + c + '" name="clickboardCode">';
			$form.append(input1);
			$form.attr('method', 'get');
			$form.appendTo('body');
		    $form.submit();
		});
		
		$('#removeBtn').click(function() {
			$("input[name=chk]:checked").each(function() {
				alert($(this).val());
				if($(this).val()=="" || $(this).val()==null){
					alert("삭제할 게시글을 선택해 주세요.");
				}else{
					var $form = $('#formValue');
					$form.attr('action', '/a_articlelist/delete');
					$form.attr('method', 'post');
					$form.appendTo('body');
				    $form.submit();							
				}
			});
		});
		
		$("#checkall").click(function(){
			$(".chk").prop('checked', $(this).prop('checked'));
		});
		
		// 검색
		$('#searchButton').click( function() {
			var kw =$('input[name=keyword]').val();
			if(kw != null){
				 var $form = $('#formValue');
			     $form.attr('action', '/a_articlelist/search');
			     $form.attr('method', 'GET');
			     $form.appendTo('body');
			     $form.submit();
			} else{
				alert('검색어를 입력해주세요.');
			}
		});
		
		$('#themeChange').bind("click",function(){
			var $form = $('#formValue');
			$form.attr('action','/a_theme');
			$form.attr('method','get');
			$form.appendTo('body');
			var code = '<input type="hidden" value="' + c + '" name="boardCode">';
			$form.append(code);
			$form.submit();
		});
	});
</script>
</html>