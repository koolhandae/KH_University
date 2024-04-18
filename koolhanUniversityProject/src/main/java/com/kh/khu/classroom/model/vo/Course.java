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


public class Course {
	private int courseNo; 
	private int classNum; 
	private String studentId; 
	private String courseYear; 
	private String courseSemester; 
	private String courseStatus; 
	
	private String classGrade;
	private String className;
	private String classRoom;
	private String classTitle;
	private String classScore;
	private String classTime;
	
}
