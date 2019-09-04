package Service.YYYService;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import Model.DTO.YYYDTO.GoodsImg;
import Model.DTO.YYYDTO.GoodsList;
import Repository.YYYRepository.GoodsRepository;

@Service
public class GoodsListMemServcie {
	@Autowired
	private GoodsRepository goodsRepository;

	public String goodsMember(Model model, HttpSession session) {
		
		List<GoodsList> list = new ArrayList<GoodsList>();
		list = goodsRepository.memGetGoods();
		model.addAttribute("list", list);
		System.out.println("상품목록(멤버) 게시글 수 : " + list.size());

		List<GoodsImg> goodImgs = goodsRepository.getImages();
		model.addAttribute("goodImgs",goodImgs);
		//System.out.println(goodImgs.toString());
		
		for (GoodsImg goodsImg : goodImgs) {
			System.out.println(goodsImg.getGoodsNum());
			System.out.println(goodsImg.getGoodsImgName());
		}
		
		
		return "YYYView/goodsList_member";
	}

}
