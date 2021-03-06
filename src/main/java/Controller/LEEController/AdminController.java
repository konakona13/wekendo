package Controller.LEEController;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import Service.LEEService.CashInService;
import Service.LEEService.KendoListService;
import Service.LEEService.MemListService;

@Controller
public class AdminController {

	@Autowired
	private KendoListService kendoListService;
	@Autowired
	private CashInService cashInService;
	@Autowired
	private MemListService memListService;

	@RequestMapping("/kendo_list")
	public String doList(Model model, @RequestParam(value = "page", defaultValue = "1") String page) {
		return kendoListService.doList(model, page);
	}

	/*
	@RequestMapping(value = "/DodoDetail", method = RequestMethod.GET)
	public String doDetail(Model model, @RequestParam(value = "dodoNum") String doNum1) {
		return kendoListService.doDetail(model, doNum1);
	}
	*/

	@RequestMapping("/Cashin")
	public String cashList(Model model, @RequestParam(value = "page", defaultValue = "1") String page) {
		return cashInService.listCashBuy(model, page);
	}

	@RequestMapping("buybuySearch")
	public String buybuySearch(Model model, @RequestParam(value = "page", defaultValue = "1") String page,
			@RequestParam(value = "comName") String comName) {
		return cashInService.buybuySearch(model, comName, page);
	}

	@RequestMapping("/cashInsert")
	public String cashInsert(Model model, @RequestParam(value = "comName2") String comName,
			HttpServletResponse response) throws Exception {
		return cashInService.cashInsert(model, comName);
	}

	@RequestMapping(value = "/BuybuyDetail", method = RequestMethod.GET)
	public String BuybuyDetail(Model model, @RequestParam(value = "buyNum") String buyNum) {
		return cashInService.buybuyDetail(model, buyNum);
	}

	@RequestMapping(value = "/goodsDetail", method = RequestMethod.GET)
	public String goodsDetail(Model model, @RequestParam(value = "goodsName") String goodsName) {
		return cashInService.goodsDetail(model, goodsName);
	}

	@RequestMapping(value = "/DoBuyDetail", method = RequestMethod.GET)
	public String DoBuyDetail(Model model, @RequestParam(value = "doName") String doName) {
		return cashInService.doBuyDetail(model, doName);
	}
	
	@RequestMapping("/DodoDetail2")
	public String doGoodsDetail(Model model, @RequestParam(value = "dodoNum") String doNum1) {
		System.out.println(doNum1);
		return kendoListService.doGoodsDetail(model, doNum1);
	}
	
	@RequestMapping("/memcomList")
	public String memberList(Model model, @RequestParam(value = "page", defaultValue = "1") String page) {
		return memListService.memcomList(model, page);
	}
	
}
