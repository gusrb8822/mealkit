var check1 = false;
var check2 = false;
var check3 = false;

$(function(){
	
    
	
	// 입력한 ID 유효성 검사
	$("#id").on("change", function(){
        // 아이디 조건 * 5~20자의 영어 소문자, 숫자와 특수기호(_),(-)만 사용 가능
		var regExp = /^[a-z|0-9|_|-]{5,20}$/;
		var inputId = $(this).val();
        if(!regExp.test(inputId)){
            $(this).parent().next(".guide_message").css("display", "block");
            check1 = false;
        }else{
        	$(this).parent().next(".guide_message").css("display", "none");
            // 아이디 중복확인
            CheckId(inputId);
        }
        
    })
    
    // 입력한 비밀번호 유효성 검사
	$("#pw").on("change", function(){
        // 비밀번호 조건 * 8~16자의 영어 대ㆍ소문자, 숫자, 특수문자만 입력 가능합니다.
		var regExp = /^[a-z|A-Z|0-9|(!@#$%^*()\-_=+\\\|\[\]{};:\'",.&lt;&gt;\/?)]{8,16}$/;
		var inputPw = $(this).val();
        if(!regExp.test(inputPw)){
            $(this).parent().next(".guide_message").css("display", "block");
            check2 = false;
        }else{
        	$(this).parent().next(".guide_message").css("display", "none");
        	check2 = true;
        }
    })

        // 입력한 비밀번호 확인
	$("#pwCheck").on("change", function(){
		var inputPw = $("#pw").val();
		var inputPwCheck = $("#pwCheck").val();
        if(inputPw != inputPwCheck){
            $(this).parent().next(".guide_message").css("display", "block");
            check3 = false;
        }else{
        	$(this).parent().next(".guide_message").css("display", "none");
        	check3 = true;
        }
    })
    
	// 유효성 검사를 모두 통과해야 가입가능
    $("#joinBtn").on("click", function(){
    	if(check1 && check2 && check3){
    		$("#joinForm").submit();
    	}else{
    		alert("조건이 충족되지 않는 항목이 있습니다.");
    	}
    })
	

	
})


// ajax를 이용한 중복검사 함수(function)
function CheckId(id){
	$.ajax({
		type: "get",
		url: "/member"+id,
		success: function(result){
			if(result == "overlap"){
				// 중복
				check1 = false;
				$(".guide_message:nth-child(3)").css("display", "block");
			}else if(result == "notOverlap"){
				// 중복아님
				check1 = true;
				$(".guide_message:nth-child(3)").css("display", "none");
			}
		}
		
	})
			
}
