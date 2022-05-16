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
    <link rel="stylesheet" href="../resources/css/discount.css">
    
    <!-- jQuery 연결 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- jQuery UI 연결 -->
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
</head>
<body>
    <div id="wrap">
    	<jsp:include page="../header.jsp"/>
    	<c:if test="${Member==null}">
    		<div class="container">
				<div class="container_in no_login">
		       		<h1>회원전용 메뉴입니다.</h1>
		       		<p>이용하시려면 로그인 하시기 바랍니다.</p>
		       		<p><a href="/login">로그인하기</a></p>
		       	</div>
			</div>
    	</c:if><!-- session에 Member값이 없을경우(비로그인) -->
    
    	<c:if test="${Member!=null}">
	        <div id="container">
	            <div class="container_in">
	            	<h2 class="title">오늘의 특가</h2>
	            	<div class="title_sub_view">
	            		<p class="title_sub">오늘만 만날 수 있는 기막힌 특가 상품</p>
	            		<form action="/discount" method="get" class="page_form">
	            			<select name="amount">
	            				<option value="8" ${discountPage.amount=="8"?"selected":""}>8개씩 보기</option>
	            				<option value="16" ${discountPage.amount=="16"?"selected":""}>16개씩 보기</option>
	            				<option value="40" ${discountPage.amount=="40"?"selected":""}>40개씩 보기</option>
	            			</select>
	            			<input type="hidden" name="pageNum" value="1">
	            		</form>
	            	</div>
	            	<div>
	            		<ul class="discount_list">
	            			<c:if test="${discountPage.discounts.size()>0}">
		            			<c:forEach var="i" begin="0" end="${discountPage.discounts.size()-1}" step="1">
									<li>
										<div class="discount_box">
											<script type="text/javascript">
												var totalPrice = 0;
												totalPrice += parseInt("<c:out value='${discountPage.discounts.get(i).base_price}'/>");
											</script>
				      						<p class="discount_img"><a href="#" class="click_img"><img src="../resources/img/base_menu_${discountPage.discounts.get(i).base_no}.png"></a></p>
				      						<p class="discount_title">[할인] ${discountPage.discounts.get(i).base_name} 패키지</p>
				      						<div class="discount_config">
				      							구성품: ${discountPage.discounts.get(i).base_name} +
				      							<c:forEach var="j" begin="0" end="${discountPage.discounts.get(i).csdto.size()-1}">
				      								<p>${discountPage.discounts.get(i).csdto.get(j).element_name} X ${discountPage.discounts.get(i).csdto.get(j).element_quantity}</p>
				      								<script type="text/javascript">
				      									totalPrice += parseInt("<c:out value='${discountPage.discounts.get(i).csdto.get(j).element_price * discountPage.discounts.get(i).csdto.get(j).element_quantity}'/>");
				      								</script>
				      							</c:forEach>
				      						</div>
				      						<div class="total_price">
				      							<p class="origin_price"><span class="price"></span>원</p>
				      							<p class="discount_pirce"><span class="price"></span>원</p>
				      						</div>
				      						<script type="text/javascript">
				      							$(".origin_price .price").eq("<c:out value='${i}'/>").text(totalPrice);
				      							$(".discount_pirce .price").eq("<c:out value='${i}'/>").text(0.9*totalPrice);
				      						</script>
			      						</div><!-- .discount_box -->
			      						<div class="hide_box">
			      							<form action="/discount" method="post">
			      								<input type="hidden" name="cart_no" value="${discountPage.discounts.get(i).cart_no}">
			      								<input type="hidden" name="base_name" value="[할인] ${discountPage.discounts.get(i).base_name} 패키지">
			      								<input type="hidden" name="buy_type">
				      							<input type="button" value="구매하기" class="buy_btn">
				      							<input type="button" value="장바구니 추가" class="cart_btn">
			      							</form>
			      						</div><!-- .hide_box -->
									</li>
								</c:forEach>
							</c:if>
	            		</ul>
	            	</div>
	            	<div class="pager">
	            		<c:if test="${discountPage.prev}">
	            			<a href="/discount?pageNum=${discountPage.startPage-1}&amount=${discountPage.amount}">이전 </a>
	            		</c:if>
	            		<c:forEach var="i" begin="${discountPage.startPage}" end="${discountPage.endPage}" step="1">
	            			<a href="/discount?pageNum=${i}&amount=${discountPage.amount}" ${i.toString() == discountPage.pageNum?'style="color: #222; font-weight: bold;"':''}>${i}</a>
	            		</c:forEach>
	            		<c:if test="${discountPage.next}">
	            			<a href="/discount?pageNum=${discountPage.endPage+1}&amount=${discountPage.amount}"> 다음</a>
	            		</c:if>
	            	</div><!-- .pager -->
	            </div><!--.container_in-->
	        </div><!--#container-->
        </c:if><!-- 세션에 Member값이 존재할 경우 (로그인 시)-->
        <jsp:include page="../footer.jsp"/>
	</div><!-- #wrap -->
    <!--js 연결-->
    <script src="../resources/js/discount.js"></script>
</body>
</html>