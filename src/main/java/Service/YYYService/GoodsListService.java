package Service.YYYService;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import Model.DTO.YYYDTO.Company;
import Model.DTO.YYYDTO.GoodsImg;
import Model.DTO.YYYDTO.GoodsList;
import Model.DTO.YYYDTO.Goods;
import Repository.YYYRepository.GoodsRepository;

@Service
public class GoodsListService {

	@Autowired
	private GoodsRepository goodsRepository;
	@Autowired
	private GoodsList goodsList;

	private String companyNum;

	public String goodsList(Model model, HttpSession session) {

		companyNum = (String) session.getAttribute("comNum"); // 로그인하면 세션에 있는 회사번호를 받아옴

		List<GoodsList> list = new ArrayList<GoodsList>();

		System.out.println("받아오는 Service 회사번호 : " + companyNum);

		if (companyNum.equals("admin")) { // 관리자 로그인 - 전체 상품 조회
			System.out.println("받아오는 Service 회사번호 : " + companyNum);
			list = goodsRepository.getGoodsAll();
		}

		else { // 기업회원 로그인 - 내것만 조회

			list = goodsRepository.getGoodsList(companyNum);
			System.out.println("회사번호 : " + companyNum);
			Company company = goodsRepository.getCompanyDetail(companyNum);
			model.addAttribute("company", company);
			System.out.println("상품리스트-회사가입승인상태: " + company.getCompanyStatus());
			
		}

		model.addAttribute("list", list);
		model.addAttribute("size", list.size());
		
		List<GoodsImg> goodImgs = goodsRepository.getimages();
		model.addAttribute("goodImgs",goodImgs);
		//System.out.println(goodImgs.toString());

		System.out.println("상품리스트 게시글수 :  " + list.size());

		return "YYYView/list4com";
	}

}
