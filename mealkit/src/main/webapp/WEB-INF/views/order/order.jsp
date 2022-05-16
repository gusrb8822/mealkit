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
    <link rel="stylesheet" href="../resources/css/order.css">
</head>
<body>
	<input type="hidden" value="${Member.id}" id="member_id">
    <div id="wrap">
		<jsp:include page="../header.jsp"/>
		
		<c:if test="${Member == null}">
			<div class="container no-login">
				<div class="container_in">
		       		<h1>회원전용 메뉴입니다.</h1>
		       		<p>이용하시려면 로그인 하시기 바랍니다.</p>
		       		<p><a href="login">로그인하기</a></p>
		       	</div>
			</div>
		</c:if>
		
		<c:if test="${Member != null}">
		<div id="container">
            <section class="order_top">
                <div class="order_top_in">
                    <h2 class="title">주문</h2>
                    <ul class="div_menu">
                        <li class="active"><a href="#" data-group="base_stake">스테이크</a></li>
                        <li><a href="#" data-group="base_pasta">파스타</a></li>
                        <li><a href="#" data-group="base_soup">국/찌개</a></li>
                        <li><a href="#" data-group="no_base">베이스 없이 만들기</a></li>
                    </ul><!--.div_menu-->
                </div><!--.order_top_in-->
            </section><!--.order_top-->
            <section class="select_menu">
                <div class="select_menu_in">
                    <div class="select_left">
                    </div><!--.select_left-->
                    <div class="select_right">
                        <form>
                            <fieldset>
                                <div class="base_menu">
                                    <h2 class="title">베이스 메뉴</h2>
                                    <div class="base_menu_list">
                                        <ul></ul>
                                    </div><!--.base_menu_list-->
                                </div><!--.base_menu-->
                            </fieldset>
                            <div class="add_element">
                                <h2 class="title">추가 재료</h2>
                                <div class="add_element_group">
                                    <ul>
                                        <li class="add_group">
                                            <p class="ae_title"><a href="#">고기 / 해산물</a></p>
                                            <div class="add_list">
                                                <ul>
                                                	<c:forEach var="i" begin="0" end="${element1.size()-1}" step="1">
	                                                    <li>
	                                                        <p class="add_img"></p>
	                                                        <div class="add_text">
	                                                            <p class="add_name">${element1[i].element_name}</p>
	                                                            <div class="add_price" data-price="${element1[i].element_price}">
	                                                                <p>${element1[i].element_price}</p><span>원</span>
	                                                            </div>
	                                                        </div><!--.add_text-->
	                                                        <div class="add_btns">
	                                                            <a class="btn_minus" href="#">minus</a>
	                                                            <input type="text" value="0" readonly data-eno="${element1[i].element_no}" data-name="${element1[i].element_name}" data-price="${element1[i].element_price}">
	                                                            <a class="btn_plus" href="#">plus</a>
	                                                        </div><!--add_btns-->
	                                                    </li>
                                                    </c:forEach>
                                                </ul>
                                            </div><!--.add_list-->
                                        </li><!--.add_group-->
                                        <li class="add_group">
                                            <p class="ae_title"><a href="#">채소</a></p>
                                            <div class="add_list">
                                                <ul>
                	                                <c:forEach var="i" begin="0" end="${element2.size()-1}" step="1">
	                                                    <li>
	                                                        <p class="add_img"></p>
	                                                        <div class="add_text">
	                                                            <p class="add_name">${element2[i].element_name}</p>
	                                                            <div class="add_price" data-price="${element2[i].element_price}">
	                                                                <p>${element2[i].element_price}</p><span>원</span>
	                                                            </div>
	                                                        </div><!--.add_text-->
	                                                        <div class="add_btns">
	                                                            <a class="btn_minus" href="#">minus</a>
	                                                            <input type="text" value="0" readonly data-eno="${element2[i].element_no}" data-name="${element2[i].element_name}" data-price="${element2[i].element_price}">
	                                                            <a class="btn_plus" href="#">plus</a>
	                                                        </div><!--add_btns-->
	                                                    </li>
													</c:forEach>
                                                </ul>
                                            </div><!--.add_list-->
                                        </li><!--.add_group-->
                                        <li class="add_group">
                                            <p class="ae_title"><a href="#">면 / 빵</a></p>
                                            <div class="add_list">
                                                <ul>
                                                    <c:forEach var="i" begin="0" end="${element3.size()-1}" step="1">
	                                                    <li>
	                                                        <p class="add_img"></p>
	                                                        <div class="add_text">
	                                                            <p class="add_name">${element3[i].element_name}</p>
	                                                            <div class="add_price" data-price="${element3[i].element_price}">
	                                                                <p>${element3[i].element_price}</p><span>원</span>
	                                                            </div>
	                                                        </div><!--.add_text-->
	                                                        <div class="add_btns">
	                                                            <a class="btn_minus" href="#">minus</a>
	                                                            <input type="text" value="0" readonly data-eno="${element3[i].element_no}" data-name="${element3[i].element_name}" data-price="${element3[i].element_price}">
	                                                            <a class="btn_plus" href="#">plus</a>
	                                                        </div><!--add_btns-->
	                                                    </li>
													</c:forEach>
                                                </ul>
                                            </div><!--.add_list-->
                                        </li><!--.add_group-->
                                        <li class="add_group">
                                            <p class="ae_title"><a href="#">소스 / 향신료</a></p>
                                            <div class="add_list">
                                                <ul>
                                                    <c:forEach var="i" begin="0" end="${element4.size()-1}" step="1">
	                                                    <li>
	                                                        <p class="add_img"></p>
	                                                        <div class="add_text">
	                                                            <p class="add_name">${element4[i].element_name}</p>
	                                                            <div class="add_price" data-price="${element4[i].element_price}">
	                                                                <p>${element4[i].element_price}</p><span>원</span>
	                                                            </div>
	                                                        </div><!--.add_text-->
	                                                        <div class="add_btns">
	                                                            <a class="btn_minus" href="#">minus</a>
	                                                            <input type="text" value="0" readonly data-eno="${element4[i].element_no}" data-name="${element4[i].element_name}" data-price="${element4[i].element_price}">
	                                                            <a class="btn_plus" href="#">plus</a>
	                                                        </div><!--add_btns-->
	                                                    </li>
													</c:forEach>
                                                </ul>
                                            </div><!--.add_list-->
                                        </li><!--.add_group-->
                                    </ul>
                                </div><!--.add_element_group-->
                            </div><!--.add_element-->
                        </form>
                    </div><!--.select_right-->
                </div><!--.select_menu_in-->
            </section><!--.select_menu-->
        </div><!--#container-->
        <footer id="footer">
            <div class="footer_in">
                <div class="f_left">
                    <ul>
                        <li>
                            <h3 class="f_ae_title">고기 / 해산물</h3>
                            <div class="f_ae_list"></div><!--.f_ae_list-->
                        </li>
                        <li>
                            <h3 class="f_ae_title">채소</h3>
                            <div class="f_ae_list"></div><!--.f_ae_list-->
                        </li>
                        <li>
                            <h3 class="f_ae_title">면 / 빵</h3>
                            <div class="f_ae_list"></div><!--.f_ae_list-->
                        </li>
                        <li>
                            <h3 class="f_ae_title">소스 / 향신료</h3>
                            <div class="f_ae_list"></div><!--.f_ae_list-->
                        </li>
                    </ul>
                </div><!--.f_left-->
                <div class="f_right">
                    <div class="right_box">
                        <div class="total_price">
                            <p class="tp_1">총 금액</p>
                            <p class="tp_2">00,000</p>
                            <span>원</span>
                        </div><!--.tital_price-->
                        <p class="order_btn"><a href="#" id="order">주문하기</a></p>
                    </div><!--.right_box-->
                </div><!--.f_right-->
            </div><!--.footer_in-->
        </footer><!--#footer-->
        </c:if>
    </div><!--#wrap-->





    <!-- jQuery 연결 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- jQuery UI 연결 -->
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <!--js 연결-->
    <script src="../resources/js/order.js"></script>
</body>
</html>