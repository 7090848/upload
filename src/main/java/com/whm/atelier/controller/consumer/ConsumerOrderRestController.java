package com.whm.atelier.controller.consumer;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.whm.atelier.service.consumer.ConsumerOrderServiceImpl;

@RestController
@RequestMapping("/consumer/*")
public class ConsumerOrderRestController {
	
	private static final org.slf4j.Logger LOGGER = LoggerFactory.getLogger(ConsumerMainController.class);
	
	@Autowired
	private ConsumerOrderServiceImpl consumerOrderService;
	
	
	

	
}
