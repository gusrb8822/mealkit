$(function(){
	
	// 몇개씩 보기 항목이 바뀔 때마다 그 항목 바로 적용
    $('select[name="amount"]').on("change", function(){
    	$(".page_form").submit();
    })
	
})