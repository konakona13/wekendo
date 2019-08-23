package Service.YYYService;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import Command.YYYCommand.PlaceRegCommand;
import Model.DTO.YYYDTO.Company;
import Model.DTO.YYYDTO.PlaceGoods;
import Repository.YYYRepository.GoodsRepository;

@Service
public class GoodsDetailService {
	@Autowired
	private  GoodsRepository goodsRepository;

	public String goodsDetail(PlaceRegCommand command, Model model, HttpSession session) {
		
		PlaceGoods goods = goodsRepository.getGoodsDetail(command);
		String companyNum = (String) session.getAttribute("companyNum");
		Company company = goodsRepository.getCompanyDetail(companyNum);
			
		String path = "";
		
		//디버깅코드
		
		System.out.println("상세보기 상품명= " + command.getGoodsName());
		System.out.println("상세보기 회사명= " + companyNum);
		
		if(goods == null) {
			path = "redirect:goodsMain";
		}else {
			model.addAttribute("goods", goods);
			model.addAttribute("company", company);
			path = "YYYView/goodsRegDetail";
		}
		return path;
	}




}
