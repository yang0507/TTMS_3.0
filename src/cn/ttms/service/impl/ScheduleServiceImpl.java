package cn.ttms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.ttms.dao.ScheduleMapper;
import cn.ttms.pojo.QueryVo;
import cn.ttms.pojo.Schedule;
import cn.ttms.service.ScheduleService;


@Service
public class ScheduleServiceImpl implements ScheduleService {

	@Autowired
	private ScheduleMapper scheduleMapper;
	
	@Override
	public List<Schedule> queryscheduleByVo(QueryVo vo) {
		List<Schedule> list = scheduleMapper.queryscheduleByVo(vo);
		return list;
	}

	@Override
	public Integer queryscheduleByVoCount(QueryVo vo) {
		Integer count = scheduleMapper.queryscheduleByVoCount(vo);
		return count;
	}

	@Override
	public Schedule queruscheduleById(int id) {
		Schedule schedule = scheduleMapper.queruscheduleById(id);
		return schedule;
	}

	@Override
	public void updatescheduleById(Schedule schedule) {
		scheduleMapper.updatescheduleById(schedule);
	}

	@Override
	public void deletescheduleById(int id) {
		scheduleMapper.deletescheduleById(id);
	}

	@Override
	public void insertschedule(Schedule schedule) {
		scheduleMapper.insertschedule(schedule);
	}

	@Override
	public List<Schedule> queryScheduleForSell() {
		List<Schedule> list = scheduleMapper.queryScheduleForSell();
		return list;
	}

	@Override
	public Schedule queryscheduleAllById(int id) {
		Schedule schedule = scheduleMapper.queryscheduleAllById(id);
		return schedule;
	}

	@Override
	public void updatestatusSchedule(int id) {
		scheduleMapper.updatestatusSchedule(id);
	}

}
