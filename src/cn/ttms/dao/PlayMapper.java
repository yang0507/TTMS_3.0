package cn.ttms.dao;

import java.util.List;

import cn.ttms.pojo.Play;
import cn.ttms.pojo.QueryVo;

public interface PlayMapper {
	
	List<Play> queryPlayByVo(QueryVo vo);
	Integer queryPlayByVoCount(QueryVo vo);
	void insertPlay(Play play);
	void deletePlayById(int id);
	Play queryPlayById(int id);
	void updatePlayById(Play play);
	void updatePlayImgById(Play play);
	void statusPlayById(int id);
	void outstatusPlayById(int id);
	List<Play> queryPlayByStatus();
}
