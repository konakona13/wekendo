package Service.HHHService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import Model.DTO.HHHDTO.PlaceGoods;
import Repository.HHHRepository.DoCreateReporsitory;

@Service
public class DoCreateService
{
	@Autowired
	DoCreateReporsitory doCreateReporsitory;

	public String getGoodsList(Model model)
	{
		
		List<PlaceGoods> goodsList = doCreateReporsitory.getGoodsList();
		model.addAttribute("list",goodsList);
		System.out.println("장소상품 갯수"+goodsList.size());
		return "HHHview/doCreatePlace";
	}

	public String getGoodsDetail(Model model,String num)
	{
		PlaceGoods goods =  doCreateReporsitory.getOneGoods(num);
		model.addAttribute("goods",goods);
		return "HHHview/doGoodsDetail";
	}

}
