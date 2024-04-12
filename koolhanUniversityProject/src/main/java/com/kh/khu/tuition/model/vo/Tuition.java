package com.kh.khu.tuition.model.vo;

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

public class Tuition {

	private int ttNo;
	private int studentNo;
	private int stuGrade;
	private String termNo;
	private int tuition;
	private int scholarship;
	
}
