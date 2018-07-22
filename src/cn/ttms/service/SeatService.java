package cn.ttms.service;

import java.util.List;

import cn.ttms.pojo.QueryVo;
import cn.ttms.pojo.Seat;

public interface SeatService {

	public List<Seat> querySeatByStudioId(int id);
	
	public void updateseatById(Seat seat);
	
	public void insertseat(Seat seat);
	
	public Seat detailSeatById(int id);
	
	public void deleteseatByStudioId(int id);
	
	public List<Seat> seatJoinTickBySchedId(int id);
	
	public Seat seatJoinTickByVo(QueryVo vo);
}
