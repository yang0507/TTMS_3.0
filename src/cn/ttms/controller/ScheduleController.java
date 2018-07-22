package cn.ttms.controller;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.itcast.utils.Page;
import cn.ttms.controller.converter.CustomGlobalStrToDateConverter;
import cn.ttms.pojo.Play;
import cn.ttms.pojo.QueryVo;
import cn.ttms.pojo.Schedule;
import cn.ttms.pojo.Seat;
import cn.ttms.pojo.Studio;
import cn.ttms.pojo.Ticket;
import cn.ttms.service.PlayService;
import cn.ttms.service.ScheduleService;
import cn.ttms.service.SeatService;
import cn.ttms.service.StudioService;
import cn.ttms.service.TicketService;
import cn.ttms.controller.converter.*;

@Controller
@RequestMapping("/schedule")
public class ScheduleController {
	
	@Autowired
	private ScheduleService scheduleService;
	@Autowired
	private StudioService studioService;
	@Autowired
	private PlayService playService;
	@Autowired
	private TicketService ticketService;
	@Autowired
	private SeatService seatService;
	@RequestMapping("/list")
	public String list(Model model,QueryVo vo) {
		
		if(vo.getPage() == null) {
			vo.setPage(1);
		}
		//设置查询的起始记录条数
		vo.setStart((vo.getPage() - 1)* vo.getSize());
		
		//下拉列表要显示的数据
		List<Studio> studioList = studioService.querystudioByFlag();
		List<Play> playList = playService.queryPlayByStatus();
		
		//计划集合

		List<Schedule> scheduleList = scheduleService.queryscheduleByVo(vo);
		Integer count = scheduleService.queryscheduleByVoCount(vo);
		
		Page<Schedule> page = new Page<Schedule>();
		page.setTotal(count);	//数据总数
		page.setSize(vo.getSize());		//每页显示条数
		page.setPage(vo.getPage());		//当前页数
		page.setRows(scheduleList);		//当前查询出来的集合
		model.addAttribute("P_name",vo.getP_name());
		model.addAttribute("St_name", vo.getSt_name());
		model.addAttribute("page", page);
		model.addAttribute("St_list", studioList);
		model.addAttribute("P_List", playList);
		
		return "schedule";
	}
	
	@RequestMapping("/detail")
	@ResponseBody
	public Schedule detail(int id) throws Exception{
		Schedule schedule = scheduleService.queruscheduleById(id);
/*		String schedTime = schedule.getSched_time().toString();
		schedule.setSched_time(converter.convert(schedTime));*/
		return schedule;
	}
	
	@RequestMapping("/update")
	public String update(Schedule schedule) throws Exception{
		scheduleService.updatescheduleById(schedule);
		return "schedule";
	}
	
	@RequestMapping("/delete")
	public String delete(int id) throws Exception {
		scheduleService.deletescheduleById(id);
		return "schedule";
	}
	
	@RequestMapping("/insert")
	public String insert(Schedule schedule) throws Exception{
		scheduleService.insertschedule(schedule);
		return "schedule";
	}
	
	@RequestMapping("upticket")
	public String upticket(int id,Ticket ticket) throws Exception {
		Schedule schedule = scheduleService.queruscheduleById(id);
		int sched_id = schedule.getSched_id();
		int studio_id = schedule.getStudio_id();
		List<Seat> seatList = seatService.querySeatByStudioId(studio_id);
		double price = schedule.getSched_ticket_price();
		
		for(int i=0;i<seatList.size();i++) {
			if(seatList.get(i).getSeat_status()==1) {
				ticket.setSeat_id(seatList.get(i).getSeat_id());
				ticket.setSched_id(sched_id);
				ticket.setTicket_price(price);
				ticket.setTicket_status(0);
				ticketService.insertTicket(ticket);
			}else {
				ticket.setSeat_id(seatList.get(i).getSeat_id());
				ticket.setSched_id(sched_id);
				ticket.setTicket_price(price);
				ticket.setTicket_status(-1);//座位损坏或无座
				ticketService.insertTicket(ticket);
//				continue;
			}
		}
		scheduleService.updatestatusSchedule(sched_id);
		
		return "schedule";
	}
	
	
}
