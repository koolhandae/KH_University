package com.kh.khu.tuition.model.vo;

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
public class TopStudent {
	private int studentNo;
	private String studentName;
	private String totalPoint;
}
