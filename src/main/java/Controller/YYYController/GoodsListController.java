package Controller.YYYController;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import Model.DTO.YYYDTO.GoodsImg;
import Service.YYYService.GoodsDeleteService;
import Service.YYYService.GoodsListMemServcie;
import Service.YYYService.GoodsListService;

@Controller
public class GoodsListController {
	@Autowired
	private GoodsListService listService;
	@Autowired
	private GoodsListMemServcie listMemService;
	@Autowired
	private GoodsDeleteService deleteService;
	
	//목록(메인)
	
	//기업회원 전용 페이지
	@RequestMapping("/goodsMain/company")
	public String goodsList(Model model, HttpSession session) { 

		String path= listService.goodsList(model, session);
		return path;
	}
	
	//일반회원 페이지
	@RequestMapping("/goodsMain/member")
	public String goodsMember(Model model, HttpSession session) { 

		String path= listMemService.goodsMember(model, session);
		return path;
	}
	
	//수정
		

	//삭제
	@RequestMapping("/goodsDelete.goods/{num}")
	public String goodsDelete(@PathVariable("num") String goodsNum, Model model, HttpSession session) {
		String path = deleteService.goodsDelete(goodsNum, model, session);
		return path;
	
	}
}
