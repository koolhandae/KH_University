package com.kh.khu.project.model.vo;

import java.util.Date;

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

	private int refStudentNo;
	private int refClassNo;
	private String projectTitle;
	private String projectContent;
	private String projectType;
	private String pjOriginName;
	private String pjChangeName;
	private String pjUploadDate;
	private Date pjDueDate;
	private String pjStatus;
	
}
