package com.project.mapper;

import com.project.domain.Member;
import com.project.domain.MemberAuth;

public interface MemberMapper {
	
	public void create(Member member) throws Exception;
	public void createAuth(MemberAuth memberAuth) throws Exception;
}
