package cn.ttms.dao;

import java.util.List;

import cn.ttms.pojo.QueryVo;
import cn.ttms.pojo.Seat;

public interface SeatMapper {
	
	List<Seat> querySeatByStudioId(int id);
	
	void updateseatById(Seat seat);
	
	void insertseat(Seat seat);
	
	Seat detailSeatById(int id);
	
	void deleteseatByStudioId(int id);
	List<Seat> seatJoinTickBySchedId(int id);
	Seat seatJoinTickByVo(QueryVo vo);
}
