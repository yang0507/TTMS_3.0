package cn.ttms.service;

import java.util.List;

import cn.ttms.pojo.QueryVo;
import cn.ttms.pojo.Schedule;

public interface ScheduleService {
	
	public List<Schedule> queryscheduleByVo(QueryVo vo);
	public Integer queryscheduleByVoCount(QueryVo vo);
	public Schedule queruscheduleById(int id);
	public void updatescheduleById(Schedule schedule);
	public void deletescheduleById(int id);
	public void insertschedule(Schedule schedule);
	public List<Schedule> queryScheduleForSell();
	public Schedule queryscheduleAllById(int id);
	public void updatestatusSchedule(int id);
}
