package Service.HHHService;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import Command.HHHCommand.CreateDoCommand;
import Command.HHHCommand.DoCreatePay;
import Command.HHHCommand.DoPayComplete;
import Command.HHHCommand.SelectBuyGoods;
import Model.DTO.HHHDTO.Company;
import Model.DTO.HHHDTO.DoIMG;
import Model.DTO.HHHDTO.GoodsImg;
import Model.DTO.HHHDTO.Kendo;
import Model.DTO.HHHDTO.Member;
import Model.DTO.HHHDTO.PlaceGoods;
import Repository.HHHRepository.DoCreateReporsitory;

@Service
public class DoCreateService
{
	@Autowired
	DoCreateReporsitory doCreateReporsitory;
	@Autowired
	UploadImgService uploadImgService;
	
	
	
	Kendo kendo = new Kendo();
	
	MultipartFile mainPhoto;
	MultipartFile[] detailIMG;
	DoCreatePay doCreatePay;
	
	public String getGoodsList(Model model, String goodsKind)
	{
		System.out.println("getGoodsList 서비스진입");
		List<PlaceGoods> goodsList = doCreateReporsitory.getGDList(goodsKind);
		model.addAttribute("list",goodsList);
		List<Company> companyList = doCreateReporsitory.getCpList();
		model.addAttribute("companyList",companyList);
		List<GoodsImg> goodImgs = doCreateReporsitory.getGoodsImg();
		model.addAttribute("goodImgs",goodImgs);
		
		System.out.println(goodsKind + " 상품 갯수"+goodsList.size());
		return "HHHview/doCreatePlace";
	}

	public String getGoodsDetail(Model model,String num)
	{
		PlaceGoods goods =  doCreateReporsitory.getOneGoods(num);
		model.addAttribute("goods",goods);
		Company company = doCreateReporsitory.getOneComp(goods.getCompanyNum());
		model.addAttribute("company",company);
		List<GoodsImg> goodImgs = doCreateReporsitory.getGoodsImg();
		model.addAttribute("goodImgs",goodImgs);
		return "HHHview/doGoodsDetail";
	}

	public String getMemberInfo(Model model,HttpSession session)
	{
		String memId = (String) session.getAttribute("memNum"); 
		System.out.println("memId : " + memId);
		Member member = doCreateReporsitory.getmemberInfo(memId);
		model.addAttribute("member",member);
		model.addAttribute("createDoCommand", new CreateDoCommand());
//		System.out.println("성별 : " + member.getGender());
//		System.out.println("번호 : " + member.getMemberNum());
		return "HHHview/doCreateFirst";
	}

	public void completeDoForm(Model model,MultipartFile mainPhoto, CreateDoCommand createDoCommand,
			DoCreatePay doCreatePay, HttpSession session, MultipartFile[] report)
	{
		//AuthInfo memInfo = (AuthInfo) session.getAttribute("memAuth");
		String memId = (String) session.getAttribute("memNum"); 
		//아이디값 삽입
		kendo.setHostNum(memId);
		kendo = getKendo(createDoCommand);
						
		doCreatePay.setHostNum(memId);
		//활동DTO 끝
		
		
		model.addAttribute("kendo",kendo);
		session.setAttribute("kendo",kendo);
		this.mainPhoto = mainPhoto;
		detailIMG = report;
		this.doCreatePay = doCreatePay;
		//int result = doCreateReporsitory.insertKendo(kendo);
		//if(result > 0)
		
		//상품정보
		String num = createDoCommand.getPlaceNum();
		PlaceGoods goods =  doCreateReporsitory.getOneGoods(num);
		model.addAttribute("placeGoods",goods);
		
		int sumPrice = 0;
		@SuppressWarnings("unchecked")
		List<SelectBuyGoods> goodsList = (List<SelectBuyGoods>) session.getAttribute("goodsList");
		for (SelectBuyGoods selectBuyGoods : goodsList)
		{
			sumPrice += Integer.parseInt(selectBuyGoods.getTotalPrice());
		}
		model.addAttribute("sumPrice",sumPrice);
		
	
	}
	
	public Kendo getKendo(CreateDoCommand createDoCommand)
	{
		
		kendo.setDoName(createDoCommand.getDoName());
		kendo.setDoStartDate(createDoCommand.getDoStartDate());
		kendo.setDoEndDate(createDoCommand.getDoEndDate());
//		Timestamp Curtime = new Timestamp(System.currentTimeMillis());
//		kendo.setDoOpenDate(Curtime);
		kendo.setDoCloseDate(createDoCommand.getDoCloseDate());
		kendo.setDoPp(createDoCommand.getDoPp());
		kendo.setDoNowpp(0);
		kendo.setDoDetail(createDoCommand.getDoDetail());
		kendo.setDoOptGender(createDoCommand.getLimitGender());
		kendo.setDoOptAge(createDoCommand.getLimitAge());
		kendo.setDoStatus("대기");
		return kendo;
	}
	
	public void upLoadDoIMG(Model model,MultipartFile mainPhoto,HttpServletRequest request,HttpSession session, String doNum, String kind)
	{
		String memInfo = (String) session.getAttribute("memNum");
		try
		{
			//이미지 업로드
			String storedFileName =  uploadImgService.upLoadImg(mainPhoto, request);
			model.addAttribute("mainImg",storedFileName);
			DoIMG doImg = new DoIMG();
			doImg.setDoImgKind(kind);
			doImg.setDoImgName(storedFileName);
			doImg.setHostNum(memInfo);
			doImg.setDoNum(doNum);
			doCreateReporsitory.insertDoimg(doImg);
		}
		catch (IllegalStateException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		catch (IOException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void payComplete(Model model, DoPayComplete doPayComplete,HttpServletRequest request, HttpSession session)
	{
		Kendo kendo = (Kendo) session.getAttribute("kendo"); 
		if(kendo != null)
		{
			System.out.println(kendo.getDoName());
		}
		
		String doNum = doCreateReporsitory.insertKendo(kendo,doPayComplete,doCreatePay ,session);
		upLoadDoIMG(model, mainPhoto, request, session , doNum,"main");
		//MultipartFile[] detailIMG
		if(detailIMG != null)
		{
			for (MultipartFile detailP : detailIMG)
			{
				upLoadDoIMG(model, detailP, request, session , doNum,"detail");
			}
		}
	}

	@SuppressWarnings("unchecked")
	public void selectBuyGoods(Model model,SelectBuyGoods selectBuyGoods,HttpSession session)
	{
		List<SelectBuyGoods> goodsList = null;
		if(session.getAttribute("goodsList") == null)
		{
			System.out.println("goodsList == null");
			goodsList = new ArrayList<SelectBuyGoods>();
			goodsList.add(selectBuyGoods);
			session.setAttribute("goodsList", goodsList);
			
		}
		else
		{
			System.out.println("goodsList  not null");
			goodsList = (List<SelectBuyGoods>) session.getAttribute("goodsList");
			goodsList.add(selectBuyGoods);
		}
	}
	

}
