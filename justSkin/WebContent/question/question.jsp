<%@page import="com.question.db.QuestionDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>피부진단 | JUST SKIN</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="./img/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="./vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="./vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./css/util.css">
	<link rel="stylesheet" type="text/css" href="./css/login.css">
	<link rel="stylesheet" href="./css/topimage.css" type="text/css">
<!--===============================================================================================-->



    <meta name="description" content="Yoga Studio Template">
    <meta name="keywords" content="Yoga, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>피부진단 | JUST SKIN</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:100,200,300,400,500,600,700,800,900&display=swap"
        rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="./css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="./css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="./css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="./css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="./css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="./css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="./css/style.css" type="text/css">
    <link rel="stylesheet" href="./css/question/question.css" type="text/css">

	<!-- jquery 준비 시작 -->
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<!-- jquery 준비 끝 -->

</head>
<body>

	<!-- header 시작 -->
 		<jsp:include page="../header/header.jsp" />
	<!-- header 끝 -->
	
  <!-- Page Add Section Begin -->
    <section class="page-add">
        <div class="container">
            <div class="row" >
                <div class="col-lg-4">
                    <div class="page-breadcrumb">
                        <h2 style="font-size: 40px;">나의 피부타입은<span>?</span></h2>
                          <a href="./Main.me">Home</a>
                        <a href="./MemberInfo.me">SKIN TYPE</a>
                        <a class="active" href="">나의 피부타입</a>
                    </div>
                </div>
                <div class="col-lg-8">
                     <div class="row">
                    <div class="col-lg-12" id="topimg_bg">
                       <div id="topimg_ch" >
                        <h1>2021</h1>
                        <h2>BEST SELLER.</h2>
                      </div>
                        </div>
               </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Page Add Section End -->
    
	<!-- container 시작 -->	
	<div class="container-fluid">	
		
		<div class="row mt-5">
			<div class="col-2"></div>
			<div class="col-8 text-center"></div>
			<div class="col-2 mt-3">
				<c:if test="${userId eq 'admin' }">
					<button type="button" class="btn btn-secondary" id="write">글쓰기</button>
					<button type="button" class="btn btn-secondary" id="setting">⚙</button>
				</c:if>
			</div>
		</div>
		
		<div class="row m-5">
			<div class="col-2">
			</div>
			<div class="col-8 text-center">	
				
				
				<br>
				
				<c:forEach var="i" items="${ queQueList }">
				
				<div class="mt-4" id="que">${i.qnum}. ${i.qsub}</div>
				<div class="mt-3" id="div1">
								
					<c:forEach var="j" begin="0" end="4" step="1">
						<label class="box-radio-input">
							<input type="radio" name="${i.qnum}" value="${j }" id="radio">
							<span>
								<c:if test="${j eq 0}"> 아니다</c:if>
								<c:if test="${j eq 1}"> 조금그렇다</c:if>
								<c:if test="${j eq 2}"> 보통이다</c:if>
								<c:if test="${j eq 3}"> 그렇다</c:if>
								<c:if test="${j eq 4}"> 매우그렇다</c:if>
							</span>
						</label>

					 </c:forEach>
					 
				</div>
				
				<c:if test="${userId eq 'admin' }">
				<button type="button" class="btn btn-primary btn-sm" onclick="location.href='./QueRevise.que?Qnum=${i.qnum}'"> 수정 </button>
				 <button type="button" class="btn btn-danger btn-sm" onclick="location.href='./QueDelete.que?Qnum=${i.qnum}'">삭제</button>
				</c:if>
				
				<hr>
				
      			</c:forEach>
				
			</div>
			<div class="col-2">	
			</div>
			
		</div>
		
		<div class="row m-4">
				<div class="col-5"></div>
				<div class="col-2">
				
				
				<c:if test="${empty pageNum }">
					<c:set var="pageNum" value="1" />
				</c:if>		
				
				<c:if test="${cnt != 0}">
				
					<c:set var="pageCount" value="${cnt/pageSize+(cnt % pageSize == 0? 0:1)}"/>
					
					<c:set var="pageBlock" value="3"/>
					
					<fmt:parseNumber var= "startPage" integerOnly= "true" value="${((currentPage-1)/2) * 2 + 1}" />
					
					<c:set var="endPage" value="${startPage + pageBlock-1 }"/>
					
					
						<c:if test="${currentPage < pageCount}">
						
							<form action="./Question.que?pageNum=${currentPage + 1}" method="post" >
					    		<input class="login100-form-btn" type="submit" value="다음으로" id="submit" onclick="return check()" style='cursor:pointer;'> 
					    	</form>
							
						</c:if>
						
						<c:if test="${currentPage == pageCount}">
						
							<form action="./QuestionConfirm.que" method="post">
						    	<input class="login100-form-btn" type="submit" value="제출하기" id="submit" onclick="return check()" style='cursor:pointer;'> 
						    	<input type="hidden" value="" name="sum" id="sum">
						    </form>	
						
						</c:if>
						
					
				</c:if>
					
				</div>
				<div class="col-5"></div>
			</div>
	</div>
	<!-- container 끝 -->	
	
	<!-- Page Add Section Begin -->
    <section class="page-add" style="margin-bottom: 100px;">
        <div class="container">
        </div>
    </section>
    <!-- Page Add Section End -->
	
	
	<!-- footer 시작 -->
   		<jsp:include page="../footer/footer.jsp" />
    <!-- footer 시작 -->



	<script type="text/javascript">
		
		// 글쓰기 버튼 시작
    	$('#write').click(function() {
    		location.href='./QueWrite.que';
		});    	
    	// 글쓰기 버튼 끝

    	// 세팅 버튼 시작
    	$('#setting').click(function() {
    		location.href='./QueSetting.que';
		}); 
    	// 세팅 버튼 끝    	
    	
    	// 라디오버튼 유효성 체크 시작
    	
		function check() {

    		var frm = document.all;
    		
    		var radio_num = document.all.radio.length;
    		var chk_i = 0;
    		
    		if(${currentPage} == 1){
        		var sum = 0;

			}else {
				sum = Number(sessionStorage.getItem("sum"));
			}
				
    		var sum2 = 0;
			
    		  
            for (var i=1; i<16; i++) {
        
           	 var value = $('#radio:checked').attr('value');	
           	 var name = $('#radio:checked').attr('name');	
           	
           	 
           	 if($(":input:radio[name="+i+"]:checked").val() != null){
          	 	value = $(":input:radio[name="+i+"]:checked").val();

           	 	sum2 = Number(value) + sum2;
            	
            	sessionStorage.setItem("sum", sum + sum2 );
           	 }
            }
        	
        	$('#sum').val(sessionStorage.getItem("sum"));
    		
    		// 유효성 시작
    		for(var i = 0; i<radio_num; i++){
    			if(frm.radio[i].checked == true){
    				chk_i++;
    			}
    		}
    		if(chk_i <= 4){
    			alert("모든 질문에 답해주세요");
    			return false;    			
    		}

    	}
    	// 라디오버튼 유효성 체크 끝
    	
	</script>

	
</body>
</html>