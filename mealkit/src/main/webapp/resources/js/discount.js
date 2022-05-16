$(function(){
	// 가격 세자리수 단위로 ,넣기
	$(".price").each(function(){
		$(this).text(MoneyFormat($(this).text()));
	})
	
	// discount_box에 마우스를 올리면 그림이 없어지고 구성품 파트가 길어지면서 구성품을 다 볼 수 있게 함
	$(".discount_box").on("mouseover", function(){
		$(this).find(".discount_img").stop().slideUp(500);
		$(this).find(".discount_config").stop().animate({"height":"241px"}, 500);
	})
	$(".discount_box").on("mouseout", function(){
		$(this).find(".discount_img").stop().slideDown(500);
		$(this).find(".discount_config").stop().animate({"height":"70px"}, 500);
	})
	
	// discount_box에 마우스 클릭을 하면 박스가 어둡게 변하고 구매버튼과 장바구니버튼이 생김
	$(".discount_box").on("click", function(){
		$(this).parents("li").find(".hide_box").css("display","flex");
	})
	
	$(".hide_box").on("click", function(){
		$(this).css("display","none");
	})
	
	
	// buy_btn과 cart_btn을 눌렀을 때 controller로 form정보를 보냄
	$(".buy_btn").on("click", function(e){
		e.preventDefault();
		$(this).siblings("input[name='buy_type']").val("buy");
		$(this).parents("form").submit();
	})
	$(".cart_btn").on("click", function(e){
		e.preventDefault();
		$(this).siblings("input[name='buy_type']").val("cart");
		$(this).parents("form").submit();
	})
	
	// 몇개씩 보기 항목이 바뀔 때마다 그 항목 바로 적용
    $('select[name="amount"]').on("change", function(){
    	$(".page_form").submit();
    })
	
})


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