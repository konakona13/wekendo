package Service.YYYService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import Command.YYYCommand.PlaceRegCommand;
import Model.DTO.YYYDTO.GoodsImg;
import Model.DTO.YYYDTO.PlaceGoods;
import Repository.YYYRepository.GoodsRepository;

@Service
public class PlaceRegService {
	
	@Autowired
	private PlaceRegCommand command;
	@Autowired
	private PlaceGoods dto;	
	@Autowired
	private GoodsImg img;
	@Autowired
	GoodsRepository repository;

	public void setPlace(PlaceGoods dto) {
		this.dto= dto;
	}
	

	public void setImg(GoodsImg img) {
		this.img = img;
	}



	public String goodsRegist(Model model, PlaceRegCommand command ) {
		dto.setGoodsName(command.getGoodsName()); //상품명
		dto.setGoodsDetail(command.getGoodsDetail()); //상품상세
		dto.setGoodsDanger(command.getGoodsDanger()); //주의사항
		dto.setGoodsStock(command.getGoodsStock()); //재고수량
		dto.setGoodsPrice(command.getGoodsPrice()); //상품금액
		
		System.out.println(dto.getGoodsName());
		//지역및 테마 분류
		dto.setMapLNum(command.getMapLNum()); 
		dto.setMapMNum(command.getMapMNum());
		dto.setMapSNum(command.getMapSNum());
		dto.setThemeLNum(command.getThemeLNum());
		dto.setThemeMNum(command.getThemeMNum());
		dto.setThemeSNum(command.getThemeSNum());
		
		//이미지
		//img.setGoodsImgName(command.getGoodsImgName()); //이미지 테이블 저장

		repository.insertGoods(dto);
		//repository.insertImg(img);
		
		return "YYYView/goodsMain";
		
	}
}
