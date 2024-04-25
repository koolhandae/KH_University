package com.kh.khu.member.model.vo;

import java.util.Date;

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
public class MemberPresence {
	
	private int preNo; // 복학생 번호
	private String preId; // 학번
	private String preYear; // 복학 연도
	private String preSemester; // 복학 학기
	private String tbStatus; // 복학서 상태
	private String preInsert; // 복학서 신청일
	private String preUpdate; // 복학서 수정일

}
