package com.kh.khu.scholarships.model.vo;

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
public class ScholarshipsStu {
	
	private int schStuNo;
	private int schNo;
	private int studentNo;
	private String schStuDate;
	private String schStuState;
	private String schStuSemester;

}
