package Service.YYYService;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import Command.YYYCommand.PlaceRegCommand;
import Model.DTO.YYYDTO.Company;
import Model.DTO.YYYDTO.GoodsImg;
import Model.DTO.YYYDTO.Goods;
import Repository.YYYRepository.GoodsRepository;


@Service
public class GoodsRegService {

	
	@Autowired
	private Goods goods;
	@Autowired
	private Company company;
	@Autowired
	private GoodsRepository goodsRepository;
	@Autowired
	private GoodsImg goodsImg;

	public void setPlace(Goods goods) {
		this.goods= goods;
	}
	
	String originalFile = null;
    String originalFileExtension = null;
    String storedFileName = null;
    String filePath = null;
    String realPath = null;

	public String goodsRegist(Model model, PlaceRegCommand command, HttpSession session, 
						      MultipartFile[] reports, HttpServletRequest request ) throws IOException	{
		//기업회원 구분별 상품번호 입력하기
		String companyNum = (String) session.getAttribute("comNum");
		
		company = goodsRepository.getCompanyDetail(companyNum);
		String companyKind = company.getCompanyKind();
		
		
		if (companyKind.equals("place")) {
			companyKind = "GDP";
		} else if (companyKind.equals("hotel")) {
			companyKind = "GDH";
		} else if (companyKind.equals("car")) {
			companyKind = "GDC";
		} else if (companyKind.equals("mentor")) {
			companyKind = "GDM";
		}
		
		
		goods.setCompanyNum(companyNum); //기업회원번호
		//System.out.println(companyNum);
		System.out.println("기업회원 구분: " + companyKind);
		goods.setGoodsNum(companyKind); //상품번호
		goods.setGoodsName(command.getGoodsName()); //상품명
		goods.setGoodsDetail(command.getGoodsDetail()); //상품상세
		goods.setGoodsDanger(command.getGoodsDanger()); //주의사항
		goods.setGoodsStock(command.getGoodsStock()); //재고수량
		goods.setGoodsPrice(command.getGoodsPrice()); //상품금액
		goods.setGoodsStatus("미승인");

		
		//System.out.println("입력 상품명: " + placeGoods.getGoodsName());
		
		
		//지역및 테마 분류
		goods.setMapLNum(command.getMapLNum()); 
		goods.setMapMNum(command.getMapMNum());
		goods.setMapSNum(command.getMapSNum());
		
		String themeLNum = command.getThemeLNum();
		String themeMNum = command.getThemeMNum();
		String themeSNum = command.getThemeSNum();
		
		if (themeLNum.equals("3")) {
			goods.setThemeLNum("3");
			goods.setThemeMNum("3");
			goods.setThemeSNum("3");
		} else {
			goods.setThemeLNum(themeLNum);
			goods.setThemeMNum(themeMNum);
			goods.setThemeSNum(themeSNum);
		}
		
		System.out.println("상품등록서비스_지역소분류번호 : " + goods.getMapSNum());
		System.out.println("상품등록서비스_테마소분류번호: " + goods.getThemeSNum());
		System.out.println("상품종류: "+ companyKind );	
		
		//이미지 추가
		filePath = "WEB-INF\\view\\YYYView\\upload\\";
		realPath = request.getServletContext().getRealPath(filePath);
		//realPath = "D:\\Hk004\\Spring\\sp4-smrit\\src\\main\\webapp\\WEB-INF\\view\\UploadFile\\upload\\";
		//System.out.println("realPath :  " + realPath);
		int i = 10;
		List<String> list = new ArrayList<String>();
		companyNum = (String) session.getAttribute("comNum");
		
		for(MultipartFile report : reports) {

			storedFileName = UUID.randomUUID().toString().replace("-", "");
			/*System.out.println("realPath : " + realPath);
			System.out.println("originalFile : " + originalFile);
			System.out.println("storedFileName : " + storedFileName);
			System.out.println("fileSize : " + report.getSize());*/
			
			goodsImg.setGoodsImgName(storedFileName);
			goodsImg.setGoodsImgNum(companyNum + ++i);
			goodsImg.setCompanyNum(companyNum);
			goodsImg.setGoodsImgKind(companyKind);
			goodsImg.setMapLNum(command.getMapLNum());
			goodsImg.setMapMNum(command.getMapMNum());
			goodsImg.setMapSNum(command.getMapSNum());
			goodsImg.setThemeLNum(command.getThemeLNum());
			goodsImg.setThemeMNum(command.getThemeMNum());
			goodsImg.setThemeSNum(command.getThemeSNum());
		
			File file = new File(realPath + "\\" +storedFileName);
			report.transferTo(file);
			list.add(storedFileName);
			System.out.println("이미지 파일명 : " + storedFileName);
			
		}
		
			goodsRepository.insertPlace(goods, goodsImg, list);

		return "redirect:./goodsMain";
}
}