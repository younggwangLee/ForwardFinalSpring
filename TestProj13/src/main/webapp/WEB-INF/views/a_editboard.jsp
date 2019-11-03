<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  	 	 	#btn_addGrade{
  		margin: 4px 20px 0;
  	}
	.aedit{
  		/* background: #EAEAEA !important; */	
  		background-image: url("http://192.168.43.115:8083/webProject/images/header.jpg");
  		background-repeat: no-repeat;
  		background-size: cover;
  	}
 	#btn_addGrade, #btn_deleteGrade{
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
   	 <div class="well text-center aedit">
   	 	<h2 style="font-weight:bold;color:white;">자유 게시판 관리</h2>   
 	 </div>
 	 	<form id="updateform" >
        <div class="col-sm-10">
          <div class="well" style="height:100%;background:white;">
            <div class="container-fluid">
			  <h4 style="font-weight:bold;">${boardDTO.boardName} 수정</h4><br>  
			  <input type="hidden" name="boardCode" value="${boardDTO.boardCode }">
			  

			<article class="container">
            <div class="col-sm-6 col-md-offset-3"> 
                
                    <div class="form-group">
						<label for="boardName">게시판명</label>
                        <input type="text" class="form-control" id="boardName" name="boardName" placeholder="게시판명을 입력해 주세요" value="${boardDTO.boardName }">
                    </div>
                    <label for="divgrade">게시판 등급 설정
                    		
                   			<!-- <input type="button" class="Radios2 button" id="btn_addGrade" value="추가"> -->
                   			<a type="button" class="btn button" id="btn_addGrade" >추가</a>
                    		<!-- <input type="button" class="Radios2" id="btn_deleteGrade" value="삭제"> -->
                    		<a type="button" class="btn button" id="btn_deleteGrade" >삭제</a>
                    </label>
                    <div class="form-group grade">
                    	<br>
                        <div class="table-responsive text-center">
                        	<table class="table" style="width:100%">
                        		<thead>
	                        		<tr>
	                        			<th width="30%">레벨</th>
	                        			<th>&nbsp;</th>
	                        			<th>등급명</th>
	                        			<th>등업기준</th>
	                        		</tr>
                        		</thead>
                        		<tbody id=tbody>
                        			<c:forEach var="grade" items = "${gradeDTO }" varStatus="status">
                        			<tr>
                        				<td width="30%"><span>${status.index+1 }</span><%-- <input type="hidden" value="${status.index+1}" id="gradeIndex"> --%></td>
                        				<td><input type="hidden" name="gradeNum" value="${grade.gradeNum}"></td>
                        				<td><input type="text" id="gradeName" name="gradeName" value="${grade.gradeName}"></td>
                        				<td><input type="text" id="articleCount" name="articleCount" value="${grade.articleCount}"></td>
                        			</tr>
                        			</c:forEach>
                        		</tbody>
                        	</table>
                        </div>
                    </div>
                    <label for="year">등급업 기준일 변경</label>
                    <div class="grade2">
	                    <div class="form-group"><input type="hidden" name="test" id="test" value="${boardDTO.gradeUpDate}">
							<script class="birth_sc">
								var test = $('#test').val();
								document.write("<select name='gradeUpDate'>");
								if(test!=null){
									document.write("<option value='"+ test +"'>"+test+"</option>");
								}
								for (i=1;i<=31;i++) document.write("<option value=' "+ i +" '>"+i+"일</option>"); 
								document.write("</select> </font>");
							</script>
	                    </div>
                    </div>
                    <div class="form-group text-center">
                        <a class="btn button" id="themeChange">
                          	  등록<i class="fa fa-check spaceLeft"></i>
                        </a>
                        <c:if test ="${sessionScope.login == 'admin'}">
                        <a href="/ad_boardlist" type="button" class="btn button">
                           	 취소<i class="fa fa-times spaceLeft"></i>
                        </a>
                        
                        </c:if>
                        <c:if test ="${sessionScope.login ne 'admin'}">
                        	<input type="button" class="btn button" id="goListBtn" value="취소">
                        </c:if>
                    </div>
               
            </div>
        </article>
        </div>
        </div>
        </div>
        </form>
</div>  
</body>
    <script>
	$(document).ready(function() {
	    
		$('#goListBtn').click( function() {
			var bn = $('#boardName').val();
			location.href = '/a_articlelist?selectBoardName='+bn;
		});
		
	    var i=${size}+1;
		var j=0;
		
	    $('#themeChange').click(function(){
	    	$('#updateform').attr("method", "post");
	    	$('#updateform').attr("action", "a_editboard");
	    	$('#updateform').submit();
	    }); 
	    
		$('#btn_addGrade').click(function(){	
		 	$('#tbody').append(
	    			$('<tr>').append($('<td  width="30%"><span>'+(i-j)+'</span></td>'),		
	    			$('<td>').append('<input type="hidden" name="gradeNum" value="'+i+'"></td>'),
	    					$('<td>').append('<input type="text"  id="gradeName" name="gradeName"></td>'),
	    					$('<td>').append('<input type="text"  name="articleCount"></td>') /*,
	    					$('<td>').append('<input type="button" class="col-sm-10 Radios2" id="btn_deleteGrade" name="btn_deleteGrade" value="삭제"></td>')*/) )
	    					i++; 
	    });
		
		 $('#btn_deleteGrade').click(function(){
			if((i-j)>2){
				$('#tbody tr:last').remove();		//마지막 행 삭제	
				j++;
			}
		}); 
	    
	    
	});
</script>
</html>