package Controller.HHHController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import Command.HHHCommand.CreateDoCommand;
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
	
	@RequestMapping("/doCreateEnter")
	public String doCreateEnter(Model model, HttpSession session)
	{
		session.setAttribute("testHHHid", "nm02");
		return doCreateService.getMemberInfo(model,session);
	}
	
	@RequestMapping("/doCreatePlace")
	public String doCreatePlace(Model model,@RequestParam("doPlay") String doPlay)
	{
		model.addAttribute("doPlay",doPlay);
		return doCreateService.getGoodsList(model);
	}
	
	@RequestMapping("/placeDetail")
	public String placeDetail(Model model,@RequestParam("num") String num)
	{
		return doCreateService.getGoodsDetail(model,num);
	}
	
	@RequestMapping("/doCreatePay")
	public String doCreatePay(Model model,CreateDoCommand createDoCommand,
			HttpServletRequest request ,@RequestParam("mainPhoto") MultipartFile mainPhoto,
			@RequestParam("PlaceNum") String placeNum,
			HttpSession session)
	{
		//String placeNum = (String) request.getAttribute("PlaceNum");
		createDoCommand.setPlaceNum(placeNum);
		System.out.println(placeNum);
		doCreateService.completeDoForm(model,mainPhoto,createDoCommand,session);
		return "HHHview/doCreatePay";
	}
	
	@RequestMapping("/doPayComplete")
	public String doPayComplete(Model model)
	{
		
		return null;
	}
	
	@RequestMapping("/doCreateCardPay")
	public String doCreateCardPay(Model model, HttpSession session)
	{
		
		return "HHHview/doCreateCardPay";
	}
	
	
	
}
