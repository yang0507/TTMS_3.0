package cn.ttms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.itcast.utils.Page;
import cn.ttms.dao.DataDictMapper;
import cn.ttms.pojo.DataDict;
import cn.ttms.pojo.QueryVo;

@Controller
@RequestMapping("/dataDict")
public class DataDictController {
	
	@Autowired
	private DataDictMapper dataDictMapper;
	@Value("${dict.parent}")
	private String dict_parent;
	
	
	@RequestMapping("/list")
	public String list(Model model,QueryVo vo) {
		List<DataDict> parentList = dataDictMapper.queryDictByCode(dict_parent);

		if(vo.getDataDictName()!=null) {
			model.addAttribute("dataDictName", vo.getDataDictName());
		}
		
		if(vo.getPage() == null) {
			vo.setPage(1);
		}
		
		vo.setStart((vo.getPage() - 1)* vo.getSize());
		
		List<DataDict> resultList = dataDictMapper.queryDictAll(vo);
		Integer count = dataDictMapper.queryDictAllCount(vo);
		
		Page<DataDict> page = new Page<DataDict>();
		page.setTotal(count);	//数据总数
		page.setSize(vo.getSize());		//每页显示条数
		page.setPage(vo.getPage());		//当前页数
		page.setRows(resultList);
		
		//父节点的集合放入model
		model.addAttribute("parentList", parentList);
		model.addAttribute("page",page);
		//当前字典中的信息放入model 包含影片类型以及影片语种
		
		//参数回显
		model.addAttribute("dataDictName", vo.getDataDictName());
		model.addAttribute("dataDictParentId", vo.getDataDictParentId());
		return "dataDict";
	}
	
	@RequestMapping("/detail")
	@ResponseBody
	public DataDict datail(int id) {
		DataDict dataDict = dataDictMapper.detaildictById(id);
		return dataDict;
	}
	
	@RequestMapping("/update")
	public String update(DataDict dataDict) {
		dataDictMapper.updatedict(dataDict);
		return "dataDict";
	}
	
	@RequestMapping("/delete")
	public String delete(int id) {
		dataDictMapper.deletedictById(id);
		return "dataDict";
	}
	
	@RequestMapping("insert")
	public String insert(DataDict dataDict){
		dataDictMapper.insertdict(dataDict);
		return "dataDict";
	}
}
