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

public class Address {
	private String postcode;
	private String address;
	private String detailAddress;
	private String extraAddress;
	
}
