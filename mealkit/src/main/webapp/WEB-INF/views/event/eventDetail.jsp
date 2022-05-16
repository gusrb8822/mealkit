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
    <link rel="stylesheet" href="../resources/css/eventDetail.css">
    
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
            	<h2 class="title">이벤트</h2>
            	<div class="title_sub_view">
            		<p class="title_sub">회원님들께 제공하는 다양한 이벤트</p>
            		<p class="event_list_btn"><a href="/event">이벤트 목록</a></p>
            	</div><!-- .title_sub_view -->
            	<div class="show_event">
            		<p class="event_title">${eventDetail.event_title}</p>
            		<p class="event_date">이벤트 기간 : ${eventDetail.event_start} ~ ${eventDetail.event_end}</p>
            		<p class="event_img"><img src="../resources/img/event/event_${eventDetail.event_no}.png"></p>
            	</div><!-- .show_event -->
            	<p class="event_list_btn bottom"><a href="/event">이벤트 목록</a></p>
            </div><!--.container_in-->
        </div><!--#container-->
        <jsp:include page="../footer.jsp"/>
	</div><!-- #wrap-->

    <!--js 연결-->
<!--     <script src="../resources/js/eventList.js"></script> -->
</body>
</html>