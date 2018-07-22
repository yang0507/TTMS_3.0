package cn.ttms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.ttms.dao.Sale_itemMapper;
import cn.ttms.pojo.QueryVo;
import cn.ttms.pojo.Sale;
import cn.ttms.pojo.Sale_item;
import cn.ttms.service.Sale_itemService;

@Service
public class Sale_itemImpl implements Sale_itemService {

	@Autowired
	private Sale_itemMapper sale_itemMapper;
	
	@Override
	public List<Sale_item> selectSaleByVo(QueryVo vo) {
		List<Sale_item> list = sale_itemMapper.selectSaleByVo(vo);
		return list;
	}

	@Override
	public Integer selectSaleByVoCount(QueryVo vo) {
		Integer count = sale_itemMapper.selectSaleByVoCount(vo);
		return count;
	}

	@Override
	public void insertSale(Sale sale) {
		sale_itemMapper.insertSale(sale);
	}

	@Override
	public void insertSale_item(Sale_item sale_item) {
		sale_itemMapper.insertSale_item(sale_item);
	}

	@Override
	public Integer selectmaxSaleId() {
		Integer max = sale_itemMapper.selectmaxSaleId();
		return max;
	}

}
