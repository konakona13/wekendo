package Controller.YYYController;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import Command.YYYCommand.PlaceRegCommand;
import Service.YYYService.GoodsDetailService;
import Service.YYYService.PlaceRegService;

@Controller
public class GoodsRegController {
	@Autowired
	private PlaceRegService placeRegService;
	@Autowired
	private GoodsDetailService detailService;

	//상품 등록
	@RequestMapping(value = "/goodsReg", method = {RequestMethod.POST,RequestMethod.GET})
	public String goodsReg(Model model, PlaceRegCommand command, HttpSession session) {
		
		return "YYYView/goodsRegist";
	} 
	
	@RequestMapping(value = "/goodsRegAction", method = RequestMethod.POST)
	public String goodsRegAction(Model model, PlaceRegCommand command, HttpSession session, 
								 MultipartFile[]  report, HttpServletRequest request) throws IllegalStateException, IOException {
		
		//System.out.println("상품등록완료_지역소분류번호 : " + command.getMapSNum());
		//System.out.println("상품등록완료_테마소분류번호: " + command.getThemeSNum());
		System.out.println("뷰에서 받아오는 imgname: " + report.length);
		
		String path = placeRegService.goodsRegist(model, command, session, report, request);	

		return path;
	}
	
	//상세보기
	@RequestMapping("/goodsRegDetail.goods/{num}")
	public String goodsDetail(@PathVariable("num") String goodsNum, Model model, HttpSession session) {
		
		System.out.println("상세보기 - 뷰단에서 받아오는 상품번호: " + goodsNum);
		System.out.println("상세보기 - 뷰단에서 받아오는 회사번호: " + session.getAttribute("comNum"));
		
		String path = detailService.goodsDetail(goodsNum, model, session);
		return path;
	}

	

	

	

	
	
	
	
	}

