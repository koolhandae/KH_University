package com.kh.khu.tuition.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class TuitionBill {
	
	private int ttNo;
	private int tuition;
	private int scholarship;
	private String tbOpen;
	private String tbClose;
	private int tbSemester;
}