$(function(){
    var slideIndex = $(".main_img ul li").length;
    var slideNum = 0;
    var time;


    //.main_slide
    // pager 생성
    var pagerHtml = "<ul>";
    for(var i = 0; i < slideIndex; i++){
        pagerHtml += "<li><a href='#'>" + (i+1) + "</a></li>";
    }
    pagerHtml += "</ul>";
    $(".ms_pager").html(pagerHtml);

    //pager 첫 번째 li on class주기
    $(".ms_pager ul li").eq(0).addClass("on");

    //slide 표시, pager생성 이후에 해야함
    GoSlide();

    // 시간마다 슬라이드 변경
    TimeSet();

    //pager에 슬라이드 이동 기능 주기
    $(".ms_pager ul li").click(function(){
        slideNum = $(this).index();
        GoSlide();
    })


    //prev, next 버튼 활성화
    $(".ms_prev a").click(function(){
        if(slideNum == 0){
            slideNum = slideIndex - 1;
        }else{
            slideNum--;
        }
        GoSlide();
    })

    $(".ms_next a").click(function(){
        if(slideNum == slideIndex - 1){
            slideNum = 0;
        }else{
            slideNum++;
        }
        GoSlide();
    })


    // 마우스가 main_slide위에 올라가면 시간마다 바뀌던 슬라이드 정지(clearInterval)
    $(".main_slide").mouseover(function(){
        clearInterval(time);
    })

    // 마우스가 벗어나면 다시 슬라이드 시간마다 변경
    $(".main_slide").mouseout(function(){
        TimeSet();
    })

    


    // event 리스트에 각각 마우스를 올리면 본래이미지 사이즈가 되고 벗어나면 원래대로
    $(".ev_list p a").mouseover(function(){
        $(".ev_list p a").stop(true).animate({width : 0}, 300)
        $(this).stop(true).animate({width : "1200px"}, 300)
        $(this).find("img").stop(true).animate({left : 0}, 300)
    })

    $(".ev_list p a").mouseout(function(){
        $(".ev_list p a").stop(true).animate({width : "400px"}, 300)
        $(this).find("img").stop(true).animate({left : "-400px"}, 300)
    })


    // 가격표시 3자리수 단위로 ,찍기
    $(".price").each(function(){
    	$(this).text(MoneyFormat($(this).text()));
    })

    
    
    
 // 원하는 슬라이드로 이동(함수)
 // fade in/out으로 바꿀예정 slideNum와 같은 index로 슬라이드를 변경
 // 슬라이드 변경에 따라 pager도 변경
 function GoSlide(){
     $(".main_img ul li").stop(true).fadeOut(300);
     $(".main_img ul li").eq(slideNum).stop(true).fadeIn(300);
     $(".ms_pager ul li").removeClass("on");
     $(".ms_pager ul li").eq(slideNum).addClass("on");
 }

 // 시간마다 슬라이드가 바뀌도록 설정(함수)
 function TimeSet(){
     time = setInterval(function(){
         if(slideNum == slideIndex -1){
             slideNum = 0;    
         }else{
             slideNum++;
         }
         GoSlide();
     }, 5000)
 }
    
    
    
})



//화폐단위 3자리마다 ',' 찍어주기(함수)
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


