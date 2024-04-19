package com.kh.khu.project.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString

public class StudentProject {
	 private int stpNo;
	 private String studentId;
	 private String stpOriginName;
	 private String stpChangeName;
	 private String stpStatus;
	 private Date submitTime;
}
