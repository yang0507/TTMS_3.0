package cn.ttms.dao;

import java.util.List;

import cn.ttms.pojo.QueryVo;
import cn.ttms.pojo.Studio;

public interface StudioMapper {
	List<Studio> querystudioByVo(QueryVo vo);
	Integer querystudioByVoCount(QueryVo vo);
	
	Studio querustudioById(int id);
	
	void updatestudioById(Studio studio);
	
	void deletestudioById(int id);
	
	void insertstudio(Studio studio);
	
	List<Studio> querystudioByFlag();
}
