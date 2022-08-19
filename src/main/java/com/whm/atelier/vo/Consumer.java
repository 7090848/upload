package com.whm.atelier.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

// 구매자
public class Consumer {
	private int consumer_no;
	private int consumer_tier_no;
	private String consumer_id;				
	private String consumer_pw;				
	private String consumer_name;
	private String consumer_nickname;
	private String consumer_phone;
	private String consumer_email;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date consumer_birth;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date consumer_joindate;
	private int consumer_totalpoint;				// 현재 보유 포인트
	private String consumer_delete_yn;				// 탈퇴여부
	private String consumer_rec_code;				// 내 추천인 코드
	private String consumer_input_rec_code;			// 입력한 추천인 코드
	
	private List<Cart> cartList;
	private ConsumerAddress address;
//	private List<Coupon> couponList;
	
	/**
	 * 
	 */
	public Consumer() {
		super();
	}

	/**
	 * @param consumer_rec_code
	 */
	// 아이디 & 비밀번호만 담긴 생성자 (로그인 시 사용)
	public Consumer(String consumer_rec_code) {
		this.consumer_rec_code = consumer_rec_code;
	}
	
	/**
	 * @param consumer_id
	 * @param consumer_pw
	 */
	// 아이디 & 비밀번호만 담긴 생성자 (로그인 시 사용)
	public Consumer(String consumer_id, String consumer_pw) {
		this.consumer_id = consumer_id;
		this.consumer_pw = consumer_pw;
	}
	
	/**
	 * @param consumer_no
	 * @param consumer_tier_no
	 * @param consumer_id
	 * @param consumer_pw
	 * @param consumer_name
	 * @param consumer_nickname
	 * @param consumer_phone
	 * @param consumer_email
	 * @param consumer_birth
	 * @param consumer_joindate
	 * @param consumer_totalpoint
	 * @param consumer_delete_yn
	 * @param consumer_rec_code
	 * @param consumer_input_rec_code
	 * @param cartList
	 * @param address
	 */
	public Consumer(int consumer_no, int consumer_tier_no, String consumer_id, String consumer_pw, String consumer_name,
			String consumer_nickname, String consumer_phone, String consumer_email, Date consumer_birth,
			Date consumer_joindate, int consumer_totalpoint, String consumer_delete_yn, String consumer_rec_code,
			String consumer_input_rec_code, List<Cart> cartList, ConsumerAddress address) {
		super();
		this.consumer_no = consumer_no;
		this.consumer_tier_no = consumer_tier_no;
		this.consumer_id = consumer_id;
		this.consumer_pw = consumer_pw;
		this.consumer_name = consumer_name;
		this.consumer_nickname = consumer_nickname;
		this.consumer_phone = consumer_phone;
		this.consumer_email = consumer_email;
		this.consumer_birth = consumer_birth;
		this.consumer_joindate = consumer_joindate;
		this.consumer_totalpoint = consumer_totalpoint;
		this.consumer_delete_yn = consumer_delete_yn;
		this.consumer_rec_code = consumer_rec_code;
		this.consumer_input_rec_code = consumer_input_rec_code;
		this.cartList = cartList;
		this.address = address;
	}

	public int getConsumer_no() {
		return consumer_no;
	}

	public void setConsumer_no(int consumer_no) {
		this.consumer_no = consumer_no;
	}
	
	public int getConsumer_tier_no() {
		return consumer_tier_no;
	}
	
	public void setConsumer_tier_no(int consumer_tier_no) {
		this.consumer_tier_no = consumer_tier_no;
	}

	public String getConsumer_id() {
		return consumer_id;
	}

	public void setConsumer_id(String consumer_id) {
		this.consumer_id = consumer_id;
	}

	public String getConsumer_pw() {
		return consumer_pw;
	}

	public void setConsumer_pw(String consumer_pw) {
		this.consumer_pw = consumer_pw;
	}

	public String getConsumer_name() {
		return consumer_name;
	}

	public void setConsumer_name(String consumer_name) {
		this.consumer_name = consumer_name;
	}

	public String getConsumer_nickname() {
		return consumer_nickname;
	}

	public void setConsumer_nickname(String consumer_nickname) {
		this.consumer_nickname = consumer_nickname;
	}

	public String getConsumer_phone() {
		return consumer_phone;
	}

	public void setConsumer_phone(String consumer_phone) {
		this.consumer_phone = consumer_phone;
	}

	public String getConsumer_email() {
		return consumer_email;
	}

	public void setConsumer_email(String consumer_email) {
		this.consumer_email = consumer_email;
	}

	public Date getConsumer_birth() {
		return consumer_birth;
	}

	public void setConsumer_birth(Date consumer_birth) {
		this.consumer_birth = consumer_birth;
	}

	public Date getConsumer_joindate() {
		return consumer_joindate;
	}

	public void setConsumer_joindate(Date consumer_joindate) {
		this.consumer_joindate = consumer_joindate;
	}

	public int getConsumer_totalpoint() {
		return consumer_totalpoint;
	}

	public void setConsumer_totalpoint(int consumer_totalpoint) {
		this.consumer_totalpoint = consumer_totalpoint;
	}

	public String getConsumer_delete_yn() {
		return consumer_delete_yn;
	}

	public void setConsumer_delete_yn(String consumer_delete_yn) {
		this.consumer_delete_yn = consumer_delete_yn;
	}
	
	public String getConsumer_rec_code() {
		return consumer_rec_code;
	}
	
	public void setConsumer_rec_code(String consumer_rec_code) {
		this.consumer_rec_code = consumer_rec_code;
	}
	
	public String getConsumer_input_rec_code() {
		return consumer_input_rec_code;
	}
	
	public void setConsumer_input_rec_code(String consumer_input_rec_code) {
		this.consumer_input_rec_code = consumer_input_rec_code;
	}
	
	public List<Cart> getCartList() {
		return cartList;
	}
	
	public void setCartList(List<Cart> cartList) {
		this.cartList = cartList;
	}
	
	public ConsumerAddress getAddress() {
		return address;
	}
	
	public void setAddress(ConsumerAddress address) {
		this.address = address;
	}
	
	@Override
	public String toString() {
		return "Consumer[consumer_no=" + consumer_no
				+ ", consumer_tier_no=" + consumer_tier_no
				+ ", consumer_id=" + consumer_id
				+ ", consumer_pw=" + consumer_pw
				+ ", consumer_name=" + consumer_name
				+ ", consumer_nickname=" + consumer_nickname
				+ ", consumer_phone=" + consumer_phone
				+ ", consumer_email=" + consumer_email
				+ ", consumer_birth=" + consumer_birth
				+ ", consumer_joindate=" + consumer_joindate
				+ ", consumer_totalpoint=" + consumer_totalpoint
				+ ", consumer_delete_yn=" + consumer_delete_yn
				+ ", consumer_rec_code=" + consumer_rec_code
				+ ", consumer_input_rec_code=" + consumer_input_rec_code
				+ ", cartList=" + cartList
				+ ", address=" + address
				+ "]";
	}
	
}
