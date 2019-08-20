package Service.LEEService;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberLogoutService {
	public void logout(HttpSession session,
			HttpServletResponse response) {
		Cookie autoCk = new Cookie("auto", "");
		autoCk.setMaxAge(0);
		response.addCookie(autoCk);
		session.invalidate();
	}
}
