package com.whm.atelier.mapper.consumer;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.whm.atelier.vo.Consumer;
import com.whm.atelier.vo.ConsumerAddress;
import com.whm.atelier.vo.ConsumerPointLog;
import com.whm.atelier.vo.ConsumerTier;

public interface ConsumerMainMapper {

	public int createConsumerPk();
	
	// 아이디와 패스워드로 계정 정보 불러오기
	public Consumer selectByIdAndPw(Consumer param);
	
	// 회원가입
	public void register(Consumer param);
	
	// 회원정보 변경
	public void updateConsumerInfo();
	
	// 포인트 적립/사용
	public void updateConsumerPoint(@Param("consumer_no") int consumer_no, @Param("point") int point);
	
	// 포인트 적립/사용 로그 추가
	public void insertConsumerPointLog(ConsumerPointLog consumerPointLog);
	
	// 포인트 적립/사용 로그 조회
	public List<ConsumerPointLog> selectConsumerPointLog(int consumer_no);
	
	// 회원 탈퇴
	public void deleteConsumer(int consumer_no);
	
	// 회원번호로 전체정보 출력하기
	public Consumer selectByConsumerNo(int consumer_no);
	
	// 추천인입력 시 회원 존재여부 확인
	public Consumer selectByRecCode(String recommend_code);
	
	// 회원 등급 변경
	public void updateConsumerTier(@Param("consumer_tier_no") int consumer_tier_no, @Param("consumer_no") int consumer_no);
	
	// 등급별 정보 조회
	public ConsumerTier selectConsumerTier(int consumer_tier_no);
	
	// 회원 배송지 정보 조회
	public ConsumerAddress selectConsumerAddress(int consumer_no);
	
	//지정 consumer no 전체
	public Consumer selectByNoCon(int consumer_no);
	
	public ArrayList<Consumer> selectAllCon();
	
	public Map<String, Object> myTierInfo(Map<String, Object> param);
	
}
