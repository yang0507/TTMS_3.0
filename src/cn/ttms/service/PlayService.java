package cn.ttms.service;

import java.util.List;

import cn.ttms.pojo.DataDict;
import cn.ttms.pojo.Play;
import cn.ttms.pojo.QueryVo;

public interface PlayService {
	
	public List<DataDict> queryDictByCode(String code);
	public List<Play> queryPlayByVo(QueryVo vo);
	public Integer queryPlayByVoCount(QueryVo vo);
	public void insertPlay(Play play);
	public void deletePlayById(int id);
	public Play queryPlayById(int id);
	public void updatePlayById(Play play);
	public void updatePlayImgById(Play play);
	public void statusPlayById(int id);
	public void outstatusPlayById(int id);
	public List<Play> queryPlayByStatus();
}
