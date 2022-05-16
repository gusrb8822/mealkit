<%@page import="org.springframework.ui.Model"%>
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
    <link rel="stylesheet" href="../resources/css/cart.css">
    <!-- jquery UI css연결 -->
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
</head>
<body>
    <div id="wrap">
    	<jsp:include page="../header.jsp"/>
    	<c:if test="${Member==null}">
    		<div class="container">
				<div class="container_in no_cart">
		       		<h1>회원전용 메뉴입니다.</h1>
		       		<p>이용하시려면 로그인 하시기 바랍니다.</p>
		       		<p><a href="login">로그인하기</a></p>
		       	</div>
			</div>
    	</c:if><!-- session에 Member값이 없을경우(비로그인) -->
    	
    	<c:if test="${Member!=null and order==null}">
	    	<div class="container">
				<div class="container_in no_cart">
		       		<h1>장바구니에 담긴 상품이 없습니다.</h1>
		       		<p>원하는 상품을 장바구니에 담아보세요!</p>
		       		<p><a href="order">상품 주문하기</a></p>
		       	</div>
			</div>
        </c:if><!-- model에 order값이 없을경우 -->
    	
    	<c:if test="${order!=null}">
        <div id="container" class="have_cart">
        	<section class="list_section">
        		<div class="container_in">
	        		<h2>장바구니</h2>
	        		<div>
	        			<c:forEach var="i" begin="0" end="${order.size()-1}" step="1">
	        				<div class="order_div">
	        					<p class="delete_btn"><a href="/cart/delete?cno=${order.get(i).cart_no}">장바구니 삭제</a></p>
		        				<ul class="order_list">
		        					<li class="base_menu">
		        						<h3 class="categori">베이스 메뉴</h3>
		        						<div class="base_info">
			        						<p class="base_image"><img src="../resources/img/base_menu_${order.get(i).base_no}.png"></p>
			        						<div class="base_text">
				        						<p class="base_name">${order.get(i).base_name}</p>
				        						<p class="base_price"><span class="price sum">${order.get(i).base_price}</span>원</p>
			        						</div><!-- .base_text -->
		        						</div>
		        					</li><!-- .base_menu -->
		        					<li class="add_element">
		        						<h3 class="categori">추가 재료</h3>
		        						<c:if test="${order.get(i).csdto.size()!= 0}">
											<div class="add_element_list"><c:forEach var="j" begin="0" end="${order.get(i).csdto.size()-1}" step="1"><p>${order.get(i).csdto.get(j).element_name}(<span class="price">${order.get(i).csdto.get(j).element_price}</span>원) X ${order.get(i).csdto.get(j).element_quantity} = <span class="price sum">${order.get(i).csdto.get(j).element_price*order.get(i).csdto.get(j).element_quantity}</span>원</p>
</c:forEach></div> <!-- text값을 가져올 때 가지런한 값을 위해서 일부러 코드 정렬을 하지 않음 -->
		       							</c:if>
		       							<c:if test="${order.get(i).csdto.size() == 0}">
		       								<div class="add_element_list">추가재료 없음</div>
		       							</c:if>
		        					</li><!-- .add_element -->
		        					<li class="total_price">
		        						<h3 class="categori">상품 가격</h3>
		        						<p><span class="price"></span>원</p>
		        						<form action="/cart/order" method="post">
		        							<input type="hidden" name="base_name">
		        							<textarea name="add_element" hidden=true></textarea>
		        							<input type="hidden" name="total_price">
		        							<input type="hidden" name="cart_no" value="${order.get(i).cart_no}">
		        							<input type="submit" value="상품 주문하기" class="order_btn">
		        						</form>
		        					</li>
		        				</ul><!-- .order_list -->
	        				</div><!-- .order_div -->
	        			</c:forEach>
	        		</div>
        		</div><!-- .container_in -->
			</section><!-- .list_section -->
        	<section class="total_order_section">
       			<p class="price_part">총 주문금액 <span class="price"></span>원</p>
       			<input type="button" value="총 ${order.size()}건 주문하기" class="total_order_btn">
       		</section><!-- .total_order_section -->
        </div><!-- #container -->
        </c:if><!-- model에 order값이 있을경우 -->
        <jsp:include page="../footer.jsp"/>
    </div><!--#wrap-->


    <!-- jQuery 연결 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- jQuery UI 연결 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <!--js 연결-->
    <script src="../resources/js/cart.js"></script>
</body>
</html>