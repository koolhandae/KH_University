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

public class Board {
	
	private int boardNo;
	private String boardWriter;
	private String boardTitle;
	private String boardContent;
	private int count;
	private String createDate;
	private String bStatus;
	private String originName;
	private String changeName;
	private String studentId;
	
}