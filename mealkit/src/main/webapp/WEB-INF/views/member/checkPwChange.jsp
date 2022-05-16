<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- font / Noto Sans Korea / 300, 400, 500, 700 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
    <title>밀키트팩토리</title>
    <!-- css 연결 -->
    <link rel="stylesheet" href="../resources/css/reset.css">
    <link rel="stylesheet" href="../resources/css/checkPw.css">
    
    <!-- jQuery 연결 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- jQuery UI 연결 -->
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
</head>
<body>
    <div id="wrap">
    	<jsp:include page="../header.jsp"/>
        <div id="container">
            <div class="container_in">
            	<h2 class="title">마이페이지</h2>
            	<div class="title_sub_view">
            		<p class="title_sub">마이페이지</p>
				</div><!-- .title_sub_view -->
				<div class="check_pw_section">
					<p class="check_text">본인 확인을 위해 비밀번호를 입력해 주세요</p>
					<form action="/myPage/change" method="post">
						<input type="password" name="pw">
						<input type="submit" value="입력하기">
					</form>
				</div><!-- .check_pw_section -->
            </div><!--.container_in-->
        </div><!--#container-->
        <jsp:include page="../footer.jsp"/>
	</div><!-- #wrap-->

    <!--js 연결-->
<!--     <script src="../resources/js/myPage.js"></script> -->
</body>
</html>