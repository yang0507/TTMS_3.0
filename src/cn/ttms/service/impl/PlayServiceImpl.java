package cn.ttms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.ttms.dao.DataDictMapper;
import cn.ttms.dao.PlayMapper;
import cn.ttms.pojo.DataDict;
import cn.ttms.pojo.Play;
import cn.ttms.pojo.QueryVo;
import cn.ttms.service.PlayService;

@Service
public class PlayServiceImpl implements PlayService {
	
	@Autowired
	private DataDictMapper dataDictMapper;
	@Autowired
	private PlayMapper playMapper;
	@Override
	public List<DataDict> queryDictByCode(String code) {
		List<DataDict> list = dataDictMapper.queryDictByCode(code);
		return list;
	}

	@Override
	public List<Play> queryPlayByVo(QueryVo vo) {
		List<Play> list = playMapper.queryPlayByVo(vo);
		return list;
	}

	@Override
	public Integer queryPlayByVoCount(QueryVo vo) {
		Integer count = playMapper.queryPlayByVoCount(vo);
		return count;
	}

	@Override
	public void insertPlay(Play play) {
		playMapper.insertPlay(play);
	}

	@Override
	public void deletePlayById(int id) {
		playMapper.deletePlayById(id);
	}

	@Override
	public Play queryPlayById(int id) {
		Play play = playMapper.queryPlayById(id);
		return play;
	}

	@Override
	public void updatePlayById(Play play) {
		playMapper.updatePlayById(play);
	}

	@Override
	public void updatePlayImgById(Play play) {
		playMapper.updatePlayImgById(play);
	}

	@Override
	public void statusPlayById(int id) {
		playMapper.statusPlayById(id);
	}

	@Override
	public void outstatusPlayById(int id) {
		playMapper.outstatusPlayById(id);
	}

	@Override
	public List<Play> queryPlayByStatus() {
		List<Play> list = playMapper.queryPlayByStatus();
		return list;
	}


	
	
}
