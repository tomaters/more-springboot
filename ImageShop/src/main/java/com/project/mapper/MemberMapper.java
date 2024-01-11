package com.project.mapper;

import java.util.List;

import com.project.domain.Member;
import com.project.domain.MemberAuth;

public interface MemberMapper {
	
	public void create(Member member) throws Exception;
	
	public void createAuth(MemberAuth memberAuth) throws Exception;
	
	public List<Member> list() throws Exception;
	
	public Member read(int userNo) throws Exception;
	
	public void modifyAuth(MemberAuth memberAuth) throws Exception;
	
	public void update(Member member) throws Exception;

}
