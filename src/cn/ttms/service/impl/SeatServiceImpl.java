package cn.ttms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.ttms.dao.SeatMapper;
import cn.ttms.pojo.QueryVo;
import cn.ttms.pojo.Seat;
import cn.ttms.service.SeatService;

@Service
public class SeatServiceImpl implements SeatService {

	@Autowired
	private SeatMapper seatMapper;
	@Override
	public List<Seat> querySeatByStudioId(int id) {
		List<Seat> list = seatMapper.querySeatByStudioId(id);
		return list;
	}

	@Override
	public void updateseatById(Seat seat) {
		seatMapper.updateseatById(seat);
		
	}

	@Override
	public void insertseat(Seat seat) {
		seatMapper.insertseat(seat);
		
	}

	@Override
	public Seat detailSeatById(int id) {
		Seat seat = seatMapper.detailSeatById(id);
		return seat;
	}

	@Override
	public void deleteseatByStudioId(int id) {
		seatMapper.deleteseatByStudioId(id);
	}

	@Override
	public List<Seat> seatJoinTickBySchedId(int id) {
		List<Seat> list = seatMapper.seatJoinTickBySchedId(id);
		return list;
	}

	@Override
	public Seat seatJoinTickByVo(QueryVo vo) {
		Seat seat = seatMapper.seatJoinTickByVo(vo);
		return seat;
	}

}
