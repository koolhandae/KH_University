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

public class Class {

	private int classNo;
	private int profNo;
	private String className;
	private String classType;
	private int classScore;
	
}
