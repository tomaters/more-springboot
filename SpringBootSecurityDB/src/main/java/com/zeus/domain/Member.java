package com.zeus.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Member implements Serializable {

	private static final long serialVersionUID = 582999266267533096L;
	private int userNo;
	private String userId;
	private String userPw;
	private String userName;
	private boolean enabled;
	
	private Date regDate;
	private Date updDate;
	
	private List<MemberAuth> authList;
}
