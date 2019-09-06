package Service.LEEService;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import Model.DTO.LEEDTO.Buybuy;
import Model.DTO.LEEDTO.Member;
import Repository.LEERepository.SessionRepository;

@Service
public class CompanyOrderService {

	@Autowired
	private SessionRepository sessionRepository;

	public void getOrder(HttpSession session, Model model) {
		// TODO Auto-generated method stub
		String comNum = (String) session.getAttribute("comNum");
		List<Buybuy> orderList = sessionRepository.getOrderList(comNum);
		
		model.addAttribute("orders", orderList);
	}

}
