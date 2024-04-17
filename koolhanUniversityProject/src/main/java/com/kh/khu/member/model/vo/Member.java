package com.kh.khu.member.model.vo;

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

public class Member {

	private int memberNo;
	private String memberId;
	private String memberPwd;
	private String memberName;
	private String memberSsn;
	private String mePhone;
	private String meEmail;
	private String meAddress;
	private String meType;
	private String meStatus;
	
}
