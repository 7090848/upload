package com.whm.atelier.controller.customer;


import java.util.Date;

import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;

@EnableScheduling
@Controller
public class ScheduleController {

	
	
	@Scheduled(cron = "10 5 * * * *")
	public void scheduleInsertMoney() {		    
		
		System.out.println("은행에서 매달마다 돈 입금되게 하기... 이건 후에 다시 생각해봅시다"+new Date().toString());
	    	
	}
}
