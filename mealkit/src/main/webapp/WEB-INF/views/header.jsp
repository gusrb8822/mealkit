<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<html>
<head>
	<link rel="stylesheet" href="../resources/css/reset.css">
    <link rel="stylesheet" href="../resources/css/header.css">
</head>
<body>
<header id="header">
    <div class="header_in">
        <div class="header_1">
            <div class="h_logo"><a href="/">mealkitfactory</a></div><!--.h_logo-->
        </div><!--.header_1-->
        <div class="header_2">
            <nav class="h_gnb">
                <ul>
                    <li><a href="/order"><span>밀키트 만들기</span></a></li>
                    <li><a href="/discount"><span>오늘의 특가</span></a></li>
                    <li><a href="/review"><span>후기 게시판</span></a></li>
                    <li><a href="/event"><span>이벤트</span></a></li>
                    <li><a href="/cs"><span>고객센터</span></a></li>
                </ul>
            </nav><!--.h_gnb-->
        </div><!--.header_2-->
        <div class="h_util">
            <ul>
            	<c:if test="${Member == null}">
	                <li><a href="/join">회원가입</a></li>
	                <li><a href="/login">로그인</a></li>
            	</c:if>
            	<c:if test="${Member != null}">
                	<li><a href="/myPage">마이페이지</a></li>
                	<li><a href="/logout">로그아웃</a></li>
                </c:if>
            </ul>
            <p><a href="./cart">장바구니</a></p>
        </div><!--.h_util-->
    </div><!--.header_in-->
</header><!--#header-->
</body>
</html>