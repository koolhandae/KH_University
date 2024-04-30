package com.kh.khu.notice.model.vo;

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

public class Notice {
	

	private int noticeNo;
	private String noticeWriter;
	private String noticeTitle;
	private String noticeContent;
	private String createDate;
	private String nstatus;
}
