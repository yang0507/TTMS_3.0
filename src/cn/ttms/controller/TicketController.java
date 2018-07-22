package cn.ttms.controller;



import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.ttms.controller.converter.CustomGlobalStrToDateConverter;
import cn.ttms.pojo.QueryVo;
import cn.ttms.pojo.Sale;
import cn.ttms.pojo.Sale_item;
import cn.ttms.pojo.Schedule;
import cn.ttms.pojo.Seat;
import cn.ttms.pojo.Ticket;
import cn.ttms.pojo.User;
import cn.ttms.service.Sale_itemService;
import cn.ttms.service.ScheduleService;
import cn.ttms.service.SeatService;
import cn.ttms.service.TicketService;
import cn.ttms.utils.TicketIoUtil;

@Controller
@RequestMapping("/ticket")
public class TicketController {
	
	private static  Map<Integer,Timestamp> tickets;
	static {
		tickets = new HashMap<Integer,Timestamp>();
	}
	@Autowired
	private SeatService seatService;
	@Autowired
	private ScheduleService scheduleService;
	@Autowired
	private TicketService ticketService;
	@Autowired
	private Sale_itemService sale_itemService;
	
	@RequestMapping("/list")
	public String list(int id ,Model model,QueryVo vo) {
		
//		List<Ticket> ticketList = ticketService.queryTicketAllBySchedId(id);
//		Schedule sched = scheduleService.queruscheduleById(id);
//		int studio_id = sched.getStudio_id();
//		Studio studio = studioService.querustudioById(studio_id);
//		model.addAttribute("ticketList", ticketList);
//		model.addAttribute("studio_row", studio.getStudio_row_count());
//		model.addAttribute("studio_col", studio.getStudio_col_count());
		
		List<Seat> seatList = seatService.seatJoinTickBySchedId(id);
		Schedule schedule = scheduleService.queryscheduleAllById(id);
		vo.setSchedid(schedule.getSched_id());
		StringBuffer seatBuffer = new StringBuffer("");
		for(int i =1;i<=schedule.getStudio().getStudio_row_count();i++) {
			seatBuffer.append("'");
			for(int j=1;j<=schedule.getStudio().getStudio_col_count();j++) {
				vo.setSeat_row(i);
				vo.setSeat_col(j);
				Seat seat = seatService.seatJoinTickByVo(vo);
				if(seat!=null) {
					if(seat.getTicket().getTicket_status()==0) {
						seatBuffer.append("a");
					}
					else {
						seatBuffer.append("_");
					}
				}
				else {
					seatBuffer.append("_");
				}
			}
			seatBuffer.append("',");
		}
//		System.out.println(seatBuffer);
		model.addAttribute("initseat", seatBuffer);
		model.addAttribute("seatList", seatList);
		model.addAttribute("scheduleAll",schedule);
		
		return "ticket";
	}
	
	
	//
	@RequestMapping("/lockTicket")
	public String lockTicket(int id,int row,int col,QueryVo vo,Ticket ticket,CustomGlobalStrToDateConverter converter) {
		System.out.println(id+" "+row+" "+col);
		vo.setSchedid(id);
		vo.setSeat_row(row);
		vo.setSeat_col(col);
		Integer ticketid = ticketService.queryTicketIdByVo(vo);
		ticket.setTicket_id(ticketid);
		Date locktime = converter.convert(converter.nowTime());
		ticket.setTicket_locked_time(new Timestamp(locktime.getTime()));
		ticket.setTicket_status(1);
		ticketService.updateticketlockedtime(ticket);
		//将锁定时间信息存入集合
		tickets.put(ticketid,new Timestamp(locktime.getTime()));
		return "ticket";
	}
	
	@RequestMapping("/lockCancel")
	public String lockCancel(int id,int row,int col,QueryVo vo,Ticket ticket) {
		System.out.println(id+" "+row+" "+col);
		vo.setSchedid(id);
		vo.setSeat_row(row);
		vo.setSeat_col(col);
		Integer ticketid = ticketService.queryTicketIdByVo(vo);
		ticket.setTicket_id(ticketid);
		ticket.setTicket_status(0);
		ticket.setTicket_locked_time(null);
		ticketService.updateticketlockedtime(ticket);
		//将取消票的信息从map集合中删除
		tickets.remove(ticketid);
		return "ticket";
	} 
	
	@RequestMapping("/lockCheck")
	public String lockCheck(int id,Ticket ticket) {
		for(Map.Entry<Integer,Timestamp> entry : tickets.entrySet()) {
//			System.out.println(entry.getKey()+" "+entry.getValue());
			if(ticketService.queryTicketStatus(entry.getKey())==1) {
				ticket.setTicket_id(entry.getKey());
				ticket.setTicket_status(0);
				ticket.setTicket_locked_time(null);
				ticketService.updateticketlockedtime(ticket);
			}
		}
		return "ticket";
	}
	
	@RequestMapping("/sell")
	public String sell(HttpServletRequest request,QueryVo vo,Ticket ticket,Sale sale,Sale_item sale_item) {
		int	 sched_id=Integer.parseInt(request.getParameter("sched_id"));
		vo.setSchedid(sched_id);
		double sched_price =scheduleService.queruscheduleById(sched_id).getSched_ticket_price();
		String[] values = request.getParameterValues("xx");
		
		//添加订单信息
		sale.setEmp_id(((User) request.getSession().getAttribute("loginingUser")).getEmployee().getEmp_id());
		sale.setSale_payment(sched_price*values.length);
		sale.setSale_type(1);//销售单
		sale.setSale_status(1);//已付款
		sale_itemService.insertSale(sale);
		
		for(String s : values){
			String[] ss= s.split("_");
			int row=Integer.parseInt(ss[0]);
			int col=Integer.parseInt(ss[1]);
//			System.out.println(row +"   "+ col);
			vo.setSeat_row(row);
			vo.setSeat_col(col);
			Integer ticketid = ticketService.queryTicketIdByVo(vo);
//			System.out.println(ticketid);
			if(ticketid!=null) {
				ticket.setTicket_id(ticketid);
				ticket.setTicket_status(9);
				ticketService.updateTicketById(ticket);
				
				//添加购票单信息
				sale_item.setTicket_id(ticketid);
				sale_item.setSale_ID(sale_itemService.selectmaxSaleId());
				sale_item.setSale_item_price(sched_price);
				sale_itemService.insertSale_item(sale_item);
				
				//打印信息到txt文件
				TicketIoUtil.send(row, col, ticketid,scheduleService.queryscheduleAllById(sched_id) , 
						((User) request.getSession().getAttribute("loginingUser")).getEmployee().getEmp_no());
//				System.out.println("修改成功");
			}
		}
		String url = "redirect: list.action?id="+sched_id;
		return url;
	}
	
	
}
