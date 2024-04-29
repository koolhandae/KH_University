package com.kh.khu.common.model.vo;

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

public class Calendar {
	 private int calendarNo;
	 private int studentNo;
	 private String calTitle;
	 private String calStartDate;
	 private String calEndDate;
	 private String backgroundColor;
	 private String createDate;
	 private String updateDate;
	 private String calStatus;
}


