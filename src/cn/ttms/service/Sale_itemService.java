package cn.ttms.service;

import java.util.List;

import cn.ttms.pojo.QueryVo;
import cn.ttms.pojo.Sale;
import cn.ttms.pojo.Sale_item;


public interface Sale_itemService {

	//��ѯ������Ϣ
	List<Sale_item> selectSaleByVo(QueryVo vo);
	Integer selectSaleByVoCount(QueryVo vo);
	
	//���������Ϣ
	void insertSale(Sale sale);
	
	//��Ӷ�����Ϣ
	void insertSale_item(Sale_item sale_item);
	
	//�������id
	Integer selectmaxSaleId();
}
