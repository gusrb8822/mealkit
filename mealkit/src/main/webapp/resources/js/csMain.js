$(function(){
	// 질문 항목 눌렀을 때 답변항목 뜨게하기
	$(".question").on("click",function(){
		if($(this).next(".answer").css("display") == "flex"){
			$(".answer").css("display","none");
		}else{
			$(".answer").css("display","none");
			$(this).next(".answer").css("display","flex");
		}
	})
	
	
	// 몇개씩 보기 항목이 바뀔 때마다 그 항목 바로 적용
    $('select[name="amount"]').on("change", function(){
    	$(".page_form").submit();
    })
	
	
})