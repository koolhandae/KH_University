package com.kh.khu.project.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString

public class StudentProject {
	 private int stpNo;
	 private int studentNo; // 학생고유번호
	 private int ClassNo; //강의고유번호
	 private String stpOriginName;
	 private String stpChangeName;
	 private String stpStatus;
	 private Date submitTime;
	 private int stpPjNo;
	 private String pjClassName;
	 private String pjTitle; // 과제 제목
	 private String pjDeadline; // 과제 마감일
	 private int count; // 과제 마감일
	 private int rnum; // 과제 마감일
	 
	 private String studentName;
	 private String studentId;
}
