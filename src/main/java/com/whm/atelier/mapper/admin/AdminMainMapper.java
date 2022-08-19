package com.whm.atelier.mapper.admin;

import java.util.List;
import java.util.Map;

import com.whm.atelier.vo.Admin;

public interface AdminMainMapper {
	
	// 아이디와 패스워드로 계정 정보 불러오기
	public Admin selectByIdAndPw(Admin param);
	
	public Admin selectByAd(Admin admin);
	
	public Admin selectByNoAd(int admin_no);
	
	public List<Map<String, Object>> totalGetPrice();
}

