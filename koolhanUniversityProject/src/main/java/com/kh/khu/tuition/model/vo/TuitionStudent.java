package com.kh.khu.tuition.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class TuitionStudent {
	private int studentNo;
	private String studentId;
	private String studentPwd;
	private String studentName;
	private String studentSsn;
	private String stPhone;
	private String stEmail;
	private String stAddress;
	private String stStatus;
	private String enrollDate;
	private String absenceDate;
	private String gradDate; 
}
