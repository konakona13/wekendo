package Service.LEEService;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import Command.LEECommand.AuthInfo;
import Command.LEECommand.LoginCommand;
import Model.DTO.LEEDTO.Member;
import Repository.LEERepository.SessionRepository;

@Service
public class MemberLoginService {
	@Autowired
	private SessionRepository sessionRepository;
	/*
	 * public String loginPro1(Model model, LoginCommand loginCommand, HttpSession
	 * session, HttpServletResponse response) { System.out.println("bbbbb"); Member
	 * member = sessionRepository.userCheck1(loginCommand.getId1(),
	 * loginCommand.getPw()); int result = 0; if (member == null) { result = 1; }
	 * else { if (member.getMemberPw().equals(loginCommand.getPw())) { result = 3;
	 * AuthInfo authInfo = new AuthInfo(member.getMemberId(), member.getEmail(),
	 * member.getMemberName()); session.setAttribute("memid", authInfo); } else {
	 * result = 2; } } model.addAttribute("result", result); String idStore =
	 * loginCommand.getIdStore(); setCookie(idStore, response, loginCommand); return
	 * "main/loginPro"; }
	 */

	public String loginPro(Model model, LoginCommand loginCommand, HttpSession session, HttpServletResponse response) {
		Member member = sessionRepository.userCheck(loginCommand.getId1(), loginCommand.getPw());
		if (member == null) {
			model.addAttribute("msg111", "아이디가 존재하지 않습니다.");
		} else {
			AuthInfo authInfo = new AuthInfo(member.getMemberId(), member.getEmail(), member.getMemberName());
			authInfo.setProfile(member.getFileName());
			authInfo.setMemNum(member.getMemberNum());
			authInfo.setMemPh1(member.getMemberPh1());
			authInfo.setAddr(member.getAddr());
			session.setAttribute("memAuth", authInfo);
			session.setAttribute("memNum", member.getMemberNum());
			session.setAttribute("admin", member.getMemberId());
			model.addAttribute("member1",member);
		}
		String idStore = loginCommand.getIdStore();
		setCookie(idStore, response, loginCommand);
		return "redirect:main";
	}

	public void setCookie(String idStore, HttpServletResponse response, LoginCommand loginCommand) {
		if (idStore != null && idStore.equals("store")) {
			Cookie cookie = new Cookie("id", loginCommand.getId1());
			cookie.setMaxAge(60 * 60 * 24 * 30);
			response.addCookie(cookie);
		} else { // idstore의 체크하지 않았다면 쿠키 삭제
			Cookie cookie = new Cookie("id", loginCommand.getId1());
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
		String autoLogin = loginCommand.getAutoLogin();
		if (autoLogin.equals("auto")) {
			Cookie autoCk = new Cookie("auto", loginCommand.getId1());
			autoCk.setMaxAge(60 * 60 * 24 * 30);
			response.addCookie(autoCk);
		}
	}

	public void getSelectId(String id1, Model model) {
		// TODO Auto-generated method stub
		String userId = sessionRepository.getSelectId(id1);
		model.addAttribute("userId", id1);
		if(userId == null) {
			System.out.println("aaaa");
			model.addAttribute("msg", "사용가능한 id입니다.");
			model.addAttribute("num", 2);
		}else {
			model.addAttribute("msg", "사용중인 id입니다. 다시작성해 주세요.");
			model.addAttribute("num", 1);
		}
	}
}
