package Service.kimService;


import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import Command.kimCommand.GuestPayCommand;
import Command.kimCommand.KendoJoinCommand;

import Model.DTO.kimDTO.Friend;
import Model.DTO.kimDTO.GuestPay;
import Model.DTO.kimDTO.KendoJoin;
import Repository.kimRepository.KendoJoinRepository;
import oracle.sql.TIMESTAMP;


@Service
public class KendoJoinService {
	private SimpleDateFormat sdt = new SimpleDateFormat("yyyy-MM-dd");
	private Date date;
	private Timestamp tst;
	
	@Autowired
	private KendoJoin kendoJoin;
	
	@Autowired
	private Friend friend;
	
	@Autowired
	private GuestPay guestPay;
	
	@Autowired
	KendoJoinRepository kendoJoinRepository;
	
	public String addKendoJoin(Model model, KendoJoinCommand kjc) {
		String path = "";

		System.out.println(kjc.getJoinKakaoId());
		System.out.println(kjc.getJoinIntroduce());
		System.out.println(kjc.getJoinQty());
		System.out.println(kjc.getFriendName());
		System.out.println(kjc.getFriendPh());
		System.out.println(kjc.getFriendAge());
		
		path = "kimView/kendoPayment" ;
		model.addAttribute("kjc",kjc);

		return path;
		
	}

	public String guestPay(Model model, KendoJoinCommand kjc, GuestPayCommand gpc) {
		
		System.out.println(gpc.getPayCardName());
		System.out.println(gpc.getPayCardNum());
		System.out.println(gpc.getPayCvcNum());
		System.out.println(gpc.getPayDate());

		
		model.addAttribute("gpc",gpc);
		
		
		
		tst = new Timestamp(new Date().getTime());
		kendoJoin.setJoinDate(tst);
			
		kendoJoin.setJoinKakaoid(kjc.getJoinKakaoId());
		kendoJoin.setJoinIntroduce(kjc.getJoinIntroduce());
		kendoJoin.setJoinQty(kjc.getJoinQty());
		
		
		friend.setFriendName(kjc.getFriendName());
		friend.setFriendPh(kjc.getFriendPh());
		friend.setFriendAge(kjc.getFriendAge());
		
		
		guestPay.setPayStyle(gpc.getPayStyle());
		guestPay.setPayCardName(gpc.getPayCardName());
		guestPay.setPayCardNum(gpc.getPayCardNum());
		guestPay.setPayCvcNum(gpc.getPayCvcNum());
		guestPay.setPayDate(gpc.getPayDate());
		
		
		model.addAttribute("kendoJoin",kendoJoin);
		model.addAttribute("friend",friend);
		model.addAttribute("guestPay",guestPay);
		
		kendoJoinRepository.insertKendoJoin(kendoJoin);
		kendoJoinRepository.insertfriend(friend);
		kendoJoinRepository.insertguestPay(guestPay);
		
		return "kimView/payDone";
		
	}
	
}
