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

public class ClassBoard {
	
	private int classBoardNo;
	private int refClassNo; //강의고유번호
	private int cbWriter; //학생고유번호
	private String cbTitle;
	private String cbContent;
	private String cbDate;
	private String cbOriginName;
	private String cbChangeName;
	private String cbStatus;
	private int cbCount;
	private String studentName;
	private String className;
	private String classNum;
	private int rNum;
	
}
