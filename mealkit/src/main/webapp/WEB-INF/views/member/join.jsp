<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <link rel="stylesheet" href="../resources/css/join.css">
</head>
<body>
    <div id="wrap">
		<jsp:include page="../header.jsp"/>
        <div id="container">
            <div class="container_in">
                <h2>회원가입</h2>
                <form action="join" method="post" id="joinForm">
                    <fieldset class="info">
                        <ul>
                            <li>
                            	<label><span>성명</span><input type="text" placeholder="이름을 입력하세요" name="name" id="name" required></label>
                            </li>
                            <li>
                            	<label><span>아이디</span><input type="text" placeholder="아이디를 입력하세요" name="id" id="id" required></label>
                            	<p class="guide_message">* 5~20자의 영어 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.
                            	<p class="guide_message">* 아이디가 중복입니다. 다른 아이디를 입력해주세요.
                            </li>
                            <li>
                            	<label><span>패스워드</span><input type="password" name="pw" id="pw" required></label>
                            	<p class="guide_message">* 8~16자의 영어 대ㆍ소문자, 숫자, 특수문자만 입력 가능합니다.
                            </li>
                            <li>
                            	<label><span>패스워드 확인</span><input type="password" id="pwCheck" required></label>
                            	<p class="guide_message">* 입력하신 비밀번호와 다릅니다.
                            </li>
                            <li>
                            	<label><span>이메일</span><input type="email" placeholder="이메일을 입력하세요" name="email" id="email" required></label>
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
                        <button type="button" id="joinBtn">가입하기</button>
                        <button type="reset">취소</button>
                    </div><!--.btns-->
                </form>
                <div class="go_login">
                    <p>이미 회원이신가요? <a href="/login">로그인하기</a></p>
                </div><!--.go_login-->
            </div><!--.container_in-->
        </div><!--#container-->
        <jsp:include page="../footer.jsp"/>
    </div><!--#wrap-->






    <!-- jQuery 연결 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- jQuery UI 연결 -->
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <!--js 연결-->
    <script src="../resources/js/join.js"></script>
</body>
</html>