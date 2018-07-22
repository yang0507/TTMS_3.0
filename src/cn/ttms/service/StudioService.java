package cn.ttms.service;

import java.util.List;

import cn.ttms.pojo.QueryVo;
import cn.ttms.pojo.Studio;

public interface StudioService {
	public List<Studio> querystudioByVo(QueryVo vo);
	public Integer querystudioByVoCount(QueryVo vo);
	
	public Studio querustudioById(int id);
	
	public void updatestudioById(Studio studio);
	
	public void deletestudioById(int id);
	
	public void insertstudio(Studio studio);
	
	public List<Studio> querystudioByFlag();
}
