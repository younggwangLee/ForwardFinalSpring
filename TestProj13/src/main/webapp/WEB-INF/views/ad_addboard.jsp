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
  	
  	#btn_addGrade{
  		margin: 4px 20px 0;
  	}
  	.meml{
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
   	 <div class="well text-center meml">
   	 	<h2 style="font-weight:bold;color:white;">게시판 관리</h2>   
 	 </div>
 	 	
        <div class="col-sm-10">
          <div class="well" style="height:100%;background:white;" >
            <div class="container-fluid">
			  <h4 style="font-weight:bold;">게시판 추가</h4><br>  

			<article class="container">
            <div class="col-sm-6 col-md-offset-3">
                <form id="addform" action="/ad_addboard"  role="form" method="post">

                    <div class="form-group">
						<label for="board_name">게시판명</label>
                        <input type="text" class="form-control" id="boardName" name="boardName" placeholder="게시판명을 입력해 주세요">
                    </div>
                    <label for="divgrade">게시판 등급 설정  
                    		<input type="button" class="Radios2" id="btn_addGrade" value="추가">
                    		<input type="button" class="Radios2" id="btn_deleteGrade" value="삭제">
                    
                    </label>
                    <div class="form-group grade">   
                    	<br>
                    	
                        <div class="table-responsive text-center">
                        	<table class="table" style="width:100%" id="tbl">
                        		<thead>
	                        		<tr>
	                        			<th width="30%">레벨</th>
	                        			<th>&nbsp;</th>
	                        			<th>등급명</th>
	                        			<th>등업기준</th>
	                        		</tr>
                        		</thead>
                        		<tbody id=tbody>
                        			<tr>	
                        				<td  width="30%" ><span>1</span></td>
                        				<td><input type="hidden" name="gradeNum" value="1"></td>
                        				<td><input type="text" class="col-sm-10" name="gradeName"></td>
                        				<td><input type="text" class="col-sm-10" name="articleCount"></td>
                        				<td width="10%"><span></span></td>
                        			</tr>
                        			<!-- <tr>
                        				<td id="gradeNum2"><span>2</span></td>
                        				<td><input type="hidden" name="gradeNum2" value="2"></td>
                        				<td><input type="text" class="col-sm-10" name="gradeName2"></td>
                        				<td><input type="text" class="col-sm-10" name="articleCount2"></td>
                        			</tr>
                        			<tr>
                        				<td id="gradeNum3"><span>3</span></td>
                        				<td><input type="hidden" name="gradeNum3" value="3"></td>
                        				<td><input type="text" class="col-sm-10"name="gradeName3" ></td>
                        				<td><input type="text" class="col-sm-10" name="articleCount3"></td>
                        			</tr> -->
                        		</tbody>
                        	</table>
                        </div>
                    </div>
                    <label for="year">등급업 기준일 변경</label>
                    <div class="grade2"> 
	                    <div class="form-group">
							<script class="birth_sc">
								document.write("<select name='gradeDate'>");
								for (i=1;i<=31;i++) document.write("<option>"+i+"일"); 
								document.write("</select> </font>");
							</script>
	                    </div>
                    </div>
                    <div class="form-group text-center">
                        <!-- <a href="./ad_boardlist.jsp" class="btn btn-success" id="themeChange">
                          	  등록<i class="fa fa-check spaceLeft"></i>
                        </a> -->
                       <input type="hidden" name="job" value="addBoard">
                        <a class="btn button" style="font-weight: bold;" id="addBoard">등록</a>
                        <a href="/ad_boardlist" class="btn button" style="font-weight: bold;" id="addCencle">
                           	 취소<i class="fa fa-times spaceLeft"></i>
                        </a>
                    </div>
                </form>
            </div>
        </article>
        </div>
        </div>
        </div>
</div>  
</body>
    <script>
	$(document).ready(function() {
		var i=2;
		var j=0;
		$('#btn_addGrade').click(function(){
			
		 	$('#tbody').append(
	    			$('<tr>').append($('<td  width="30%"><span>'+(i-j)+'</span></td>'),
	    					$('<td>').append('<input type="hidden" name="gradeNum" value="'+i+'"></td>'),
	    					$('<td>').append('<input type="text" class="col-sm-10" name="gradeName"></td>'),
	    					$('<td>').append('<input type="text" class="col-sm-10" name="articleCount"></td>') /*,
	    					$('<td>').append('<input type="button" class="col-sm-10 Radios2" id="btn_deleteGrade" name="btn_deleteGrade" value="삭제"></td>')*/) )
	    					i++;
		 
	    });
		
		$('#btn_deleteGrade').click(function(){
			if((i-j)>2){
			$('#tbody tr:last').remove();		//마지막 행 삭제	
			j++;
			}
		});
		
		$('#addBoard').click(function(){
			$form = $('#addform');
			$form.submit();
		});
	 	/* $('#tbody #btn_deleteGrade').click(function(){
			alert("gg");
			$(this).parent().parent().remove();
		});  */	//안되는 코드 왜??
    
/* 
	     $('.Radios2').click(function(){
		    	var radio = $('input[name="divgrade"]:checked'	).val();
		    	var input;
		    	alert(radio);
		    	/* for(var i=0;i<radio;i++){
		    		alert("input type='hidden' name='gradeNum' "+(radio+1)+" 'value=(radio+1)'";
		    	} */		    	
		    	/* for(var i=0;i<radio;i++){
		    		/* input='<tr><td><input type="hidden" name="gradeNum" '+(radio+1)+' "value='(radio+1)'" ></td>'
		    		+'<td><input type="text" class="col-sm-10" name="gradseNume" '+(radio+1)' "></td>'
		    		+'<td><input type="text" class="col-sm-10" name="articleCount" '+(radio+1)+' "></td></tr>'; 
		    		$('#tbody').append('<tr><td><input type="hidden" name="gradeNum" '+(radio+1)+' "value='(radio+1)'" ></td>'
				    		+'<td><input type="text" class="col-sm-10" name="gradseNume" '+(radio+1)' "></td>'
				    		+'<td><input type="text" class="col-sm-10" name="articleCount" '+(radio+1)+' "></td></tr>');
		    		 $('#tbody').eq(-1).after(input); 
		    	} 
		    }); */
	 	
	 
	    $('#fourtier').change(function() {
	        if(this.checked) {
	            
	        }        
	    });
	    
	    
	});
</script>
</html>