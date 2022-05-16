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
    <link rel="stylesheet" href="../resources/css/csMain.css">
    
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
            	<h2 class="title">고객센터</h2>
            	<div class="title_sub_view">
            		<p class="title_sub">고객님들께서 자주묻는 질문을 모아두었습니다. 추가적인 질문사항은 고객센터 전화를 통해서 말씀해 주시기 바랍니다.</p>
            		<form action="/cs" method="get" class="page_form">
						<input type="hidden" name="pageNum" value="1">
            			<select name="amount">
            				<option value="8" ${csPage.amount=="8"?"selected":""}>8개씩 보기</option>
            				<option value="16" ${csPage.amount=="16"?"selected":""}>16개씩 보기</option>
            				<option value="40" ${csPage.amount=="40"?"selected":""}>40개씩 보기</option>
            			</select>
            		</form>
            	</div><!-- .title_sub_view -->
            	<div class="cs_list">
					<ul>
						<li class="list_section">
							<p>번호</p>
							<p>분류</p>
							<p class="content">내용</p>
						</li><!-- .list_section -->
						<c:forEach var="i" begin="0" end="${csPage.qnas.size()-1}" step="1">
							<li class="question">
								<p>${csPage.qnas.get(i).qna_no}</p>
								<p class="qna_group">${csPage.qnas.get(i).qna_group}</p>
								<script type="text/javascript">
									switch($(".qna_group").eq(<c:out value="${i}"/>).text()){
									case "join" : 
										$(".qna_group").eq(<c:out value="${i}"/>).text("회원가입");
										break;
									case "order" :
										$(".qna_group").eq(<c:out value="${i}"/>).text("주문");
										break;
									case "product" :
										$(".qna_group").eq(<c:out value="${i}"/>).text("상품");
										break;
									}
								</script>
								<p class="content">
									<span class="qna_point">Q</span>
									${csPage.qnas.get(i).question}
								</p>
							</li><!-- .question -->
							<li class="answer">
								<p></p>
								<p></p>
								<span class="qna_point">A</span>
								<pre class="content">${csPage.qnas.get(i).answer}</pre>
							</li><!-- .answer -->
						</c:forEach>
					</ul>
            	</div><!-- .cs_list -->
            	<div class="pager">
            		<c:if test="${csPage.prev}">
            			<a href="/cs?pageNum=${csPage.startPage-1}&amount=${csPage.amount}">이전 </a>
            		</c:if>
            		<c:forEach var="i" begin="${csPage.startPage}" end="${csPage.endPage}" step="1">
            			<a href="/cs?pageNum=${i}&amount=${csPage.amount}" ${i.toString() == csPage.pageNum?'style="color: #222; font-weight: bold;"':''}>${i}</a>
            		</c:forEach>
            		<c:if test="${csPage.next}">
            			<a href="/cs?pageNum=${csPage.endPage+1}&amount=${csPage.amount}"> 다음</a>
            		</c:if>
            	</div><!-- .pager -->
            </div><!--.container_in-->
        </div><!--#container-->
        <jsp:include page="../footer.jsp"/>
	</div><!-- #wrap-->

    <!--js 연결-->
    <script src="../resources/js/csMain.js"></script>
</body>
</html>