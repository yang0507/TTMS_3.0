package cn.ttms.service;

import java.util.List;

import cn.ttms.pojo.QueryVo;
import cn.ttms.pojo.Ticket;

public interface TicketService {

	
	public List<Ticket> queryTicketBySchedId(int id);
	
	public Ticket detailTicketById(int id);
	
	public void updateTicketById(Ticket ticket);
	
	public void updateticketlockedtime(Ticket ticket);
	
	public void deleteTicketBySchedid(int id);
	
	public void insertTicket(Ticket ticket);
	
	public List<Ticket> queryTicketAllBySchedId(int id);
	
	public Integer queryTicketIdByVo(QueryVo vo);
	
	public Integer queryTicketStatus(int id);
	
	public Ticket queryTicketAllByTicketId(int ticket_id);
}
