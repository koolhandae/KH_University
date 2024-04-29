package com.kh.khu.common.template;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

public class SaveFile {

	// 현재 넘어온 첨부파일 그 자체를 서버의 폴더에 저장시키고, 바뀐 파일명을 리턴하는 함수
	public static String saveFile(MultipartFile upfile, HttpSession session) {

		// 파일명 수정 작업 후 서버에 업로드 시키기 ("flower.png" => "20240405154123123.png"
		String originName = upfile.getOriginalFilename();

		// "20240405030705"(년월일시분초)
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());

		int ranNum = (int) (Math.random() * 99999 + 10000); // 5자리수 랜덤숫자

		String ext = originName.substring(originName.lastIndexOf(".")); // .뒤에 오는 확장자 이름

		String changeName = currentTime + ranNum + ext; // 전부 이어붙이기

		// 업로드 시키고자 하는 폴더의 물리적인 경로 알아내기
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");

		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		// 나중에 첨부파일의 경로를 세팅할 경우(Board 객체의 changeName)
		// "/resources/uploadfiles/" 를 붙여서 세팅한다
		// ex) b.setChangeName("resources/uploadfiles" + changeName);
		return changeName;

	}
}
