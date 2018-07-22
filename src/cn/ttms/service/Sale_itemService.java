package cn.ttms.service;

import java.util.List;

import cn.ttms.pojo.QueryVo;
import cn.ttms.pojo.Sale;
import cn.ttms.pojo.Sale_item;


public interface Sale_itemService {

	//查询订单信息
	List<Sale_item> selectSaleByVo(QueryVo vo);
	Integer selectSaleByVoCount(QueryVo vo);
	
	//添加销售信息
	void insertSale(Sale sale);
	
	//添加订单信息
	void insertSale_item(Sale_item sale_item);
	
	//返回最大id
	Integer selectmaxSaleId();
}
