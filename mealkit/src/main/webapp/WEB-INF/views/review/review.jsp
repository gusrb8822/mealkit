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
    <link rel="stylesheet" href="../resources/css/review.css">
    
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
            	<h2 class="title">후기 게시판</h2>
            	<div class="title_sub_view">
            		<p class="title_sub">게시물을 클릭하시면 상세한 후기를 보실 수 있습니다.</p>
            		<form action="/review" method="get" class="page_form">
            			<select name="amount">
            				<option value="8" ${reviewPage.amount=="8"?"selected":""}>8개씩 보기</option>
            				<option value="16" ${reviewPage.amount=="16"?"selected":""}>16개씩 보기</option>
            				<option value="40" ${reviewPage.amount=="40"?"selected":""}>40개씩 보기</option>
            			</select>
            			<input type="hidden" name="pageNum" value="1">
            		</form>
            	</div>
            	<div>
            		<ul class="review_list">
            			<c:forEach var="i" begin="0" end="${reviewPage.reviews.size()-1}" step="1">
							<li class="review_box">
								<p class="writer">${reviewPage.reviews.get(i).writer_name}(${reviewPage.reviews.get(i).writer_id})</p>
								<div class="point">
									별점
									<p class="point_checked" data-value="${reviewPage.reviews.get(i).review_point}"></p><!-- data-value값에 db에서 가져온 별점 넣기 -->
								</div>
								<p class="order_date">주문일 : ${reviewPage.reviews.get(i).opdto[0].order_date}</p>
								<p class="order_menu">
									<c:if test="${reviewPage.reviews.get(i).opdto.size() != 0}">
										<c:forEach var="j" begin="0" end="${reviewPage.reviews.get(i).opdto.size()-1}" step="1">
											${reviewPage.reviews.get(i).opdto[j].base_name}
											<c:if test="${j!=reviewPage.reviews.get(i).opdto.size()-1}">, </c:if>
										</c:forEach>
									</c:if>
								</p>
								<div class="review_imgs">
									<c:if test="${reviewPage.reviews.get(i).attach.size() != 0}"><!-- 이미지가 있을 경우 -->
		        						<c:forEach var="j" begin="0" end="${reviewPage.reviews.get(i).attach.size()-1}" step="1">
		        							<p class="review_img"><a href="#" class="click_img"><img src=""></a></p>
			        						<script type="text/javascript">
			        							var review_index = "<c:out value='${i}'/>"; 
			        							var img_index = "<c:out value='${j}'/>";
			        							var uploadPath = "<c:out value='${reviewPage.reviews[i].attach[j].uploadPath}'/>";
			        							var uuid ="<c:out value='${reviewPage.reviews[i].attach[j].uuid}'/>";
			        							var fileName ="<c:out value='${reviewPage.reviews[i].attach[j].fileName}'/>";
			        							$(".review_box").eq(review_index).find(".review_img").eq(img_index).find("img").attr("src","../resources/img/"+uploadPath+"/"+uuid+"_"+fileName);
			        						</script>
		        						</c:forEach>
		        					</c:if><!-- 이미지가 있을 경우 끝-->
		        						
		        					<c:if test="${reviewPage.reviews.get(i).attach.size() == 0}"><!-- 이미지가 없을 경우 -->
		        						<p class="review_img no_img"><img src="../resources/img/no_image_400_300.png" alt=""></p>
		        					</c:if><!-- 이미지가 없을 경우 끝-->
								</div>
								<div class="order_menu_list">
									<c:if test="${reviewPage.reviews.get(i).opdto.size() != 0}">
										<c:forEach var="j" begin="0" end="${reviewPage.reviews.get(i).opdto.size()-1}" step="1">
											<div>
												<p>${reviewPage.reviews.get(i).opdto[j].base_name}</p>
												<pre>${reviewPage.reviews.get(i).opdto[j].add_element}</pre>
											</div>
										</c:forEach>
									</c:if>
								</div>
								<div class="review_content">${reviewPage.reviews.get(i).review_content}</div>
							</li><!-- review_box -->
						</c:forEach><!-- foreach(i)끝 -->
            		</ul>
            	</div>
            	<div class="pager">
            		<c:if test="${reviewPage.prev}">
            			<a href="/review?pageNum=${reviewPage.startPage-1}&amount=${reviewPage.amount}">이전 </a>
            		</c:if>
            		<c:forEach var="i" begin="${reviewPage.startPage}" end="${reviewPage.endPage}" step="1">
            			<a href="/review?pageNum=${i}&amount=${reviewPage.amount}" ${i.toString() == reviewPage.pageNum?'style="color: #222; font-weight: bold;"':''}>${i}</a>
            		</c:forEach>
            		<c:if test="${reviewPage.next}">
            			<a href="/review?pageNum=${reviewPage.endPage+1}&amount=${reviewPage.amount}"> 다음</a>
            		</c:if>
            	</div><!-- .pager -->
            	<c:if test="${Member!=null}">
            		<a href="/review/write" class="review_write_btn">글쓰기</a>
            	</c:if>
            </div><!--.container_in-->
        </div><!--#container-->
        <jsp:include page="../footer.jsp"/>
        
        
        
        <div class="review_detail"><!-- 리뷰 목록에서 게시글을 클릭 시 그 정보가 상세하게 보이는 화면이 띄워짐 -->
	     	<div class="review_detail_box">
	     		<ul>
	     			<li class="detail_writer">작성자</li>
	     			<li class="detail_point_date">
	     				<div class="detail_point">
	     					별점
	     					<p class="point_checked" data-value="5"></p>
	     				</div>
	     				<p class="detail_date">날짜</p>
	     			</li>
	     			<li class="detail_order">상세주문내역</li>
	     			<li class="detail_content">
	     				<p class="detail_content_text">리뷰 내용</p>
	     				<div class="detail_imgs"></div>
	     			</li><!-- .detail_content -->
	     		</ul>
	     		<p class="close_detail_btn"><a href="#">닫기</a></p>
	     	</div><!-- .review_detail_box -->
	     	<p class="detail_background"></p>
	     	<div class="img_background">
	     		<p class="size_up_img"><img src=""></p>
	     	</div>
		</div><!-- .review_detail -->
    </div><!--#wrap-->
	




    <!--js 연결-->
    <script src="../resources/js/review.js"></script>
</body>
</html>