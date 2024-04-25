package com.kh.khu.project.model.vo;


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

public class Project {

	private int pjNo; 		//SEQ 순서
	private String pjClassName; 	// 강의명
	private String pjTitle; // 과제 제목
	private String pjContent; //과제 내용
	private String pjDeadline; // 과제 마감일
	private String pjProfessor; // 과제 내준 교수
	private String classNum; // 강의번호
	private String pjClassNo; //강의seq번호	
}
