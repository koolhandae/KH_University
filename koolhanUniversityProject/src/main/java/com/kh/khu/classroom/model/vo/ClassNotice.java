package com.kh.khu.classroom.model.vo;

import java.sql.Date;

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

public class ClassNotice {

	private int classNoticeNo;
	private int refClassNo;
	private int cnWriter;
	private String cnTitle;
	private String cnContent;
	private String cnDate;
	private String cnOriginName;
	private String cnChangeName;
	private String cnStatus;
	private int cnCount;
	private String memberName;
	private String className;
}
