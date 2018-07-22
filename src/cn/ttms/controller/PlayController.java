package cn.ttms.controller;


import java.io.File;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import cn.itcast.utils.Page;
import cn.ttms.pojo.DataDict;
import cn.ttms.pojo.Play;
import cn.ttms.pojo.QueryVo;
import cn.ttms.service.PlayService;

@Controller
@RequestMapping("/play")
public class PlayController {
	
	
	@Autowired
	private PlayService playService;
	@Value("${play.dict.type}")
	private String ptype;
	@Value("${play.dict.long}")
	private String plong;
	
	
	@RequestMapping("/list")
	public String list(Model model,QueryVo vo) throws Exception{
		//剧目类别
		List<DataDict> typeList = playService.queryDictByCode(ptype);
		//剧目语种
		List<DataDict> longList = playService.queryDictByCode(plong);
		if(vo.getPlayName()!=null) {
			model.addAttribute("playName", vo.getPlayName());
		}
		if(vo.getPage() == null) {
			vo.setPage(1);
		}
		vo.setStart((vo.getPage() - 1)* vo.getSize());
		
		List<Play> resultList = playService.queryPlayByVo(vo);
		Integer count = playService.queryPlayByVoCount(vo);
		Page<Play> page = new Page<Play>();
		page.setTotal(count);	//数据总数
		page.setSize(vo.getSize());		//每页显示条数
		page.setPage(vo.getPage());		//当前页数
		page.setRows(resultList);		//当前查询出来的集合
		
		model.addAttribute("page", page);
		//加载下拉框
		model.addAttribute("playTypeList", typeList);
		model.addAttribute("playLongList", longList);
		//参数回显
		model.addAttribute("playType", vo.getPlayType());
		model.addAttribute("playLong", vo.getPlayLong());
		model.addAttribute("playName", vo.getPlayName());
		
		return "play";
	}
	
	@RequestMapping("/insert")
	public String insert(Play play) {
		playService.insertPlay(play);
		return "play";
	}
	
	@RequestMapping("/delete")
	public String delete(int id) {
		playService.deletePlayById(id);
		return "play";
	}
	
	@RequestMapping("/detail")
	@ResponseBody
	public Play detail(int id) {
		Play play = playService.queryPlayById(id);
		return play;
	}
	
	@RequestMapping("/update")
	public String update(Play play) {
		playService.updatePlayById(play);
		return "play";
	}
	
	@RequestMapping("/upload")
	public String upload(Play play,MultipartFile pictureFile) throws Exception {
		// 图片上传
		// 设置图片名称，不能重复，可以使用uuid
		String picName = UUID.randomUUID().toString();
		String picNameRep=picName.substring(0,8);
		// 获取文件名
		String oriName = pictureFile.getOriginalFilename();
		// 获取图片后缀
		String extName = oriName.substring(oriName.lastIndexOf("."));

		// 开始上传
		pictureFile.transferTo(new File("D:\\JAVA WEB\\workspace\\TTMS_3.0\\WebContent\\tu\\" + picNameRep + extName));
		// 设置图片名
		play.setPlay_image("tu/"+picNameRep + extName);
		playService.updatePlayImgById(play);
		return "forward:/play/list.action";
	}
	
	@RequestMapping("/status")
	public String status(int id) {
		playService.statusPlayById(id);
		return "play";
	}
	
	@RequestMapping("/outstatu")
	public String outstatus(int id) {
		playService.outstatusPlayById(id);
		return "play";
	}
}
