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
    <link rel="stylesheet" href="../resources/css/changeMember.css">
    
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
				<div class="change_member_section">
					<form action="/myPage/changeMember" method="post" id="joinForm">
	                    <fieldset class="info">
	                        <ul>
	                            <li>
	                            	<label><span>성명</span>${Member.name}</label>
	                            </li>
	                            <li>
	                            	<label><span>아이디</span>${Member.id}</label>
	                            </li>
	                            <li>
	                            	<label><span>패스워드</span><input type="password" name="pw" id="pw" value="${Member.pw}" required></label>
	                            	<p class="guide_message">* 8~16자의 영어 대ㆍ소문자, 숫자, 특수문자만 입력 가능합니다.
	                            </li>
	                            <li>
	                            	<label><span>패스워드 확인</span><input type="password" id="pwCheck" value="${Member.pw}" required></label>
	                            	<p class="guide_message">* 입력하신 비밀번호와 다릅니다.
	                            </li>
	                            <li>
	                            	<label><span>이메일</span><input type="email" placeholder="이메일을 입력하세요" name="email" id="email" value="${Member.email}" required></label>
	                            </li>
	                        </ul>
	                    </fieldset>
	                    <fieldset class="commercial">
	                        <ul>
	                            <li>
	                                <label><span>이벤트 수신여부</span></label>
	                                <label><input type="radio" name="commercial" value="Y"> Yes</label>
	                                <label><input type="radio" name="commercial" value="N" checked> No</label>
	                            </li>
	                        </ul>
	                    </fieldset>
	                    <div class="btns">
	                        <button type="button" id="joinBtn">변경하기</button>
	                        <button type="button" id="cancelBtn">취소</button>
	                    </div><!--.btns-->
	                </form>
				</div><!-- .change_member_section -->
            </div><!--.container_in-->
        </div><!--#container-->
        <jsp:include page="../footer.jsp"/>
	</div><!-- #wrap-->

    <!--js 연결-->
    <script src="../resources/js/changeMember.js"></script>
</body>
</html>