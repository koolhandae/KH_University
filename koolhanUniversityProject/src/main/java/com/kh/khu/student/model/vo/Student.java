package com.kh.khu.student.model.vo;

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

public class Student {
	
	private int studentNo;
	private String studentId;
	private String studentPwd;
	private String studentName;
	private String studentSsn;
	private String sPhone;
	private String sEmail;
	private String sAddress;
	private String sStatus;
	private String enrollDate;
	private String absenceDate;
	private String gradDate;

}
