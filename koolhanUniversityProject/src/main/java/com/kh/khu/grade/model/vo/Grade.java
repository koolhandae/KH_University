package com.kh.khu.grade.model.vo;

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

public class Grade {

	private int classNo;
	private int studentNo;
	private String grade;
	private String termNo;
	
}
