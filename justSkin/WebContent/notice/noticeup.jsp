<%@page import="com.notice.db.NoticeDAO"%>
<%@page import="com.notice.db.noticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Yoga Studio Template">
<meta name="keywords" content="Yoga, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>NOTICE | JUST SKIN</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:100,200,300,400,500,600,700,800,900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="./css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="./css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="./css/nice-select.css" type="text/css">
<link rel="stylesheet" href="./css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="./css/magnific-popup.css" type="text/css">
<link rel="stylesheet" href="./css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="./css/style.css" type="text/css">
<link rel="stylesheet" href="./css/noticeup.css" type="text/css">
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
                        <h2>ADMIN PAGE<span>.</span></h2>
                        <h3>공지사항 글 수정</h3>
						<p style="border: 1px solid #B0BCC2;"></p>
                        
                    </div>
                </div>
                <div class="col-lg-8">
               </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Page Add Section End -->
    
	<%
		int num = Integer.parseInt(request.getParameter("noticeNum"));
		String pageNum = request.getParameter("pageNum");
		
		// 글번호에 해당하는 정보를 가져오는 메서드 
		noticeDTO notit = new noticeDTO();
		NoticeDAO noti = new NoticeDAO();
		notit = noti.getNoticeData(num);
		//bdao.getBoard(num).getNum(); (x)
				
		String id = (String)session.getAttribute("userId");
		// 전달정보 저장 - 액션태그 (자바빈)- num,pass
		
		int check1 = noti.deleteCheckNotice(id);
		
		
		
	
		 if (notit.getNoticeFile()==null){
			notit.setNoticeFile("첨부파일");
			notit.setNoticeRealFileName("첨부파일");
		}
		 if (notit.getNoticeImg()==null){
				notit.setNoticeImg("이미지");
				notit.setNoticeRealImgName("이미지");
			}
			
		
		System.out.println("ssss + "+notit.getNoticeImg());
		
		
		 if(check1 == 1){
		 	
		  }else{
		  %>
		<script type="text/javascript">
		alert("수정 권한이 없습니다");
		history.back();
		</script>
		<%
		}

	%>
	
	<!-- container 시작 -->
	<div class="container-fluid">

		<div class="row">
			<div class="col-2"></div>
			<!--여백  -->
			<div class="col-8">
	<!-- Db에 처리해야하는 데이터 폼태그 안에 저장(hidden)
            "  안하는 경우  주소줄에 저장(url)-->
		<form action="noticeuppro.nos?pageNum=<%=pageNum %>" method="post"
			enctype="multipart/form-data">
			
			<input type="hidden" name="index" value="<%=notit.getNoticeNum()%>">
			<table class="table">
			<tr>
				<td>제목</td>
				<td colspan="2">
				<input type="text" name="title" value="<%=notit.getNoticeTitle() %>" class="form-control">
				</td>
			</tr>
			<tr>
				<td>중요도</td>
					<td>
							
						<select class="custom-select" id="inputGroupSelect01" name="imp2">

							<option value="1" selected>공지사항</option>
							<option value="0">이벤트</option>

						</select>
						
							
							</td>		
			</tr>
			<tr>
				<td>파일</td>
				<%
					
					if(notit.getNoticeImg().equals("이미지")){
					%>
					<td><div class="input-group">
						<div class="custom-file">
							<input type="file" id="inputGroupFilesys04" class="custom-file-input" name="filename"
								value="<%=notit.getNoticeFile() %>"
								aria-describedby="inputGroupFileAddon04"> <label 
								id="filelabel001" class="custom-file-label" for="inputGroupFile04"><%=notit.getNoticeFile() %></label>
						</div>
						
					</div></td>
					<%}else{ %>
					<td><div class="input-group">
						<div class="custom-file">
							<input type="file" id="inputGroupFilesys04" class="custom-file-input" name="filename"
								value=""
								aria-describedby="inputGroupFileAddon04"> <label 
								id="filelabel001" class="custom-file-label" for="inputGroupFile04"><%=notit.getNoticeFile() %></label>
						</div>
						
					</div></td>
					
					
					
					<%} %>
					<td><div class="input-group-append">
							<button class="btn btn-outline-secondary" onclick="filesss()" type="button"
								id="inputGroupFileAdd3on04">취소하기</button>
						</div></td>
			</tr>
			<tr>
				<td>이미지</td>
					<%
					
					if(notit.getNoticeImg().equals("이미지")){
					%>
							<td><div class="input-group">
						<div class="custom-file">
							<input type="file" id="inputGroupimgsys05" class="custom-file-input" name="Imgname"
								value="<%=notit.getNoticeImg() %>"
								aria-describedby="inputGroupFileAddon04"> <label
								id="imglabel001" class="custom-file-label" for="inputGroupFile04"><%=notit.getNoticeImg() %></label>
						</div>
						
					</div></td>
					<%}else{ %>
							<td><div class="input-group">
						<div class="custom-file">
							<input type="file" id="inputGroupimgsys05" class="custom-file-input" name="Imgname"
								value=""
								aria-describedby="inputGroupFileAddon04"> <label
								id="imglabel001" class="custom-file-label" for="inputGroupFile04"><%=notit.getNoticeImg() %></label>
						</div>
						
					</div></td>
					
					
					<%} %>
					<td><div class="input-group-append">
							<button class="btn btn-outline-secondary" onclick="imgsss()" type="button"
								id="inputGroupFileAddon05">취소하기</button>
						</div></td>
			</tr>
			<tr>
				<td>내용</td>
				<td colspan="2">
					<textarea rows="10" cols="30" name="content" class="form-control">
					<%=notit.getNoticeContent().replace("<br>", "\n").replace("s0i0m0p0u0", ",") %>
					</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="3" style="text-align: right;">
					<input type="submit" class="btn btn-info" value="글 수정 하기">
				</td>
			</tr>
		</table>
		</form>
		</div>
		
		<!--여백  -->
		<div class="col-2"></div>
		</div>
		</div>
	<!-- container 끝 -->
		
	<!-- Page End Section Begin -->
	<section class="page-add">
	<div class="row">
		<div class="col-lg-3"></div>
		<div class="col-lg-9">
			<div class="page-breadcrumb"></div>
		</div>
	</div>
	</section>
	<!-- Page End Section End -->


	<!-- footer 시작 -->
	<jsp:include page="../footer/footer.jsp" />
	<!-- footer 끝 -->


</body>
<script type="text/javascript">
    $('.custom-file input').change(function (e) {
        var files = [];
        for (var i = 0; i < $(this)[0].files.length; i++) {
            files.push($(this)[0].files[i].name);
        }
        $(this).next('.custom-file-label').html(files.join(', '));
    });
</script>
<script type="text/javascript">
    function filesss () {
		var sss = document.getElementById('filelabel001');
		document.getElementById("inputGroupFilesys04").value = "";
    	sss.innerText = "첨부파일";
    }
</script>
<script type="text/javascript">
    function imgsss () {
      
    	var sss = document.getElementById('imglabel001');
    	document.getElementById("inputGroupimgsys05").value = "";
    	sss.innerText = "이미지";
    	
    }
</script>

</html>