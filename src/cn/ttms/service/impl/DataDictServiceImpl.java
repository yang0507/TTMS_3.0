package cn.ttms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.ttms.dao.DataDictMapper;
import cn.ttms.pojo.DataDict;
import cn.ttms.pojo.QueryVo;
import cn.ttms.service.DataDictService;


@Service
public class DataDictServiceImpl implements DataDictService {

	
	@Autowired
	private DataDictMapper dataDictMapper;
	
	@Override
	public List<DataDict> queryDictByCode(String code) {
		List<DataDict> list = dataDictMapper.queryDictByCode(code);
		return list;
	}

	@Override
	public List<DataDict> queryDictAll(QueryVo vo) {
		List<DataDict> list = dataDictMapper.queryDictAll(vo);
		return list;
	}

	@Override
	public DataDict detaildictById(int id) {
		DataDict dataDict = dataDictMapper.detaildictById(id);
		return dataDict;
	}

	@Override
	public void deletedictById(int id) {
		dataDictMapper.deletedictById(id);
	}

	@Override
	public void insertdict(DataDict dataDict) {
		dataDictMapper.insertdict(dataDict);
	}

	@Override
	public void updatedict(DataDict dataDict) {
		dataDictMapper.updatedict(dataDict);
	}

	@Override
	public Integer queryDictAllCount(QueryVo vo) {
		Integer count = dataDictMapper.queryDictAllCount(vo);
		return count;
	}

}
