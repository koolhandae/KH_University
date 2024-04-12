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
public class TuitionPayment {

	private int tpNo;
	private int refTuitionNo;
	private String tpDate;
	private int totalPrice;
	
}
