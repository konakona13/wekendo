package Service.LEEService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Model.DTO.LEEDTO.Dodo;
import Repository.LEERepository.AdminSessionRepository;

@Service
public class MemKendoService {
	
	@Autowired
	private AdminSessionRepository adminSessionRepository;

	public List<Dodo> getHostList(String memNum) {
		// TODO Auto-generated method stub
		List<Dodo> list = adminSessionRepository.getHostDoList(memNum);
		return list;
	}

	public List<Dodo> getGuestList(String memNum) {
		// TODO Auto-generated method stub
		List<Dodo> list = adminSessionRepository.getGuestDoList(memNum);
		return list;
	}

}
