package Service.LEEService;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import Command.LEECommand.MemberJoinCommand;
import Model.DTO.LEEDTO.Member;
import Repository.LEERepository.SessionRepository;

@Service
public class MemberJoinService {
	@Autowired
	private SessionRepository sessionRepository;
	@Autowired
	private ReportSubmissionService reportSubmissionService;

	private SimpleDateFormat dt = new SimpleDateFormat("yymmdd");
	private Date date;
	private Timestamp tst;
	private String path;

	public String memberInsert(Model model, MemberJoinCommand mjc, String memId, MultipartFile report,
			HttpServletRequest request, HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		Member mem = new Member();
		mem.setMemberId(mjc.getId1());
		mem.setMemberPw(mjc.getPw());
		mem.setMemberName(mjc.getUserName());

		date = dt.parse(mjc.getUserBir());
		tst = new Timestamp(date.getTime());
		mem.setMemberBir(tst);

		mem.setGender(mjc.getUserGender());
		mem.setEmail(mjc.getUserEmail());
		mem.setAddr(mjc.getUserAddr());
		mem.setMemberPh1(Long.valueOf(mjc.getUserPh1()));

		String storedFileName = reportSubmissionService.report(memId, report, model, request, mjc, session);
		mem.setFileName(storedFileName);
		sessionRepository.insertMem(mem);
		path = "LEEview/mainForm";
		return path;
	}

}
