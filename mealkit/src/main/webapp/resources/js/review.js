$(function(){
    // 리뷰 리스트에서 각 리뷰 항목 클릭 시 상세내용 뜨게하기
    $(".review_box").on("click", function(){
    	// 데이터 값 바꾸기
        $(".detail_writer").text($(this).children(".writer").text());
        $(".detail_point .point_checked").attr("data-value", $(this).find(".point_checked").data("value"));
        $(".detail_date").text($(this).find(".order_date").text());
        $(".detail_order").html($(this).find(".order_menu_list").html());
        $(".detail_content_text").text($(this).find(".review_content").text());
        $(".detail_imgs").html($(this).find(".review_imgs").html());
        
        // 리뷰 이미지를 클릭하면 이미지가 크게 보이는 기능 추가
        $(".detail_imgs .click_img").on("click", function(){
        	$(".detail_background").css("display","none");
        	$(".img_background").css("display","block");
        	$(".size_up_img img").attr("src",$(this).find("img").attr("src"));
        })
        // 사이즈 업된 이미지를 볼 때 배경을 클릭하면 꺼지는 기능을 추가
        $(".img_background").on("click", function(){
        	$(this).css("display", "none");
        	$(".detail_background").css("display","block");
        })
        
        // 보이게하기
        $(".review_detail").fadeIn(300);
        
        // 원래 화면 스크롤이 움직이지 않도록 스크롤을 없애버림
        $("#wrap").css({
            "overflow":"hidden",
            "height":"960px"
        });
    })
    
    // 상세보기가 떠있는 상태에서 배경 클릭하면 사라지게 하기
    $(".detail_background").on("click", function(){
        $(".review_detail").fadeOut(300);
        $("#wrap").css({
            "overflow":"auto",
            "height":"auto"
        });
    })

    // 상세보기가 떠있는 상태에서 닫기버튼 누르면 사라지게하기
    $(".close_detail_btn a").on("click", function(e){
    	e.preventDefault();
        $(".review_detail").fadeOut(300);
        $("#wrap").css("overflow","auto");
        $("#wrap").css({
            "overflow":"auto",
            "height":"auto"
        });
    })
    
    

    // 상세보기에서 주문한 메뉴 위에 마우스 오버 시 주문한 메뉴 파트 밑으로 내려오면서 커지기
    $(".detail_order").on("mouseover", function(){
        $(this).stop().animate({"height":"500px"}, 300);
        $(this).css("overflow-y","scroll");
    })
    $(".detail_order").on("mousemove", function(){
        $(this).css("overflow-y","scroll");
    })
    // 상세보기에서 주문한 메뉴 위에 마우스 아웃 시 주문한 메뉴 파트 위로 올라가면서 작아지기
    $(".detail_order").on("mouseout", function(){
        $(this).stop().animate({"height":"45px"}, 300);
        $(this).css("overflow-y","hidden");
    })
    
    // 몇개씩 보기 항목이 바뀔 때마다 그 항목 바로 적용
    $('select[name="amount"]').on("change", function(){
    	$(".page_form").submit();
    })
    
})