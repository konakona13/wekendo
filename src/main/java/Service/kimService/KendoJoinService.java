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
import Command.kimCommand.KendoDetailCommand;
import Command.kimCommand.KendoJoinCommand;

import Model.DTO.kimDTO.Friend;
import Model.DTO.kimDTO.GuestPay;
import Model.DTO.kimDTO.Kendo;
import Model.DTO.kimDTO.KendoJoin;
import Repository.kimRepository.KendoJoinRepository;
import oracle.sql.TIMESTAMP;


@Service
public class KendoJoinService {
	private SimpleDateFormat sdt = new SimpleDateFormat("yyMMdd");
	private Date date;
	private Timestamp tst;
	
	@Autowired
	private KendoJoin kendoJoin;
	
	@Autowired
	private Friend friend;
	
	@Autowired
	private GuestPay guestPay;
	
	@Autowired
	private Kendo kendo;
	
	@Autowired
	KendoJoinRepository kendoJoinRepository;
	
	public String addKendoJoin(Model model, KendoJoinCommand kjc, KendoDetailCommand kdc) {
		String path = "";
		
		
		
		System.out.println(kjc.getJoinKakaoId());
		System.out.println(kjc.getJoinIntroduce());
		System.out.println(kjc.getJoinQty());
		System.out.println(kjc.getFriendName());
		System.out.println(kjc.getFriendPh());
		System.out.println(kjc.getFriendAge());
		
		model.addAttribute("kjc",kjc);
		model.addAttribute("kdc",kdc);
		
		System.out.println("kdc.getDoNum()1 : " + kdc.getDoNum());
			
		path = "kimView/kendoPayment" ;
		

		return path;
		
	}


	public String guestPayDetail(Model model, GuestPayCommand gpc, KendoJoinCommand kjc, KendoDetailCommand kdc, HttpSession session) {
		String path = "";
		String memberNum = (String)session.getAttribute("memNum");
		
		model.addAttribute("gpc",gpc);

		kendoJoin.setDoNum(kdc.getDoNum());
		System.out.println("kendoJoin2 : " + kendoJoin.getDoNum());
		
		tst = new Timestamp(new Date().getTime());
		kendoJoin.setJoinDate(tst);			
		kendoJoin.setJoinKakaoid(kjc.getJoinKakaoId());
		kendoJoin.setJoinIntroduce(kjc.getJoinIntroduce());
		kendoJoin.setJoinQty(kjc.getJoinQty());

		kendoJoin.setGuestNum(memberNum);
		
		System.out.println("guestPayDetail : aaa");
		System.out.println(kjc.getJoinKakaoId());
		System.out.println(kjc.getJoinIntroduce());
		System.out.println(kjc.getJoinQty());
		System.out.println(kjc.getFriendName());
		System.out.println(kjc.getFriendPh());
		System.out.println(kjc.getFriendAge());
		
		System.out.println(kendoJoin.getJoinDate());
		System.out.println(kendoJoin.getJoinKakaoid());
		System.out.println(kendoJoin.getJoinIntroduce());
		System.out.println(kendoJoin.getJoinQty());
		
		if(kendoJoin.getJoinQty() > 1) {
			friend.setFriendName(kjc.getFriendName());
			friend.setFriendPh(kjc.getFriendPh());
			friend.setFriendAge(kjc.getFriendAge());

			System.out.println("친구이름 : "+ friend.getFriendName());
			System.out.println("친구전화 : "+ friend.getFriendPh());
			System.out.println("친구나이 : "+ friend.getFriendAge());
			
			kendoJoinRepository.insertFriend(friend);
			
			model.addAttribute("friend",friend);
		}

		

		guestPay.setDutchDate(tst);
		guestPay.setPayStyle(gpc.getPayStyle());
		guestPay.setPayCardName(gpc.getPayCardName());
		guestPay.setPayCardNum(gpc.getPayCardNum());
		guestPay.setPayCvcNum(gpc.getPayCvcNum());
		guestPay.setPayDate(gpc.getPayDate());

		
		System.out.println("결제날짜 : "+ guestPay.getDutchDate());
		System.out.println("결제수단 : "+ guestPay.getPayStyle());
		System.out.println("카드이름 : "+ guestPay.getPayCardName());
		System.out.println("카드번호 : "+ guestPay.getPayCardNum());
		System.out.println("카드cvc : "+ guestPay.getPayCvcNum());
		System.out.println("유효날짜 : "+ guestPay.getPayDate());
		
		model.addAttribute("guestPay",guestPay);

		model.addAttribute("guestPay",guestPay);
		
		kendoJoinRepository.insertKendoJoin(kendoJoin);
		kendoJoinRepository.insertGuestPay(guestPay);
		

		
		path =  "kimView/payDone";
		

		return path;
		
	}

//
	public String kendoJoinList(Model model) {
		String path = "";

		List<Kendo> list = kendoJoinRepository.getKendoJoinList();
		
		System.out.println("kendoJoins.size : "+list.size());
	
		model.addAttribute("kendoJoins",list);
		
		return "kimView/kendoJoinList" ;
	}	
}
