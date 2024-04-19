package com.kh.khu.classroom.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString

public class Classroom {

	private int classNum;
	private int profNo;
	private String className;
	private String classType;
	private int classNo;			// seq로 자동생성되는 classNo;
	private int classScore;
	private String classSemester; 	//수강학기
	private String classGrade; 		// 대상학년
	private String classRoom;  		// 강의실
	private String classTime;		// 강의시간
	private String classPeople; 	// 수강정원
	private String classEtc; 		// 기타사항
	private String originName;		// 강의계획서 업로드 첨부파일 원래이름
	private String changeName;		// 강의계획서 첨부파일 바뀐이름
	private String enrollDate;		// 강의년도
	
	private String classTypeName;	// 전공필수 이런 타입네임
	private String classStatus;		// 강의삭제여부
}
