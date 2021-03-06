package Controller.HHHController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import Command.HHHCommand.CreateDoCommand;
import Command.HHHCommand.DoCreatePay;
import Command.HHHCommand.DoCreatePlace;
import Command.HHHCommand.DoPayCommand;
import Command.HHHCommand.DoPayComplete;
import Command.HHHCommand.SelectBuyGoods;
import Model.DTO.HHHDTO.Kendo;
import Service.HHHService.DoCreateService;

@Controller
public class DoCreateController
{
	@Autowired
	DoCreateService doCreateService;
	
	@RequestMapping("/HDO")
	public String HDO(Model model)
	{
		System.out.println("HDO컨트롤러111ss");
		return "HHHview/startrotjf";
	}
	
	@RequestMapping("/testF")
	public String testF(Model model)
	{
		System.out.println("HDO컨트롤러111ss");
		return "HHHview/testff";
	}
	
	@RequestMapping("/doCreateEnter")
	public String doCreateEnter(Model model, HttpSession session)
	{
		//session.setAttribute("testHHHid", "nm02");
		return doCreateService.getMemberInfo(model,session);
	}
	
	@RequestMapping("/doCreatePlace")
	public String doCreatePlace(Model model,@RequestParam("doPlay") String doPlay,@RequestParam("doArea") String doArea,@RequestParam("goodsKind") String goodsKind,
			@RequestParam("startDate") String startDate,@RequestParam("endDate") String endDate)
	{
		System.out.println("doCreatePlace 진입" );
		if(doPlay.equals("undefined"))
		{
			doPlay = "무관";
			System.out.println("테마무관");
		}
		
		if(doArea.equals("undefined"))
		{
			doArea = "무관";
			System.out.println("테마무관");
		}
		
		
		model.addAttribute("doPlay",doPlay);
		model.addAttribute("doArea",doArea);
		System.out.println("doPlay"+doPlay);
		System.out.println("doArea"+doArea);
		
		
		
		model.addAttribute("goodsKind",goodsKind);
		model.addAttribute("startDate",startDate);
		model.addAttribute("endDate",endDate);
		
		return doCreateService.getGoodsList(model,goodsKind);
	}
	
	@RequestMapping("/placeDetail")
	public String placeDetail(Model model,@RequestParam("num") String num,@RequestParam("goodsKind") String goodsKind,
			@RequestParam("startDate") String startDate,@RequestParam("endDate") String endDate)
	{
		model.addAttribute("goodsKind",goodsKind);
		model.addAttribute("startDate",startDate);
		model.addAttribute("endDate",endDate);
		
		return doCreateService.getGoodsDetail(model,num);
	}
	
	@RequestMapping("/doCreatePay")
	public String doCreatePay(Model model,CreateDoCommand createDoCommand,DoCreatePay doCreatePay,
			HttpServletRequest request ,@RequestParam("mainPhoto") MultipartFile mainPhoto,MultipartFile[]  report,
			@RequestParam("placeNum") String placeNum,
			HttpSession session)
	{
		//String placeNum = (String) request.getAttribute("PlaceNum");
		
		createDoCommand.setPlaceNum(placeNum);
		System.out.println(doCreatePay.getBuyDays());//null?
		System.out.println("from placeNum"+placeNum);
		doCreateService.completeDoForm(model,mainPhoto,createDoCommand,doCreatePay,session,report);
		return "HHHview/doCreatePay";
	}
	
	@RequestMapping("/selectBuyGoods")
	public String selectBuyGoods(Model model,SelectBuyGoods selectBuyGoods,HttpSession session)
	{
		System.out.println("진입테스트 : selectBuyGoods");
		doCreateService.selectBuyGoods(model,selectBuyGoods,session);
		System.out.println("아웃테스트 : selectBuyGoods");
		return "HHHview/closeWinH";
	}
	
	@RequestMapping("/doPayComplete")
	public String doPayComplete(Model model,DoPayComplete doPayComplete,HttpServletRequest request,HttpSession session)
	{
		doCreateService.payComplete(model, doPayComplete,request, session);
		session.removeAttribute("goodsList");
		return "redirect:main";
	}
	
	@RequestMapping("/doCreateCardPay")
	public String doCreateCardPay(Model model, HttpSession session)
	{
		
		return "HHHview/doCreateCardPay";
	}
	
	
	@RequestMapping("/listReset")
	public String listReset(Model model, HttpSession session)
	{
		
		return "HHHview/doCreateCardPay";
	}
	
	@RequestMapping("/testCC")
	public String testCC()
	{
		
		return "HHHview/testCalander";
	}
	
	@RequestMapping("/kakaoFrm")
	public String kakaoFrm(Model model, @RequestParam("doNum") String doNum,@RequestParam("hostNum") String hostNum)
	{

		return "memberMain";
	}
	
	@RequestMapping("/tt")
	public String goodsList()
	{
		return "HHHview/goodsList";
	}
	
	@RequestMapping("/DetailCs")
	public String detailCs()
	{
		return "HHHview/doDetailCs";
	}
	
	
}
