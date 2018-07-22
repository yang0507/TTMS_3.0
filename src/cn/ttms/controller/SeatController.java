package cn.ttms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.ttms.pojo.Seat;
import cn.ttms.pojo.Studio;
import cn.ttms.service.SeatService;
import cn.ttms.service.StudioService;


@Controller
@RequestMapping("/seat")
public class SeatController {
	
	@Autowired
	private SeatService seatService;
	@Autowired StudioService studioService;
	
	@RequestMapping("/seatList")
	public String seatlist(int id,Model model) throws Exception{
		Studio studio = studioService.querustudioById(id);
		List<Seat> seatList = seatService.querySeatByStudioId(id);
		model.addAttribute("studio", studio);
		model.addAttribute("seatList", seatList);
		return "seat";
	}
	
	@RequestMapping("/list")
	public String list(int id,Model model) throws Exception{
		List<Seat> seatList = seatService.querySeatByStudioId(id);
		model.addAttribute("seatList", seatList);
		return "seat";
	}
	
	@RequestMapping("/update")
	public String update(Seat seat) throws Exception{
		seatService.updateseatById(seat);
		return "seat";
	}
	
	@RequestMapping("/detail")
	@ResponseBody
	public Seat detail(int id) throws Exception{
		Seat seat = seatService.detailSeatById(id);
		return seat;
	}
	
}
