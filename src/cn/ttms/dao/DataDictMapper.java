package cn.ttms.dao;

import java.util.List;

import cn.ttms.pojo.DataDict;
import cn.ttms.pojo.QueryVo;

public interface DataDictMapper {
	
	List<DataDict> queryDictByCode(String code);
	
	List<DataDict> queryDictAll(QueryVo vo);
	
	DataDict detaildictById(int id);
	
	void deletedictById(int id);
	
	void insertdict(DataDict dataDict);
	
	void updatedict(DataDict dataDict);
	
	Integer queryDictAllCount(QueryVo vo);
}
