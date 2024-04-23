package com.kh.khu.tuition.model.vo;

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
public class TuitionStudentMake {
	private int tutionNo;
	private int ttNo;
	private int studentNo;
	private String studentId;
	private int tuition;
	private int scholarShip;
	private int tsYear;
	private int tsSemester;
	private String tsStatus;
	
	@Builder
	TuitionStudentMake(TuitionStudent student, AdminTuitionMake tuition) {
		this.ttNo = tuition.getTtNo();
		this.studentNo = student.getStudentNo();
		this.studentId = student.getStudentId();
		this.tuition = tuition.getTbPrice();
		this.scholarShip = 0;
		this.tsYear = 2024;
		this.tsSemester = tuition.getTbSemester();
		this.tsStatus = "N";
	}
}
