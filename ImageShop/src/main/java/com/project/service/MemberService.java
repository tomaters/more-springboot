package com.project.service;

import java.util.List;

import com.project.domain.Member;

public interface MemberService {

	public void register(Member member) throws Exception;
	
	public List<Member> list() throws Exception;
	
	public Member read(int userNo) throws Exception;
	
	public void modify(Member member) throws Exception;

}
