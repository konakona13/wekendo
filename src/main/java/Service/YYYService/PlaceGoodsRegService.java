package Service.YYYService;

import java.security.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import Command.YYYCommand.PlaceGoodsRegCommand;
import Model.DTO.YYYDTO.PlaceGoods;

@Service
public class PlaceGoodsRegService {
	
	@Autowired
	private PlaceGoodsRegCommand command;
	@Autowired
	private PlaceGoods place;
	
	private String path;
	private SimpleDateFormat dt = new SimpleDateFormat("yymmdd");
	private Date date;
	private Timestamp tst;
	

	public void setPlace(PlaceGoods place) {
		this.place = place;
	}


	public String goodsRegist(Model model, PlaceGoodsRegCommand command ) {
		

		
		
		return null;
		
	}
}
