package org.phg.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.UUID;
import org.phg.model.AttachFileDTO;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
public class UploadFileController {
String uploadFolder="E:\\portfolio\\workspace\\mealkit\\src\\main\\webapp\\resources\\img";
	
	// 폴더 생성할 이름
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		// 오늘날짜 
		Date date = new Date();
		// sun Dec 17 1995 03:24:00 GMT이런 형식을 > 1995-10-17 이런식으로 바꿔 줌
		String str = sdf.format(date);
		
		return str.replace("-", File.separator);
	}
	
	// 사용자가 업로드한 파일이 이미지 타입인지를 검사하는 메소드(이미지 타입 : true, 아니면 : false)
	private boolean checkImageType(File file) {
		try{
			// 업로드된 파일의 유형을 contentType에 저장
			String contentType = Files.probeContentType(file.toPath());
			return contentType.startsWith("image");
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	
	
	
	@RequestMapping(value = "/uploadAjaxAction", produces=MediaType.APPLICATION_JSON_UTF8_VALUE, method = RequestMethod.POST)
	public ResponseEntity<ArrayList<AttachFileDTO>> UploadAjaxAction(MultipartFile[] uploadFile) {
		ArrayList<AttachFileDTO> list = new ArrayList();
		// 폴더 생성
			File uploadPath = new File(uploadFolder, getFolder());
			
			if(uploadPath.exists() == false){// 생성된 폴더가 없으면 폴더 생성
				uploadPath.mkdirs(); // make directory : 폴더를 만듬
			}
		
		// 확장된 for문( 	타입		변수명     :    배열명) // 가독성 좋음, 속도는 살짝 떨어짐
		for(MultipartFile multipartFile:uploadFile) {
			AttachFileDTO attachDTO = new AttachFileDTO(); 
			
//			System.out.println("사용자가 업로드한 실제 파일명: " + multipartFile.getOriginalFilename());
//			System.out.println("사용자가 업로드한 실제 용량크기: " + multipartFile.getSize() + "Byte");
			
			// 업로드 할 파일이름이 같은 경우를 방지하기 위한 처리
			String uploadFileName = multipartFile.getOriginalFilename();
			// attachDTO에 파일이름 저장
			attachDTO.setFileName(uploadFileName);
			
			// UUID 문자열 생성
			UUID uuid = UUID.randomUUID();
			
			// UUID 문자열 + "_" + multipartFile.getOriginalFilename()
			uploadFileName = uuid.toString()+"_"+uploadFileName;
			
			// File savaFile=new File(업로드 경로, 파일을 저장할 이름);
			File saveFile = new File(uploadPath, uploadFileName);
			
			// attachDTO에 경로저장
			attachDTO.setUploadPath(getFolder());
			// attachDTO에 UUID 저장
			attachDTO.setUuid(uuid.toString());
			
			try { // transferTo() 메소드를 사용할 때는 무조건 예외처리를 해 주어야 한다.
				multipartFile.transferTo(saveFile);
				if(checkImageType(saveFile)) {// saveFile의 파일이 이미지파일이면
					// attachDTO에 이미지파일 여부를 저장
					attachDTO.setImage(true); // 기본값 false
					// 원본이미지파일 유지, 썸네일용 복사본 만들기
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
					//썸네일 생성					//파일(원본이미지 복사)				, 이름	   ,width, height
					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 150, 150);
					// 메모리에서 썸네일 회수
					thumbnail.close();
				}
			} catch (IllegalStateException | IOException e) {
				System.out.println(e.getMessage());
			}
			System.out.println();
			list.add(attachDTO);
		}// for문 끝
		return new ResponseEntity<ArrayList<AttachFileDTO>>(list, HttpStatus.OK);
	}
	
	
	// 업로드한 이미지 주소(get방식)를 만드는 메서드 (localhost:8080/display?fileName=경로/파일명)
	@RequestMapping(value = "/display", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getFile(String fileName) {
//		System.out.println(uploadFolder+"\\"+fileName);
		File file = new File(uploadFolder+"\\"+fileName);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
