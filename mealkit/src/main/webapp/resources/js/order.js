$(function(){
    // 베이스 메뉴 항목 불러오기(첫 번째 항목으로 시작)
    ChangeBase("base_stake");

    // 추가재료 항목 가격 3자리수(화폐) 단위로 끊기
    $(".add_price p").each(function(){
        var add_price = $(this).text();
        $(this).text(MoneyFormat(add_price));
    })

    // 베이스 메뉴 분류(스테이크, 파스타, 국/찌개 등) 클릭 시 변경
    $(".div_menu li a").click(function(e){
        e.preventDefault();
        $(".div_menu li").removeClass("active");
        $(this).parents("li").addClass("active");
        ChangeBase($(this).data("group"));
    })

    // 추가재료 항목 보이기 / 숨기기
    $(".ae_title").click(function(e){
        e.preventDefault();

        //슬라이드 토글(여러개 메뉴 열 수 있음)
        $(this).next(".add_list").stop(true).slideToggle(450);

        // 슬라이드 하나 내리면 다른 슬라이드 전부 올라가도록 설정
        // if($(this).next(".add_list").css("display") == "none"){
        //     $(".add_list").stop(true).slideUp(450);
        //     $(this).next(".add_list").stop(true).slideDown(450);
        // }else{
        //     $(this).next(".add_list").stop(true).slideUp(450);
        // }
    })

    // 추가재료 내부의 plus/minus 버튼 활성화
    $(".btn_minus").click(function(e){
        e.preventDefault();
        if($(this).next("input").val() != "0"){
            var num = parseInt($(this).next("input").val());
            num -= 1;
            $(this).next("input").val(num);
        }
        var listIndex = $(this).parents(".add_group").index();
        FooterRenewal(listIndex);

        // 총 가격 변화
        TotalPrice();
    })
    $(".btn_plus").click(function(e){
        e.preventDefault();
        if($(this).prev("input").val() != "9"){
            var num = parseInt($(this).prev("input").val());
            num += 1;
            $(this).prev("input").val(num);
        }
        var listIndex = $(this).parents(".add_group").index();
        FooterRenewal(listIndex);

        // 총 가격 변화
        TotalPrice();
    })

    // footer에 마우스 올리면 상세목록 열리면서 footer의 크기가 커짐
    $("#footer").mouseover(function(){
        $(this).stop(true).animate({
            "padding" : "20px 0",
            "height" : "250px"
        },300)
        $(this).find(".f_left ul").stop(true).animate({
            "height" : "250px"
        },300)
    })

    // 마우스를 치우면 footer가 기본으로 작아짐
    $("#footer").mouseout(function(){
        $(this).stop(true).animate({
            "padding" : "15px 0",
            "height" : "50px"
        },300)
        $(this).find(".f_left ul").stop(true).animate({
            "height" : "0"
        },300)
    })

    
    // 주문하기 버튼 클릭이벤트 추가 (ajax를 통해 데이터 전달)
    $("#order").click(function(e){
        e.preventDefault();
        OrderProducts();


    })

})







// 푸터 목록 갱신(함수) 
// 관련 정보는 add_list ul li에서 
// add_name, add_price, add_btns input.val()
// f_ae_list에 html이 추가되어야함
function FooterRenewal(num){
    var html = ""; // f_ae_list의 html이 될 변수
    var list = $(".add_list").eq(num);
    
    for(var i = 0; i < list.find(".add_text").length; i++){
        var list_select = list.find("input").eq(i)
        if(list_select.val() != 0){
            var text = '<p data-eno="'+list_select.data("eno")
            		+'" data-quantity="'+list_select.val()
            		+'" data-name="'+list_select.data("name")
            		+'" data-price="'+list_select.data("price")+'">' 
                    + list.find(".add_name").eq(i).text() + " " 
                    + list.find(".add_price").eq(i).text() + " X "
                    + list.find("input").eq(i).val() + "</p>";
            html += text;
        }
    }
    $(".f_ae_list").eq(num).html(html);
}


// 가격 총 합계 갱신(함수)
function TotalPrice(){
    var totalPrice = parseInt($(".base_menu_list .select input").val());
    for(var i = 0; i < $(".add_price").length; i++){
        var price = parseInt($(".add_price").eq(i).data("price"));
        var num = parseInt($(".add_btns").eq(i).find("input").val());
        totalPrice = totalPrice + (price * num);
    }
    $(".total_price .tp_2").text(MoneyFormat(totalPrice));
}



// 화폐단위 3자리마다 ',' 찍어주기(함수)
function MoneyFormat(value){
    if(value == 0){
        return 0;
    }
    value = value + "";
    length = value.length;
    num1 = length % 3;
    num2 = length / 3;
    result = "";
    
    if(num1 == 0){
        num2--;
    }else{}
    if(num2 != 0){
        for(var i = 0; i < num1; i++){
            result += value.substr(i, 1);
        }
        if(num1 != 0) result += ",";
        for(var i = 0; i < value.length-num1; i++){
            if(i % 3 == 0 && i != 0) result += ",";
            result += value.substr(i+num1, 1);
        }
    }else{
        result = value;
    }
    return result;
}


function ChangeBase(group){
    // alert(group); // group 확인용
    $.ajax({
        type: "get",
        url: "/order/group"+group+".json",
        contentType: "application/json; charset=utf-8",
        success: function(result){
            // 데이터 불러오면 베이스메뉴 최신화
            var text = "";
            var image = "";
            for(var i = 0; i < result.length; i++){
                text += '<li data-bno="'+result[i].base_no
                	 +'" data-name="'+result[i].base_name
                	 +'" data-price="'+result[i].base_price
                	 +'"><label><input type="radio" name="base_menu" value="'+result[i].base_price+'"> '+result[i].base_name+'</label><span> + '+MoneyFormat(result[i].base_price)+'원</span></li>';
                image += '<p class="menu_img"><img src="../resources/img/base_menu_'+result[i].base_no+'.png" alt="'+result[i].base_name+'"></p>';
            }
            // 베이스 메뉴 라디오 버튼 추가
            $(".base_menu_list ul").html(text);
            // 갱신하고 베이스 메뉴 라디오 버튼 첫 번째 항목에 체크
            $(".base_menu_list ul li:first-child").addClass("select");
            $(".base_menu_list ul .select input").attr("checked","true");

            // 베이스 메뉴 이미지 추가
            $(".select_left").html(image);
            // 베이스 메뉴 이미지 첫번째 항목에 select추가
            $(".menu_img:first-child").addClass("select");
            
            // 스크롤이 사진의 위치가 화면 중앙이 되는 지점을 넘어서면 사진이 fixed형태로 변함
            $(".menu_img").each(function(){
                var $window = $(window);
                $window.on("scroll", function(){
                    if($window.scrollTop() > 200){
                        $(".menu_img").addClass("sticky");
                    }else{
                        $(".menu_img").removeClass("sticky")
                    }
                })
                $window.trigger("scroll");
            })

            // 베이스 메뉴 각 항목 클릭 시 이벤트 추가
            $(".base_menu_list ul li input").click(function(){
                // 베이스메뉴 radio버튼 checked된 항목의 텍스트 색깔 변경
                $(".base_menu_list ul li").css({
                    "color":"#888",
                    "fontWeight" : 400
                });
                $(".base_menu_list ul li").removeClass("select");
                $(this).parents("li").css({
                    "color":"#0075ff",
                    "fontWeight" : 700
                });
                $(this).parents("li").addClass("select");

                // 메뉴 선택하면 사진 바뀌기
                var index = $(".base_menu_list ul li").index($(this).parents("li"));
                $(".menu_img").removeClass("select");
                $(".menu_img").eq(index).addClass("select");

                // 총 가격 변화
                TotalPrice();
            })
            TotalPrice();
        }
    })
}

// 주문하기 버튼 클릭 시 푸터에서 데이터 가져오기 > ajax로 넘김
function OrderProducts(){
	var formdata = new FormData();
	
	//member_id 넣기
    var member_id = $("#member_id").val();
    formdata.append("member_id", member_id);

    //base_no 넣기
    var base_no = $(".base_menu_list li.select").data("bno");
    formdata.append("base_no", base_no);
    //base_name 넣기
    var base_name = $(".base_menu_list li.select").data("name");
    formdata.append("base_name", base_name);
    //base_price 넣기
    var base_price = $(".base_menu_list li.select").data("price");
    formdata.append("base_price", base_price);
    
    if($(".f_ae_list p")!=null){

	    for(var i = 0; i<$(".f_ae_list p").length; i++){
		    // element_no 넣기
	        formdata.append("element_no", $(".f_ae_list p").eq(i).data("eno"));
	        // element_name 넣기
	        formdata.append("element_name", $(".f_ae_list p").eq(i).data("name"));
	        // element_price 넣기
	        formdata.append("element_price", $(".f_ae_list p").eq(i).data("price"));
		    // element_quantity 넣기
	        formdata.append("element_quantity", $(".f_ae_list p").eq(i).data("quantity"));
	    }
    }
//    alert(formdata.get("member_id"));
//    alert(formdata.get("base_no"));
//    alert(formdata.get("base_name"));
//    alert(formdata.get("base_price"));
//    alert(formdata.getAll("element_no"));
//    alert(formdata.getAll("element_name"));
//    alert(formdata.getAll("element_price"));
//    alert(formdata.getAll("element_quantity"));
    OrderAjax(formdata);
    
}	

function OrderAjax(formData){
	
    $.ajax({
        type: "post",
        url: "/order/ajax",
        contentType: "application/x-www.form-wrlencoded",
		data:formData,
		processData:false,
		contentType:false,
        success: function(){
            location.href="./cart";
        }
    })
}