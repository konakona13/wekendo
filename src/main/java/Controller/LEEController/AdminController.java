package Controller.LEEController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import Service.LEEService.CashInService;
import Service.LEEService.KendoListService;

@Controller
public class AdminController {

	@Autowired
	private KendoListService kendoListService;
	@Autowired
	private CashInService cashInService;

	@RequestMapping("/kendo_list")
	public String doList(Model model, @RequestParam(value = "page", defaultValue = "1") String page) {
		return kendoListService.doList(model, page);
	}

	@RequestMapping(value = "/DodoDetail", method = RequestMethod.GET)
	public String doDetail(Model model, @RequestParam(value = "dodoNum") String doNum1) {
		return kendoListService.doDetail(model, doNum1);
	}
	
	@RequestMapping("/Cashin")
	public String cashList(Model model, @RequestParam(value = "page", defaultValue = "1") String page) {
		return cashInService.listCashBuy(model, page);
	}
}
