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
    <link rel="stylesheet" href="../resources/css/main.css">
    
    <!-- jQuery 연결 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- jQuery UI 연결 -->
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
</head>
<body>
    <div id="wrap">
    	<jsp:include page="header.jsp"/>
        <div id="container">
            <section class="main_slide">
                <div class="main_img">
                    <ul>
                        <li><a href="/event/detail?event_no=34"><img src="../resources/img/main_slide1_1920x600.jpg" alt=""></a></li>
                        <li><a href="/event/detail?event_no=34"><img src="../resources/img/main_slide2_1920x600.jpg" alt=""></a></li>
                        <li><a href="/event/detail?event_no=34"><img src="../resources/img/main_slide3_1920x600.jpg" alt=""></a></li>
                        <li><a href="/event/detail?event_no=34"><img src="../resources/img/main_slide4_1920x600.jpg" alt=""></a></li>
                        <li><a href="/event/detail?event_no=34"><img src="../resources/img/main_slide5_1920x600.jpg" alt=""></a></li>
                    </ul>
                </div><!--.main_img-->
                <div class="ms_pager"></div><!--.ms_pager-->
                <p class="ms_prev"><a href="#">prev</a></p>
                <p class="ms_next"><a href="#">next</a></p>
            </section><!--.main_slide-->
            <section class="recomm">
                <div class="recomm_in">
                    <h2 class="title">오늘의 특가</h2>
                    <p class="title_sub">오늘만 할인하는 밀키트팩토리의 특가상품!</p>
                    <div class="recomm_list">
                        <ul>
	                        <c:if test="${discountList.size() == 0}">
								<c:forEach var="i" begin="0" end="3" step="1">
									<li>
										<div class="recomm_img"><img src="../resources/img/no_image_400_300.png" alt=""></div><!--.recomm_img-->
	                                    <p class="re_text1">상품 정보가 없습니다.</p>
	                                    <p class="re_text2"></p>
	                                    <p class="re_text3"></p>
									</li>
								</c:forEach>
							</c:if>
	                        
	                        <c:if test="${discountList.size() > 0 && discountList.size() < 4}">
	                        	<c:forEach var="i" begin="0" end="${discountList.size()-1}" step="1">
		                            <li>
		                                <a href="/discount">
		                                    <div class="recomm_img"><img src="../resources/img/base_menu_${discountList.get(i).base_no}.png" alt=""></div><!--.recomm_img-->
		                                    <p class="re_text1">[할인] ${discountList.get(i).base_name} 패키지</p>
		                                    
		                                    <script type="text/javascript">
			                                    var origin_price = 0;
		                                    	origin_price += parseInt("<c:out value='${discountList.get(i).base_price}'/>");
		                                    </script>
		                                    
		                                    <p class="re_text2"><span class="price"></span>원</p>
		                                    <p class="re_text3"><span class="price"></span>원</p>
		                                    
		                                    <c:forEach var="j" begin="0" end="${discountList.get(i).csdto.size()-1}" step="1">
			                                    <script type="text/javascript">
				                                    origin_price += parseInt("<c:out value='${discountList.get(i).csdto.get(j).element_price * discountList.get(i).csdto.get(j).element_quantity}'/>");
			                                    </script>
		                                    </c:forEach>
		                                    
		                                    <script type="text/javascript">
			                                    $(".re_text2 .price").eq(<c:out value='${i}'/>).text(origin_price);
		                                    	$(".re_text3 .price").eq(<c:out value='${i}'/>).text(0.9 * origin_price);
		                                    </script>
		                                    <p class="re_tag">SAVE<br>10%</p><!--.re_tag-->
		                                </a>
		                            </li>
								</c:forEach>
								<c:forEach var="i" begin="${discountList.size()}" end="3" step="1">
									<li>
										<div class="recomm_img"><img src="../resources/img/no_image_400_300.png" alt=""></div><!--.recomm_img-->
	                                    <p class="re_text1">상품 정보가 없습니다.</p>
	                                    <p class="re_text2"></p>
	                                    <p class="re_text3"></p>
									</li>
								</c:forEach>
							</c:if>
							
							<c:if test="${discountList.size() == 4}">
	                        	<c:forEach var="i" begin="0" end="3" step="1">
		                            <li>
		                                <a href="/discount">
		                                    <div class="recomm_img"><img src="../resources/img/base_menu_${discountList.get(i).base_no}.png" alt=""></div><!--.recomm_img-->
		                                    <p class="re_text1">[할인] ${discountList.get(i).base_name} 패키지</p>
		                                    
		                                    <script type="text/javascript">
			                                    var origin_price = 0;
		                                    	origin_price += parseInt("<c:out value='${discountList.get(i).base_price}'/>");
		                                    </script>
		                                    
		                                    <p class="re_text2"><span class="price"></span>원</p>
		                                    <p class="re_text3"><span class="price"></span>원</p>
		                                    
		                                    <c:forEach var="j" begin="0" end="${discountList.get(i).csdto.size()-1}" step="1">
			                                    <script type="text/javascript">
				                                    origin_price += parseInt("<c:out value='${discountList.get(i).csdto.get(j).element_price * discountList.get(i).csdto.get(j).element_quantity}'/>");
			                                    </script>
		                                    </c:forEach>
		                                    
		                                    <script type="text/javascript">
			                                    $(".re_text2 .price").eq(<c:out value='${i}'/>).text(origin_price);
		                                    	$(".re_text3 .price").eq(<c:out value='${i}'/>).text(0.9 * origin_price);
		                                    </script>
		                                    <p class="re_tag">SAVE<br>10%</p><!--.re_tag-->
		                                </a>
		                            </li>
								</c:forEach>
							</c:if>
                        </ul>
                    </div><!--.recomm_list-->
                </div><!--.recomm_in-->
            </section><!--.recomm-->
            
            <section class="event">
                <div class="event_in">
                    <div class="title">이벤트</div><!--.title-->
                    <div class="ev_list">
                        <p class="ev1"><a href="/event/detail?event_no=34"><img src="../resources/img/event_1_1200_400.png" alt=""></a></p>
                        <p class="ev2"><a href="/event/detail?event_no=34"><img src="../resources/img/event_2_1200_400.png" alt=""></a></p>
                        <p class="ev3"><a href="/event/detail?event_no=34"><img src="../resources/img/event_3_1200_400.png" alt=""></a></p>
                    </div><!--.ev_list-->
                    <p class="ev_more"><a href="/event">more</a></p>
                </div><!--.event_in-->
            </section><!--.event-->
        </div><!--#container-->
		<jsp:include page="footer.jsp"/>
    </div><!--#wrap-->
    <!--js 연결-->
    <script src="../resources/js/main.js"></script>
</body>
</html>