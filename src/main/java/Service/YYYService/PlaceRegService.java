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
import Model.DTO.YYYDTO.PlaceGoods;
import Repository.YYYRepository.GoodsRepository;


@Service
public class PlaceRegService {

	
	@Autowired
	private PlaceGoods placeGoods;
	@Autowired
	private Company company;
	@Autowired
	private GoodsRepository goodsRepository;
	@Autowired
	private GoodsImg goodsImg;

	public void setPlace(PlaceGoods placeGoods) {
		this.placeGoods= placeGoods;
	}
	
	String originalFile = null;
    String originalFileExtension = null;
    String storedFileName = null;
    String filePath = null;
    String realPath = null;

	public String goodsRegist(Model model, PlaceRegCommand command, HttpSession session, 
						      MultipartFile[] reports, HttpServletRequest request ) throws IOException	{
		
		String companyNum = (String) session.getAttribute("comNum");
		
		//기업회원 구분별 상품번호 입력하기
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
		
		
		placeGoods.setCompanyNum(companyNum); //기업회원번호
		//System.out.println(companyNum);
		System.out.println("기업회원 구분: " + companyKind);
		placeGoods.setGoodsNum(companyKind); //상품번호
		placeGoods.setGoodsName(command.getGoodsName()); //상품명
		placeGoods.setGoodsDetail(command.getGoodsDetail()); //상품상세
		placeGoods.setGoodsDanger(command.getGoodsDanger()); //주의사항
		placeGoods.setGoodsStock(command.getGoodsStock()); //재고수량
		placeGoods.setGoodsPrice(command.getGoodsPrice()); //상품금액
		placeGoods.setGoodsStatus("미승인");

		
		//System.out.println("입력 상품명: " + placeGoods.getGoodsName());
		
		
		//지역및 테마 분류
		placeGoods.setMapLNum(command.getMapLNum()); 
		placeGoods.setMapMNum(command.getMapMNum());
		placeGoods.setMapSNum(command.getMapSNum());
		placeGoods.setThemeLNum(command.getThemeLNum());
		placeGoods.setThemeMNum(command.getThemeMNum());
		placeGoods.setThemeSNum(command.getThemeSNum());
		
		System.out.println("상품등록서비스_지역소분류번호 : " + placeGoods.getMapSNum());
		System.out.println("상품등록서비스_테마소분류번호: " + placeGoods.getThemeSNum());
			
		
		//이미지 추가
		filePath = "WEB-INF\\view\\YYYView\\upload\\";
		realPath = request.getServletContext().getRealPath(filePath);
		//realPath = "D:\\Hk004\\Spring\\sp4-smrit\\src\\main\\webapp\\WEB-INF\\view\\UploadFile\\upload\\";
		//System.out.println("realPath :  " + realPath);
		int i = 10;
		List<String> list = new ArrayList<String>();
	
		for(MultipartFile report : reports) {

			storedFileName = UUID.randomUUID().toString().replace("-", "");
			/*System.out.println("realPath : " + realPath);
			System.out.println("originalFile : " + originalFile);
			System.out.println("storedFileName : " + storedFileName);
			System.out.println("fileSize : " + report.getSize());*/
			
			goodsImg.setGoodsImgName(storedFileName);
			goodsImg.setGoodsImgNum(companyNum + ++i);
			goodsImg.setCompanyNum(companyNum);
			goodsImg.setMapLNum(command.getMapLNum());
			goodsImg.setMapMNum(command.getMapMNum());
			goodsImg.setMapSNum(command.getMapSNum());
			goodsImg.setThemeLNum(command.getThemeLNum());
			goodsImg.setThemeMNum(command.getThemeMNum());
			goodsImg.setThemeSNum(command.getThemeSNum());
		
			File file = new File(realPath + "\\" +storedFileName);
			report.transferTo(file);
			list.add(storedFileName);
			
		}
		
			goodsRepository.insertPlace(placeGoods, goodsImg, list);

		return "redirect:./goodsMain";
}
}