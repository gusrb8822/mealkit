var check1 = true;
var check2 = true;

$(function(){
    
    // 입력한 비밀번호 유효성 검사
	$("#pw").on("change", function(){
        // 비밀번호 조건 * 8~16자의 영어 대ㆍ소문자, 숫자, 특수문자만 입력 가능합니다.
		var regExp = /^[a-z|A-Z|0-9|(!@#$%^*()\-_=+\\\|\[\]{};:\'",.&lt;&gt;\/?)]{8,16}$/;
		var inputPw = $(this).val();
        if(!regExp.test(inputPw)){
            $(this).parent().next(".guide_message").css("display", "block");
            check1 = false;
        }else{
        	$(this).parent().next(".guide_message").css("display", "none");
        	check1 = true;
        }
    })

        // 입력한 비밀번호 확인
	$("#pwCheck").on("change", function(){
		var inputPw = $("#pw").val();
		var inputPwCheck = $("#pwCheck").val();
        if(inputPw != inputPwCheck){
            $(this).parent().next(".guide_message").css("display", "block");
            check2 = false;
        }else{
        	$(this).parent().next(".guide_message").css("display", "none");
        	check2 = true;
        }
    })
    
	// 유효성 검사를 모두 통과해야 가입가능
    $("#joinBtn").on("click", function(){
    	if(check1 && check2){
    		$("#joinForm").submit();
    	}else{
    		alert("조건이 충족되지 않는 항목이 있습니다.");
    	}
    })
	
	$("#cancelBtn").on("click", function(){
		location.href="/myPage";
	})
})
