package cn.ttms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.ttms.pojo.Schedule;
import cn.ttms.service.ScheduleService;

@Controller
@RequestMapping("/sellTickets")
public class SellTicketsController {
	
	
	@Autowired
	private ScheduleService scheduleService;
	
	@RequestMapping("/list")
	public String list(Model model) {
		
		List<Schedule> schedList = scheduleService.queryScheduleForSell();
		
		model.addAttribute("schedList", schedList);
		return "sellTickets";
	}
	
}
