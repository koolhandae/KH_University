package com.kh.khu.common.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString

public class ProfilePicture {

	private int imgNo;
	private int refMemberNo;
	private int refStudentNo;
	private String originName;
	private String changeName;
	
}
