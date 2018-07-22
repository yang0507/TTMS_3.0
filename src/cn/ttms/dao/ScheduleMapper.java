package cn.ttms.dao;

import java.util.List;

import cn.ttms.pojo.QueryVo;
import cn.ttms.pojo.Schedule;

public interface ScheduleMapper {
	
	List<Schedule> queryscheduleByVo(QueryVo vo);
	Integer queryscheduleByVoCount(QueryVo vo);
	Schedule queruscheduleById(int id);
	void updatescheduleById(Schedule schedule);
	void deletescheduleById(int id);
	void insertschedule(Schedule schedule);
	List<Schedule> queryScheduleForSell();
	Schedule queryscheduleAllById(int id);
	void updatestatusSchedule(int id);
}
