package Service.YYYService;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import Command.YYYCommand.AuthInfoCommand;
import Command.YYYCommand.PlaceRegCommand;
import Model.DTO.YYYDTO.GoodsImg;
import Model.DTO.YYYDTO.PlaceGoods;
import Repository.YYYRepository.GoodsRepository;

@Service
public class PlaceRegService {
	
	@Autowired
	private PlaceGoods placeGoods;	
	@Autowired
	GoodsRepository repository;

	public void setPlace(PlaceGoods placeGoods) {
		this.placeGoods= placeGoods;
	}
	


	public String goodsRegist(Model model, PlaceRegCommand command, HttpSession session ) {
		
		String companyNum = (String) session.getAttribute("comNum");
		System.out.println(companyNum);

		placeGoods.setCompanyNum(companyNum); //기업회원번호
		placeGoods.setGoodsName(command.getGoodsName()); //상품명
		placeGoods.setGoodsDetail(command.getGoodsDetail()); //상품상세
		placeGoods.setGoodsDanger(command.getGoodsDanger()); //주의사항
		placeGoods.setGoodsStock(command.getGoodsStock()); //재고수량
		placeGoods.setGoodsPrice(command.getGoodsPrice()); //상품금액
		placeGoods.setGoodsStatus("미승인");

		
		System.out.println("입력 상품명: " + placeGoods.getGoodsName());
		
		
		//지역및 테마 분류
		placeGoods.setMapLNum(command.getMapLNum()); 
		placeGoods.setMapMNum(command.getMapMNum());
		placeGoods.setMapSNum(command.getMapSNum());
		placeGoods.setThemeLNum(command.getThemeLNum());
		placeGoods.setThemeMNum(command.getThemeMNum());
		placeGoods.setThemeSNum(command.getThemeSNum());
		
		System.out.println("상품등록서비스_지역소분류번호 : " + placeGoods.getMapSNum());
		System.out.println("상품등록서비스_테마소분류번호: " + placeGoods.getThemeSNum());

		repository.insertGoods(placeGoods);
		
		return "YYYView/goodsMain";
		
	}
}