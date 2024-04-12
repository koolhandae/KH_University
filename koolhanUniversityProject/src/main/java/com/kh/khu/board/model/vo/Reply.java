package com.kh.khu.board.model.vo;

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

public class Reply {

	private int replyNo;
	private int refBoardNo;
	private String replyWriter;
	private String replyContent;
	private String createDate;
	private String rStatus;
	
}
