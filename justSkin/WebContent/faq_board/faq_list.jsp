<%@page import="com.faq.db.FaqDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>FAQ | JUST SKIN </title>
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
<!--===============================================================================================-->



    <meta name="description" content="Yoga Studio Template">
    <meta name="keywords" content="Yoga, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>JUST SKIN</title>

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
    <link rel="stylesheet" href="./css/topimage.css" type="text/css">


	<!-- jquery ?????? ?????? -->
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<!-- jquery ?????? ??? -->
	<script src="./js/chatbot.js" type="text/javascript"></script>


</head>
<body>

	<!-- header ?????? -->
 		<jsp:include page="../header/header.jsp" />
	<!-- header ??? -->
 <!-- Page Add Section Begin -->
    <section class="page-add">
        <div class="container">
            <div class="row" >
                <div class="col-lg-4">
                    <div class="page-breadcrumb">
                        <h2>FAQ<span>.</span></h2>
                        <h3>?????? ?????? ??????</h3>
						<p>?????? ??????????????? ???????????? ??????????????????.</p>
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
	
	
	<!-- container ?????? -->	
	<div class="container-fluid">	
	
				
	<!-- ????????? ?????? ?????? -->			
		<div class="row">
			<div class="col-9"></div>
			<div class="col-3">
				<c:if test="${userId eq 'admin' }">
					<button type="button" class="btn btn-secondary" id="write">?????????</button>
				</c:if>
			</div>
		</div>
	<!-- ????????? ?????? ?????? -->
	
		<div class="row">
			<div class="col-2 text-center"></div>
			<div class="col-8">	
				
				<!-- ????????? ???????????? ?????? -->
				<table class="table mb-0 mt-5">
				  <thead class="table table-bordered text-center">
				  	<tr>
				      <th scope="col"><a href="./FaqList.faq">??????</a></th>
				      <th scope="col"><a href="./FaqList.faq?category=????????????">????????????</a></th>
				      <th scope="col"><a href="./FaqList.faq?category=????????????">????????????</a></th>
				      <th scope="col"><a href="./FaqList.faq?category=?????????">?????????</a></th>
				      <th scope="col"><a href="./FaqList.faq?category=??????">??????</a></th>
				      <th scope="col"><a href="./FaqList.faq?category=????????????">????????????</a></th>
				      <th scope="col"><a href="./FaqList.faq?category=????????????">????????????</a></th>
				      <th scope="col"><a href="./FaqList.faq?category=??????">??????</a></th>
				    </tr>
				  </thead>
				</table>
				<!-- ????????? ???????????? ??? -->
				
				<!-- faq ????????? ?????? -->
				<table class="table">
				  <tbody>
				  	<tr class="table" style="background-color:#f8f9fa;">
				      <th class="text-center">??????</th>
				      <th class="text-center">??????</th>
				      <th class="text-center"></th>
				      
				    </tr>
				    <c:forEach var="i" items="${ faqList }">
				    <tr>
				      <th class="text-center" style="width: 10%">${i.faqCategory }</th>
				      <td class="text-center" style='cursor:pointer;' id="${i.faqNum }">
				      	${i.faqQuestion }<br><br>
				       </td>

				      <c:choose>
					      <c:when test="${userId eq 'admin' }">
						  <th id="${i.faqNum }" style="width: 10%">
					      	<button type="button" class="btn btn-primary btn-sm" onclick="location.href='./FaqRevise.faq?faqNum=${i.faqNum }'">??????</button> 
					       	<span type="button" class="btn btn-danger btn-sm" onclick="location.href='./FaqDelete.faq?faqNum=${i.faqNum }'">??????</span>					  
						  </th>
						  </c:when>
						  <c:otherwise>
						  	<th id="${i.faqNum }" style="width: 10%"></th>
						  </c:otherwise>
					  </c:choose>
					  
				    </tr>
				    <tr style="display: none; background-color: #f8f9fa;" id="${i.faqNum }_answer">
					  <th class="text-center">??????</th>
					  <td class="text-center" style="width: 650px"><b style="width: 737;">${i.faqAnswer }</b></td>
					  <th></th>
					  
				    </tr>
				    </c:forEach>
				  </tbody>
				</table>
				<!-- faq ????????? ??? -->
				
				
			</div>
			<div class="col-2">	</div>
		</div>
	</div>
	<!-- container ??? -->	
	
	<!-- Page End Section Begin -->
	<section class="page-add">
	<div class="row">
		<div class="col-lg-3"></div>
		<div class="col-lg-9">
			<div class="page-breadcrumb"></div>
		</div></div>
	</section>
	<!-- Page End Section End -->
	
	<!-- footer ?????? -->
   		<jsp:include page="../footer/footer.jsp" />
    <!-- footer ?????? -->
    
    <!-- ?????? ????????? ?????? ????????? ???????????? ?????? -->
    <script src="./js/faq_list.js"></script>
    <!-- ?????? ????????? ?????? ????????? ???????????? ??? -->
	
</body>
</html>