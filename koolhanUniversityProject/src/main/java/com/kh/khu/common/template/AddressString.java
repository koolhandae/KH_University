package com.kh.khu.common.template;

import com.kh.khu.common.model.vo.Address;

public class AddressString {

	public static String AddressMake(Address a) {
		return a.getPostcode() + " " + a.getAddress() + " " + a.getDetailAddress() + " " + a.getExtraAddress();
	}
	
}
