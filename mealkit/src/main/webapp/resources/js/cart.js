
$(function(){
	// 전체가격 표시
	$(".order_list").each(function(){
		var sum = 0;
		var regExp = /^(\[할인\]).*/;
		
		for(var i = 0; i<$(this).find(".sum").length; i++){
			sum += parseInt($(this).find(".sum").eq(i).html());
		}
		// 할인 항목이면 가격을 10% 낮춤
		if(regExp.test($(this).find(".base_name").text())){
			sum = 0.9 * sum;
			$(this).find(".add_element_list").append("[할인 10%] = -<span class='price'>"+ (0.1*sum)+"</span>원");
		}
		$(this).find(".total_price .price").html(sum);
	})
	
	// 총 주문금액 넣기
	var totalOrderPrice = 0;
	for(var i = 0; i < $(".total_price .price").length; i++){
		totalOrderPrice += parseInt($(".total_price .price").eq(i).html());
	}
	$(".price_part .price").html(totalOrderPrice);
	
	
	// 상품 가격 부분에 form 추가
	$(".order_list").each(function(){
		var base_name = $(this).find(".base_name").text();
		var add_element = $(this).find(".add_element_list").text();
		var total_price = $(this).find(".total_price .price").text();
		$(this).find('.total_price input[name="base_name"]').val(base_name);
		$(this).find('.total_price textarea[name="add_element"]').text(add_element);
		$(this).find('.total_price input[name="total_price"]').val(total_price);
		
		//확인용 구문
//		console.log(base_name);
//		console.log(add_element);
//		console.log(total_price);
		
	})
	
	
	// 가격 화폐단위(3자리수 단위에 ,넣기)로 표시
	$(".price").each(function(){
		var money = $(this).html()
		$(this).html(MoneyFormat(money));
	})
	
	
	// 총 n건 주문하기 버튼 누르면 전체 상품 주문실행(ajax)
	$(".total_order_btn").on("click", function(){
		Total_order();
	})
	

	
})//$(function)(){} 끝

	
	

// 화폐단위 3자리마다 ',' 찍어주기(함수), 매개변수에 숫자 값만 넣어야함
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



// 전체 주문 함수
function Total_order(){
	var formData = new FormData();
	
	for(var i = 0; i < $(".order_div").length; i++){
		// base_name 집어넣기
		formData.append("base_name",$('input[name="base_name"]').eq(i).val());
		// add_element 집어넣기
		formData.append("add_element",$('textarea[name="add_element"]').eq(i).text());
		// total_price 집어넣기
		formData.append("total_price",$('input[name="total_price"]').eq(i).val());
	}
	// 확인용 구문
//	alert(formData.getAll("base_name"));
//	alert(formData.getAll("add_element"));
//	alert(formData.getAll("total_price"));
	
	$.ajax({
		type: "post",
        url: "/cart/ajax",
        contentType: "application/x-www.form-wrlencoded",
		data:formData,
		processData:false,
		contentType:false,
        success: function(){
        	alert("상품 주문이 완료되었습니다.");
        	location.reload();
        }
		
	})
}
