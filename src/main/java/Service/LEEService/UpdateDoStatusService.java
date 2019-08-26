package Service.LEEService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import Repository.LEERepository.DoStatusUpdateRepository;

@Service
public class UpdateDoStatusService {

	@Autowired
	private DoStatusUpdateRepository doStatusUpdateRepository;

	public void updateStatus(Model model) {
		// TODO Auto-generated method stub
		String doing = "doing";
		String doend = "doend";
		doStatusUpdateRepository.doingUpdate(doing);
		doStatusUpdateRepository.doendUpdate(doend);
	}
}
