package Controller.HHHController;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
		
		return "HHHview/doCreateFirst";
	}
	
	@RequestMapping("/doCreatePlace")
	public String doCreatePlace(Model model)
	{
		return doCreateService.getGoodsList(model);
	}
	
	@RequestMapping("/placeDetail")
	public String placeDetail(Model model,@RequestParam("num") String num)
	{
		return doCreateService.getGoodsDetail(model,num);
	}
	
	
	
	@RequestMapping("/doCreatePay")
	public String doCreatePay(Model model, HttpSession session)
	{
		
		return "HHHview/doCreatePay";
	}
	
	
	
	@RequestMapping("/doCreateCardPay")
	public String doCreateCardPay(Model model, HttpSession session)
	{
		
		return "HHHview/doCreateCardPay";
	}
	
	
	
}
