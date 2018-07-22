package cn.ttms.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.itcast.utils.Page;
import cn.ttms.pojo.QueryVo;
import cn.ttms.pojo.Seat;
import cn.ttms.pojo.Studio;
import cn.ttms.service.SeatService;
import cn.ttms.service.StudioService;

@Controller
@RequestMapping("/studio")
public class StudioController {
	
	
	@Autowired
	private StudioService studioService;
	@Autowired 
	private SeatService seatService;
	
	@RequestMapping("/list")
	public String list(Model model,QueryVo vo) throws Exception{
		
		
		if(vo.getPage() == null) {
			vo.setPage(1);
		}
		//设置查询的起始记录条数
		vo.setStart((vo.getPage() - 1)* vo.getSize());
		List<Studio> studioList = studioService.querystudioByVo(vo);
		Integer count = studioService.querystudioByVoCount(vo);
		
		Page<Studio> page = new Page<Studio>();
		page.setTotal(count);	//数据总数
		page.setSize(vo.getSize());		//每页显示条数
		page.setPage(vo.getPage());		//当前页数
		page.setRows(studioList);		//当前查询出来的集合
		model.addAttribute("studioName",vo.getStudioName());
		model.addAttribute("page", page);
		
		return "studio";
	}
	
	@RequestMapping("/detail")
	@ResponseBody
	public Studio detail(int id) throws Exception{
		Studio studio = studioService.querustudioById(id);
		return studio;
	}
	
	@RequestMapping("/update")
	public String update(Studio studio) throws Exception{
		if(studio.getStudio_flag()==-2) {
			studioService.updatestudioById(studio);
			seatService.deleteseatByStudioId(studio.getStudio_id());
		}
		else if(studio.getStudio_flag()==-1) {
			studioService.updatestudioById(studio);
		}
		else if(studio.getStudio_flag()== 1) {
			studioService.updatestudioById(studio);
		}
		else if(studio.getStudio_flag()== 0) {
			studioService.updatestudioById(studio);
			seatService.deleteseatByStudioId(studio.getStudio_id());
		}
//		studio.setStudio_flag(0);
//		studioService.updatestudioById(studio);
//		System.out.println(studio.getStudio_flag());
//		seatService.deleteseatByStudioId(studio.getStudio_id());
		return "studio";
	}
	
	@RequestMapping("/delete")
	public String delete(int id) throws Exception {
		studioService.deletestudioById(id);
		seatService.deleteseatByStudioId(id);
		return "studio";
	}
	
	@RequestMapping("/insert")
	public String insert(Studio studio) throws Exception{
		studioService.insertstudio(studio);
		return "studio";
	}
	
	@RequestMapping("/upseat")
	public String upseat(int id,int row,int col,Seat seat) throws Exception{
		
		for(int i=1;i<=row;i++) {
			for(int j=1;j<=col;j++) {
				seat.setStudio_id(id);
				seat.setSeat_row(i);
				seat.setSeat_column(j);
				seat.setSeat_status(1);
				seatService.insertseat(seat);
			}
		}
		Studio studio = studioService.querustudioById(id);
		studio.setStudio_flag(1);
		studioService.updatestudioById(studio);
		return "studio";
	}
	
}
