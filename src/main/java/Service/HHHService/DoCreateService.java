package Service.HHHService;

import java.io.IOException;
import java.sql.Timestamp;
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
import Model.DTO.HHHDTO.DoIMG;
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
	DoCreatePay doCreatePay;
	
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

	public String getMemberInfo(Model model,HttpSession session)
	{
		String memId = (String) session.getAttribute("testHHHid"); 
		Member member = doCreateReporsitory.getmemberInfo(memId);
		model.addAttribute("member",member);
		model.addAttribute("createDoCommand", new CreateDoCommand());
		return "HHHview/doCreateFirst";
	}

	public void completeDoForm(Model model,MultipartFile mainPhoto, CreateDoCommand createDoCommand,
			DoCreatePay doCreatePay, HttpSession session)
	{
		//AuthInfo memInfo = (AuthInfo) session.getAttribute("memAuth");
		String memId = (String) session.getAttribute("testHHHid"); 
		//아이디값 삽입
		kendo.setHostNum(memId);
		kendo = getKendo(createDoCommand);
		
		doCreatePay.setHostNum(memId);
		//활동DTO 끝
		
		
		model.addAttribute("kendo",kendo);
		session.setAttribute("kendo",kendo);
		this.mainPhoto = mainPhoto;
		this.doCreatePay = doCreatePay;
		//int result = doCreateReporsitory.insertKendo(kendo);
		//if(result > 0)
		{
			//상품정보
			String num = createDoCommand.getPlaceNum();
			PlaceGoods goods =  doCreateReporsitory.getOneGoods(num);
			model.addAttribute("placeGoods",goods);
		}
		
	
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
	
	public void upLoadDoIMG(Model model,MultipartFile mainPhoto,HttpServletRequest request,HttpSession session, String doNum)
	{
		String memInfo = (String) session.getAttribute("testHHHid");
		try
		{
			//이미지 업로드
			String storedFileName =  uploadImgService.upLoadImg(mainPhoto, request);
			model.addAttribute("mainImg",storedFileName);
			DoIMG doImg = new DoIMG();
			doImg.setDoImgKind("main");
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
		
		String doNum = doCreateReporsitory.insertKendo(kendo,doPayComplete,doCreatePay);
		upLoadDoIMG(model, mainPhoto, request, session , doNum);
		//doCreateReporsitory.insertPayment(doPayComplete,doCreatePay);
		
		
		
	}
	

}
