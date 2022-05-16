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
    <link rel="stylesheet" href="../resources/css/login.css">
</head>
<body>
    <div id="wrap">
    	<jsp:include page="../header.jsp"/>
        <div id="container">
            <div class="container_in">
                <h2>로그인</h2>
                <form action="login" method="post">
					<ul>
						<li><input type="text" placeholder="아이디를 입력하세요" name="id"></li>
						<li><input type="password" placeholder="비밀번호를 입력하세요" name="pw"></li>
					</ul>
					<input type="submit" value="로그인">
                </form>
                <div class="go_join">
                    <p>회원이 아니신가요? <a href="/join">회원가입하기</a></p>
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
<!--     <script src="../resources/js/main.js"></script> -->
</body>
</html>