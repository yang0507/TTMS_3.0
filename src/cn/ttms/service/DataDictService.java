package cn.ttms.service;

import java.util.List;

import cn.ttms.pojo.DataDict;
import cn.ttms.pojo.QueryVo;

public interface DataDictService {
	public List<DataDict> queryDictByCode(String code);
	
	public List<DataDict> queryDictAll(QueryVo vo);
	
	public DataDict detaildictById(int id);
	
	public void deletedictById(int id);
	
	public void insertdict(DataDict dataDict);
	
	public void updatedict(DataDict dataDict);
	
	public Integer queryDictAllCount(QueryVo vo);
}
