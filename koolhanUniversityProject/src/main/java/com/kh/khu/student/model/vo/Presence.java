package com.kh.khu.student.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString

public class Presence {

	private int preNo; // 복학생 번호
	private String preId; // 학번
	private String preyear; // 복학 연도
	private String preSemester; // 복학 학기
	private String tbStatus; // 학생 상태
}
