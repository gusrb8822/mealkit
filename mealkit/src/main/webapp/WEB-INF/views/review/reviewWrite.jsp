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
    <link rel="stylesheet" href="../resources/css/reviewWrite.css">
</head>
<body>
    <div id="wrap">
    	<jsp:include page="../header.jsp"/>
    	
    	<c:if test="${Member==null}">
    		<div class="container">
				<div class="container_in no_order">
		       		<h1>회원전용 메뉴입니다.</h1>
		       		<p>이용하시려면 로그인 하시기 바랍니다.</p>
		       		<p><a href="/login">로그인하기</a></p>
		       	</div>
			</div>
    	</c:if><!-- session에 Member값이 없을경우(비로그인) -->
    	
    	<c:if test="${Member!=null and OrderData.size()==0}">
	    	<div class="container">
				<div class="container_in no_order">
		       		<h1>이전에 주문한 기록이 없습니다.</h1>
		       		<p>상품을 주문해 보시는건 어떨까요?</p>
		       		<p><a href="/order">상품 주문하기</a></p>
		       	</div>
			</div>
        </c:if><!-- model에 OrderData값이 없을경우(이전에 주문한 상품이 없는경우)-->
    	
    	<c:if test="${OrderData.size() > 0}">
	        <div class="container_in"><!-- 리뷰 목록에서 게시글을 클릭 시 그 정보가 상세하게 보이는 화면이 띄워짐 -->
		     	<div class="review_detail_box">
		     		<form action="/review/write" method="post" id="form">
			     		<ul>
			     			<li class="detail_writer">${Member.name}(${Member.id})
			     				<input type="hidden" name="writer_id" value="${Member.id}">
			     				<input type="hidden" name="writer_name" value="${Member.name}">
			     			</li>
			     			<li class="detail_point_menu">
			     				<div>
				     				<div class="detail_point">
				     					<div class="check_point">
				     						<a href="#" class="point">1</a>
				     						<a href="#" class="point">2</a>
				     						<a href="#" class="point">3</a>
				     						<a href="#" class="point">4</a>
				     						<a href="#" class="point">5</a>
				     					</div>
				     					<div class="check_point_form">
				     						<input type="radio" name="review_point" value="1" hidden=true>
				     						<input type="radio" name="review_point" value="2" hidden=true>
				     						<input type="radio" name="review_point" value="3" hidden=true>
				     						<input type="radio" name="review_point" value="4" hidden=true>
				     						<input type="radio" name="review_point" value="5" hidden=true>
				     					</div>
				     				</div>
				     			</div>
				     			<div class="order_menu">
				     				<select name="order_no">
				     					<c:forEach var="i" begin="0" end="${OrderData.size()-1}" step="1">
				     						<c:if test="${OrderData[i-1].order_no != OrderData[i].order_no}">
												<option value="${OrderData[i].order_no}">
													<c:forEach var="j" begin="${i}" end="${OrderData.size()-1}" step="1">
														<c:if test="${OrderData[i].order_no == OrderData[j].order_no}">
															${OrderData[j].base_name} / ${OrderData[j].total_price}원<c:if test="${OrderData[j].order_no == OrderData[j+1].order_no}">, </c:if>
														</c:if>
													</c:forEach>
												</option>
				     						</c:if>
				     					</c:forEach>
				     				</select>
				     			</div>
			     			</li>
			     			<li class="detail_content">
			     				<p class="detail_content_text"><textarea cols="155" rows="25" name="review_content"></textarea></p>
			     				<div class="detail_imgs"></div>
			     			</li><!-- .detail_content -->
			     			<li class="file_upload">
			     				<input type="file" name="uploadFile" multiple>
			     				<div class="show_upload_file"></div>
			     			</li>
			     		</ul>
			     		<div class="review_btns">
			     			<input type="submit" value="리뷰 작성하기" class="write_btn">
			     			<input type="button" value="취소" class="cancel_btn">
			     		</div>
		     		</form>
		     	</div><!-- .review_detail_box -->
			</div><!-- .container_in -->
		</c:if><!-- OrderData가 있는 경우 -->
        <jsp:include page="../footer.jsp"/>
    </div><!--#wrap-->
	



    <!-- jQuery 연결 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- jQuery UI 연결 -->
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <!--js 연결-->
    <script src="../resources/js/reviewWrite.js"></script>
</body>
</html>