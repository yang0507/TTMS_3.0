package cn.ttms.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.itcast.utils.Page;
import cn.ttms.pojo.QueryVo;
import cn.ttms.pojo.Sale;
import cn.ttms.pojo.Sale_item;
import cn.ttms.pojo.Ticket;
import cn.ttms.pojo.User;
import cn.ttms.service.Sale_itemService;
import cn.ttms.service.TicketService;

@Controller
@RequestMapping("/sale_item")
public class Sale_itemController {
	
	@Autowired
	private Sale_itemService sale_itemService;
	
	@Autowired
	private TicketService ticketSerice;
	
	@RequestMapping("/list")
	public String list (Model model,QueryVo vo) {
		
		
		
		if(vo.getPage() == null) {
			vo.setPage(1);
		}
		
		vo.setStart((vo.getPage() - 1)* vo.getSize());
		List<Sale_item> itemList = sale_itemService.selectSaleByVo(vo);
		Integer count = sale_itemService.selectSaleByVoCount(vo);
		Page<Sale_item> page = new Page<Sale_item>();
		page.setTotal(count);
		page.setSize(vo.getSize());
		page.setPage(vo.getPage());
		page.setRows(itemList);
		
		model.addAttribute("page", page);
		
		//参数回显
		model.addAttribute("sale_ticket_id",vo.getSale_ticket_id() );
		model.addAttribute("sale_emp_no", vo.getSale_emp_no());
		model.addAttribute("sale_emp_name", vo.getSale_emp_name());
		model.addAttribute("sale_type", vo.getSale_type());
		model.addAttribute("sale_time", vo.getSale_time());
		return "sale_item";
	}
	
	@RequestMapping("/detail")
	@ResponseBody
	public Ticket detail(int ticket_id) {
		Ticket ticket = ticketSerice.queryTicketAllByTicketId(ticket_id);
		return ticket;
	}
	
	@RequestMapping("/backticket")
	public String backticket(Ticket ticket,Sale sale,Sale_item sale_item,HttpServletRequest request) {
		ticket.setTicket_status(0);
		ticketSerice.updateTicketById(ticket);
		
		//添加订单信息
		sale.setEmp_id(((User) request.getSession().getAttribute("loginingUser")).getEmployee().getEmp_id());
		sale.setSale_payment(ticket.getTicket_price());
		sale.setSale_type(-1);//退款单
		sale.setSale_status(1);//已付款
		sale_itemService.insertSale(sale);
		
		//添加退款单信息
		sale_item.setTicket_id(ticket.getTicket_id());
		sale_item.setSale_ID(sale_itemService.selectmaxSaleId());
		sale_item.setSale_item_price(ticket.getTicket_price());
		sale_itemService.insertSale_item(sale_item);
		
		
		return "sale_item";
	}
}
