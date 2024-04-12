package com.kh.khu.scholarships.model.vo;

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

public class Scholarships {
	
	private int schNo;
	private String schName;
	private int schAmount;
	private String schReq;

}
