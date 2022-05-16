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
    <link rel="stylesheet" href="../resources/css/eventList.css">
    
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
            		<form action="/event" method="get" class="page_form">
						<input type="hidden" name="pageNum" value="1">
            			<select name="amount">
            				<option value="8" ${eventPage.amount=="8"?"selected":""}>8개씩 보기</option>
            				<option value="16" ${eventPage.amount=="16"?"selected":""}>16개씩 보기</option>
            				<option value="40" ${eventPage.amount=="40"?"selected":""}>40개씩 보기</option>
            			</select>
            		</form>
            	</div><!-- .title_sub_view -->
            	<div class="event_list">
            		<c:if test="${eventPage.events.size() > 0}">
	            		<c:forEach var="i" begin="0" end="${eventPage.events.size()-1}" step="1">
	            			<div class="event_box">
	            				<p class="event_left"><a href="/event/detail?event_no=${eventPage.events.get(i).event_no}"><img src="../resources/img/event/s_event_${eventPage.events.get(i).event_no}.png"></a></p>
	            				<div class="event_right">
	            					<p class="event_title"><a href="/event/detail?event_no=${eventPage.events.get(i).event_no}">${eventPage.events.get(i).event_title}</a></p>
	            					<p class="event_date">이벤트 기간 : ${eventPage.events.get(i).event_start} ~ ${eventPage.events.get(i).event_end}</p>
	            				</div>
	            			</div><!-- .event_box -->
	            		</c:forEach>
            		</c:if>
            	</div><!-- .event_list -->
            	<div class="pager">
            		<c:if test="${eventPage.prev}">
            			<a href="/event?pageNum=${eventPage.startPage-1}&amount=${eventPage.amount}">이전 </a>
            		</c:if>
            		<c:forEach var="i" begin="${eventPage.startPage}" end="${eventPage.endPage}" step="1">
            			<a href="/event?pageNum=${i}&amount=${eventPage.amount}" ${i.toString() == eventPage.pageNum?'style="color: #222; font-weight: bold;"':''}>${i}</a>
            		</c:forEach>
            		<c:if test="${eventPage.next}">
            			<a href="/event?pageNum=${eventPage.endPage+1}&amount=${eventPage.amount}"> 다음</a>
            		</c:if>
            	</div><!-- .pager -->
            </div><!--.container_in-->
        </div><!--#container-->
        <jsp:include page="../footer.jsp"/>
	</div><!-- #wrap-->

    <!--js 연결-->
    <script src="../resources/js/eventList.js"></script>
</body>
</html>