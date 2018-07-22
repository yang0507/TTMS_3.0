package cn.ttms.dao;

import java.util.List;

import cn.ttms.pojo.QueryVo;
import cn.ttms.pojo.Ticket;

public interface TicketMapper {
	
	List<Ticket> queryTicketBySchedId(int id);
	
	Ticket detailTicketById(int id);
	
	void updateTicketById(Ticket ticket);
	
	void updateticketlockedtime(Ticket ticket);
	
	void deleteTicketBySchedid(int id);
	
	void insertTicket(Ticket ticket);
	
	List<Ticket> queryTicketAllBySchedId(int id);
	
	Integer queryTicketIdByVo(QueryVo vo);
	
	Integer queryTicketStatus(int id);
	
	Ticket queryTicketAllByTicketId(int ticket_id);
}
