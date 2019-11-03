<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>게시판 관리</title>
  <meta charset="utf-8">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel='stylesheet' id='mycss'  href='http://192.168.43.115:8083/webProject/css/mycss.css' type='text/css' media='all' />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

 <style>
  	#sidebar{
  		float: left;
  	}
  	#sidebar:before, #sidebar:after{
  		clear:both;
  		content:"";
  	}
	.mana{
  		background-image: url("http://192.168.43.115:8083/webProject/images/header.jpg") !important;
  		background-repeat: no-repeat;
  		background-size: cover;
  	}
  	#btn-info{
  		margin: 0;
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
   	 <div class="well text-center mana" style="color:white;">
   	 		<h2 style="font-weight:bold;">게시판 관리</h2>    
 	 	</div>
        <div class="col-sm-10">
          <div class="well" style="height:100%;background:white;">
            <div class="container-fluid">
			  
			  <form id="deleteform">
			  <h4 style="font-weight:bold;">게시판 관리</h4><br> 
			 	<div class="">
					<select class="form-control col-md-6" style="width:150px" name="searchWay">
						<option  id="memberId">운영자아이디</option>
						<option  id="boardName">게시판명</option>
						<option  id="themeName">테마명</option>
					</select>
					<input type="text" name="keyword" id="keyword" class="form-control col-md-4" style="width:200px"/>
					<!-- <button type="button" id="btn-info" class="btn button">검색</button> -->
					<a href="#" id="btn-info" class="btn button" style="font-weight: bold;">검색</a>
				</div>  
				<br>     
			  <table class="table table-striped active" id="tb">
			    <thead>
			      <tr>
			     	<th><input type="checkbox" class="chechall" id="checkall"/></th>
			        <th>게시판명</th>
			        <th>운영자</th>
			        <th>테마명</th>
			      </tr>
			    </thead>
			   <%--  <%@ page import="java.util.*" %>
			    <%@ page import="com.lecto.forward.vo.BoardSearchVO" %>
			    <%
			    	List<Object> boardViewList = Arrays.asList(request.getAttribute("boardViewList"));
			    	for(int i=0;i<boardViewList.size();i++){
			    		
			    	}
			    %> --%>
			    		
			     <c:forEach var="board" items="${boardViewList}" varStatus ="status" >
			    	<tr id="tr" style="cursor: pointer;"> 
			    		<td><input type="checkbox" class="checkthis" name="boardCode00" id="boardCode00" value="${board.boardCode }"></td>
			    		<td id="view" ><input type="hidden" id="boardName2" name="boardName2" value="${board.boardName }">${board.boardName }</td>
			    		<td id="view">${board.memberId }</td>
			    		<td id="view">${board.themeName }</td>
			    		<td id="view"><input type="hidden" name="boardCode"  id="boardCode" value="${board.boardCode }" ></td>
			    	</tr>
			    </c:forEach> 

			  </table>   
			  
			  
			  <a href="#" id="btn_delete" class="btn button pull-right" style="font-weight: bold;">삭제</a>
			  <a href="#" id="btn_update" class="btn button pull-right" style="font-weight: bold;">수정</a>
			  <a href="#" id="btn_add" class="btn button pull-right" style="font-weight: bold;">게시판 추가</a>
			  </form>
			  
			</div>
          </div>
        </div>
	</div>
</body>
<script>
	$(document).ready(function(){
	/* 	$("#checkall").click(function(){
			$(".checkthis").prop('checked', $(this).prop('checked'));
		}); */
		
		$('#tb #tr').click(function(){
			var tr = $(this);
			var td  = tr.children();
			var tmp = td.eq(1).text(); 
			var $form =$('<form></form>');;
			$form.attr('action','/a_articlelist');
			$form.attr('method','get');
			$form.appendTo('body');
			var input2 = '<input type="hidden" value="' + tmp + '" name="selectBoardName">';
			$form.append(input2);
			$form.submit();
		});  
		
		$('#tb tr').on('click', ':checkbox', function(e) {
		    e.stopPropagation();
		});
		
		/**게시글 수정*/
		$('#btn_update').click(function(){
			var check=$('input:checkbox[name=boardCode00]:checked').length;
			var job=$('.checkthis:checked').val(); 
			var $form = $('#deleteform');
			$form.attr('method','get');
			$form.attr('action', '/a_editboard');
			$form.appendTo('body');
			if(check==1){
				 var input='<input type="hidden" value="'+job+'" name="clickboardCode">'; 
				$form.append(input);	
			}else if(check==0){
				alert("수정할 게시판을 선택해 주세요.");
				var input='<input type="hidden" value="f" name="clickboardCode">'; 
				$form.append(input);	
			}
			else{
				alert("게시판 수정은 한개만 선택 해주세요.");
				var input='<input type="hidden" value="f" name="clickboardCode">'; 
				$form.append(input);	
			}
			$form.submit();
			
		});
		/**게시판 추가*/
 		$('#btn_add').click(function(){
				var $form = $('#deleteform');
				$form.attr('method','post');
				$form.attr('action', '/ad_addboardView');
				$form.appendTo('body');
				$form.submit();
			}); 
		
 		/**검색어 입력해서 검색*/
		$('#btn-info').click(function(){
			var tmp = $('select[name="searchWay"]').val();
			var tm2 = $('#keyword').val();
			var $form = $('#deleteform');
			$form.attr('method','post');
			$form.attr('action', '/searchBoardWay');
			$form.submit(); 
			
		 	 /* $.ajax({
				type:"POST",
				url:"/searchBoardWay",
				data:{ searchWay:tmp,keyword:tm2} 
			});  */
		}); 
		 
		/**삭제할 게시판 선택후 삭제*/
		$("#btn_delete").click( function() {
			 $("input[name=boardCode00]:checked").each(function() {
				var test = $(this).val();
			});
			var $form = $('#deleteform');
			$form.attr('action', '/deleteBoardList');
			$form.attr('method', 'post');
			$form.appendTo('body');
		    $form.submit();   
		});
		
	}); 
</script>
</html>