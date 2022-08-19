package com.whm.atelier.controller.admin;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.whm.atelier.service.admin.AdminServiceImpl;
import com.whm.atelier.vo.Admin;
import com.whm.atelier.vo.Consumer;
import com.whm.atelier.vo.Coupon;

@Controller
@RequestMapping("/admin/*")
public class AdminMainController {
	
	@Autowired
	private AdminServiceImpl adminService;
	
	@RequestMapping("m/main")
	public String main() {
		return "admin/m/main";
	}
	
	@RequestMapping("lg/login")
	public String login() {
		return "admin/lg/login";
	}
	
	@RequestMapping("lg/loginProcess")
	public String loginProcess(Admin param, HttpSession session) {
		Admin admin = adminService.login(param);
		if(admin == null) {
			return "common/loginFail";
		} else {
			session.setAttribute("admin", admin);
			return "redirect:../m/main";
		}
	}
	
	@RequestMapping("lg/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:../m/main";
	}
	
	@RequestMapping("mmgt/couponMain")
	public String couponMain(Model model) {
		ArrayList<Coupon> dataList = adminService.adminCouponList();
		model.addAttribute("dataList", dataList);
//		여기다가 HashMap넣어야된다
		return "admin/mmgt/couponMain";
	}    
	
	
	@RequestMapping("mmgt/createCoupon")	
	public String createCoupon() {
		return"admin/mmgt/createCoupon";
	}
	
	@RequestMapping("mmgt/createCouponProcess")
	public String createCouponProcess(Coupon coupon) {
			
		adminService.createCoupon(coupon);
		
		return"redirect:../mmgt/couponMain";
	}
	
	@RequestMapping("mmgt/deleteCouponProcess")
	public String deleteCouponProcess(int coupon_no) {
		adminService.couponDelete(coupon_no);
		
		return"redirect:../mmgt/couponMain";
	}
	
	@RequestMapping("mmgt/totalConsumerList")
	public String totalConsumerList(Model model) {
		ArrayList<Consumer> dataList = adminService.consumerList();
		model.addAttribute("dataList", dataList);
		return "admin/mmgt/totalConsumerList";
	}
	
	@RequestMapping("mmgt/detailConsumer")
	public String detailConsumer(Model model, int consumer_no) {
		HashMap<String, Object> data = adminService.consumerData(consumer_no);
		model.addAttribute("data",data);
		return "admin/mmgt/detailConsumer";
	}	
	
	@RequestMapping("mmgt/totalGetPrice")
	public String totalGetPrice(Model model) {
		model.addAttribute("list", adminService.totalGetPrice());
		return "admin/mmgt/totalGetPrice";
	}
}
