$(function(){
	// 별점 위에 마우스를 가져가면 그에 맞춰서 별 개수가 채워짐(a태그의 background-position변경예정)
	$(".point").on("mouseover",function(){
		for(var i = 0; i<$(".point").length; i++){
			$(".point").eq(i).css("backgroundPosition", "0 30px");
		}
		for(var i = 0; i<=$(this).index(); i++){
			$(".point").eq(i).css("backgroundPosition", i*(-36) +"px 0");
		}
	})
	$(".point").on("mouseout",function(){
		for(var i = 0; i<$(".point").length; i++){
			$(".point").eq(i).css("backgroundPosition", "0 30px");
		}
		CheckPoint();
	})
	
	
	// 별점 위에서 마우스를 클릭하면 그 위치에 맞는 점수가 체크 됨
	$(".point").on("click",function(e){
		e.preventDefault();
		$("input[name='review_point']").prop("checked", false);
		$("input[name='review_point']").removeClass("checked");
		$("input[name='review_point']").eq($(this).index()).prop("checked", true);
		$("input[name='review_point']").eq($(this).index()).addClass("checked");
		CheckPoint();
	})
	
	
	
	// 파일 업로드 관련
	// 파일선택버튼에 내용이 바뀌면
	$("input[type='file']").on("change", function(){
		// html의 form태그와 같은 역할을 하는 FormData객체
		// formData는 가상의 <form>태그로 생각
		// ajax를 이용하는 파일 업로드는 FormData를 이용해서 필요한 파라미터를 담아서 전송.
		var formData = new FormData();
		var inputFile = $("input[name='uploadFile']");
		// 속성 선택자를 사용할 경우 클래스 선택자를 이용한 것 처럼 데이터가 배열의 형태로 저장된다.
		// 그러므로 거기에 속하는 항목이 1개뿐이더라도 개체가 1개인 배열의 형태가 되어 [0]을 붙인다. 
		var files=inputFile[0].files;
		
		for(var i=0; i<files.length; i++){
			//파일 정보(files[i])를 보내기 전에 파일을 검사(크기, 확장자)
			if(!CheckExtension(files[i].name, files[i].size)){
				return false;
			}
			// formData에 파일을 담음
			formData.append("uploadFile", files[i]);
		}// for
		
		$.ajax({
			type:"post",
			url:"../uploadAjaxAction",
			data:formData,
			processData:false,
			contentType:false,
			success: function(result){
				console.log(result);
				
				var str="";
				for(var i=0; i<result.length; i++){
					str +="<p data-path='"+result[i].uploadPath+"' data-fileName='"+result[i].fileName+"' data-uuid='"+result[i].uuid+"' data-image='true'>";
					str +="<img src='/display?fileName="+encodeURIComponent(result[i].uploadPath+"/s_"+result[i].uuid+"_"+result[i].fileName)+"'>";
					str +="</p>";
				}
				$(".show_upload_file").html(str);
			}
			
		})
		
	})
	
	// 업로드 버튼을 눌렀을 때 파일에 관한 정보를 담아서 전송
	var formObj = $("#form");
	$(".write_btn").on("click",function(e){
		e.preventDefault();
		
		var str="";
		$(".show_upload_file p").each(function(i, obj){
			console.log($(obj));
			str +="<input type='hidden' name='attach["+i+"].fileName' value='"+$(obj).data('filename')+"'>"
			str +="<input type='hidden' name='attach["+i+"].uploadPath' value='"+$(obj).data('path')+"'>"
			str +="<input type='hidden' name='attach["+i+"].uuid' value='"+$(obj).data('uuid')+"'>"
			str +="<input type='hidden' name='attach["+i+"].image' value='"+$(obj).data('image')+"'>"
		})
		formObj.append(str);
		
		formObj.submit();
	})
	
	
	
})


// 별점 체크점수에 맞게 이미지 고정
function CheckPoint(){
	var check = 0;
	if($("input.checked")!=null){
		check = $("input.checked").index() + 1;
	}
	for(var i = 0; i<check; i++){
		$(".point").eq(i).css("backgroundPosition", i*(-36) +"px 0");
	}
}


//파일의 확장자나 크기의 제한하는 기능의 함수 선언
//파일의 확장자가 이미지 파일 확장자가 아니면 업로드 제한
var regex = new RegExp("(.*)\.(jpg|jpeg|png|tif|tiff|raw|rle|dib|bmp)$");
//크기제한
var maxSize = 5242880; // 5MB 제한

function CheckExtension(fileName, fileSize){
	if(fileSize >= maxSize){
		alert("파일 사이즈 초과");
		return false;
	}else if(!regex.test(fileName)){
		alert("이미지 파일만 업로드 가능합니다.");
		return false;
	}
	return true;
}

