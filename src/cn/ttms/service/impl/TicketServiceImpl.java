package cn.ttms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.ttms.dao.TicketMapper;
import cn.ttms.pojo.QueryVo;
import cn.ttms.pojo.Ticket;
import cn.ttms.service.TicketService;
@Service
public class TicketServiceImpl implements TicketService {

	@Autowired
	private TicketMapper ticketMapper;
	@Override
	public List<Ticket> queryTicketBySchedId(int id) {
		List<Ticket> list = ticketMapper.queryTicketBySchedId(id);
		return list;
	}

	@Override
	public Ticket detailTicketById(int id) {
		Ticket ticket = ticketMapper.detailTicketById(id);
		return ticket;
	}

	@Override
	public void updateTicketById(Ticket ticket) {
		ticketMapper.updateTicketById(ticket);
	}

	@Override
	public void updateticketlockedtime(Ticket ticket) {
		ticketMapper.updateticketlockedtime(ticket);
	}

	@Override
	public void deleteTicketBySchedid(int id) {
		ticketMapper.deleteTicketBySchedid(id);
	}

	@Override
	public void insertTicket(Ticket ticket) {
		ticketMapper.insertTicket(ticket);
	}

	@Override
	public List<Ticket> queryTicketAllBySchedId(int id) {
		List<Ticket> list = ticketMapper.queryTicketAllBySchedId(id);
		return list;
	}

	@Override
	public Integer queryTicketIdByVo(QueryVo vo) {
		Integer ticketid = ticketMapper.queryTicketIdByVo(vo);
		return ticketid;
	}

	@Override
	public Integer queryTicketStatus(int id) {
		Integer status = ticketMapper.queryTicketStatus(id);
		return status;
	}

	@Override
	public Ticket queryTicketAllByTicketId(int ticket_id) {
		Ticket ticket = ticketMapper.queryTicketAllByTicketId(ticket_id);
		return ticket;
	}

}
