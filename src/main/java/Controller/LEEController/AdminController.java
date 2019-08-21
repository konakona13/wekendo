package Controller.LEEController;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import Service.LEEService.KendoListService;

@Controller
public class AdminController {

	@Autowired
	private KendoListService kendoListService;

	@RequestMapping("/kendo_list")
	public String doList(Model model, @RequestParam(value = "page", defaultValue = "1") String page) {
		return kendoListService.doList(model, page);
	}

	@RequestMapping(value = "/KendoDetail", method = RequestMethod.GET)
	public String doDetail(Model model, HttpServletRequest request) {
		String doNum = request.getParameter("doNum");
		System.out.println(doNum);
		return "LEEview/doDetail";
		// return kendoListService.doDetail(model, doNum);
	}
}
