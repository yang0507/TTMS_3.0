package cn.ttms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.ttms.dao.StudioMapper;
import cn.ttms.pojo.QueryVo;
import cn.ttms.pojo.Studio;
import cn.ttms.service.StudioService;


@Service
public class StudioServiceImpl implements StudioService {

	@Autowired
	private StudioMapper studioMapper;
	
	@Override
	public List<Studio> querystudioByVo(QueryVo vo) {
		List<Studio> list = studioMapper.querystudioByVo(vo);
		return list;
	}

	@Override
	public Integer querystudioByVoCount(QueryVo vo) {
		Integer count = studioMapper.querystudioByVoCount(vo);
		return count;
	}

	@Override
	public Studio querustudioById(int id) {
		Studio studio = studioMapper.querustudioById(id);
		return studio;
	}

	@Override
	public void updatestudioById(Studio studio) {
		studioMapper.updatestudioById(studio);
	}

	@Override
	public void deletestudioById(int id) {
		studioMapper.deletestudioById(id);
	}

	@Override
	public void insertstudio(Studio studio) {
		studioMapper.insertstudio(studio);
	}

	@Override
	public List<Studio> querystudioByFlag() {
		List<Studio> list = studioMapper.querystudioByFlag();
		return list;
	}

}
