package pid.reserve.controller;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import pid.members.service.MembersVO;
import pid.reserve.service.ReserveService;
import pid.reserve.service.ReserveVO;
import pid.reserve.service.RoomVO;

@Controller
public class ReserveContoller {
	
	@Resource(name = "reserveService")
	private ReserveService reserveService;
	
	@RequestMapping(value = "/reserve.do", method = RequestMethod.GET)
	public String signUp() {
		return "reserve/reserve";
	}
	
	@RequestMapping(value = "/reservetest.do", method = RequestMethod.GET)
	public String reserveTest() {
		return "reserve/reservetest";
	}
	
	@RequestMapping(value = "/searchRoom", method = RequestMethod.POST)
	public String reserveAbleSearchRoom(ReserveVO reserveVo, Model model,
			@RequestParam(name="reserveStartDatee", required = true)String reserveStartDate,
			@RequestParam(name="reserveEndDatee", required = true)String reserveEndDate) throws Exception {
		
		reserveVo.setReserveStartDate((new SimpleDateFormat("yyyy-MM-dd")).parse(reserveStartDate));
		reserveVo.setReserveEndDate((new SimpleDateFormat("yyyy-MM-dd")).parse(reserveEndDate));
		System.out.println(reserveVo.toString());
		List<RoomVO> serachRoom = reserveService.reserveAbleSearchRoom(reserveVo);
		model.addAttribute("roomList",serachRoom);
		System.out.println(reserveVo.toString());
//		 = new SimpleDateFormat("yyyy-MM-dd").parse(reserveStartDate);
//		vo.setReserveStartDate(reserveStartDate);
//		vo.setReserveEndDate(reserveEndDate);
//		System.out.println(vo.toString());
		return "reserve/reserveAbleRoom";
	}
	
	@RequestMapping(value = "/roominformationview", method =RequestMethod.GET)
	public String roomInformationView(ReserveVO reserveVo, Model model,
			@RequestParam(name="reserveStartDatee")String reserveStartDate,
			@RequestParam(name="reserveEndDatee")String reserveEndDate) throws Exception{
		reserveVo.setReserveStartDate((new SimpleDateFormat("yyyy-MM-dd")).parse(reserveStartDate));
		reserveVo.setReserveEndDate((new SimpleDateFormat("yyyy-MM-dd")).parse(reserveEndDate));
		RoomVO room = reserveService.reserveAbleRoomInformation(reserveVo.getRoomNo());
		
		// 예약 일수를 구하는 
		long days =(reserveVo.getReserveEndDate().getTime() - reserveVo.getReserveStartDate().getTime()) / (24*60*60*1000);
		
		model.addAttribute("days", days);
		model.addAttribute("reserve",reserveVo);
		model.addAttribute("room",room);
		return "reserve/roomInformation";
	}
	
	@RequestMapping(value = "/detailreserve", method = RequestMethod.POST)
	public String detailreserve(HttpSession session, HttpServletRequest request,
			ReserveVO reserveVo, Model model,
			@RequestParam(name="reserveStartDatee")String reserveStartDate,
			@RequestParam(name="reserveEndDatee")String reserveEndDate) throws Exception{
		
		session  = request.getSession();
		String memberId = (String) session.getAttribute("SessionMemberId");
		
		if(memberId != null)
		{
			reserveVo.setReserveStartDate((new SimpleDateFormat("yyyy-MM-dd")).parse(reserveStartDate));
			reserveVo.setReserveEndDate((new SimpleDateFormat("yyyy-MM-dd")).parse(reserveEndDate));
			RoomVO room = reserveService.reserveAbleRoomInformation(reserveVo.getRoomNo());
			long days =(reserveVo.getReserveEndDate().getTime() - reserveVo.getReserveStartDate().getTime()) / (24*60*60*1000);
			MembersVO member = (MembersVO) session.getAttribute("SessionMember");
			model.addAttribute("room",room);
			model.addAttribute("days",days);
			model.addAttribute("member",member);
			model.addAttribute("reserve", reserveVo);
			
			return "reserve/detailReserve";
		}
		
		return "login";
	}
	
	@ResponseBody
	@RequestMapping(value = "insertReserve" , method = RequestMethod.POST)
	public int insertReserve(HttpSession session, HttpServletRequest request,
			ReserveVO reserveVo, Model model,
			@RequestParam(name="reserveStartDatee")String reserveStartDate,
			@RequestParam(name="reserveEndDatee")String reserveEndDate) throws Exception{
		
		session  = request.getSession();
		String memberId = (String) session.getAttribute("SessionMemberId");
		int data = 0 ;
		
		if(memberId != null)
		{
			data = 1;
			reserveVo.setReserveStartDate((new SimpleDateFormat("yyyy-MM-dd")).parse(reserveStartDate));
			reserveVo.setReserveEndDate((new SimpleDateFormat("yyyy-MM-dd")).parse(reserveEndDate));
			System.out.println(reserveVo.toString());
			reserveService.insertReserve(reserveVo);
			return data;
		}
		return data;
	}
	
	@RequestMapping(value = "reserveSuccess", method = RequestMethod.POST)
	public String successReserve(HttpSession session, HttpServletRequest request,Model model) throws Exception {
		session  = request.getSession();
		String memberId = (String) session.getAttribute("SessionMemberId");
		ReserveVO reserve = reserveService.lastInsertReserve(memberId);
		if(reserve.getMemberId().equals(memberId)) {
			MembersVO member = (MembersVO) session.getAttribute("SessionMember");
			model.addAttribute("member", member);
			model.addAttribute("reserve",reserve);
			return "reserve/reserveSuccess";
		}
		return "test";
	}
	@RequestMapping(value = "reserveListMember", method = RequestMethod.POST)
	public String reserveList(HttpSession session, HttpServletRequest request,Model model) throws Exception {
		
		session  = request.getSession();
		String memberId = (String) session.getAttribute("SessionMemberId");
		List<ReserveVO> reserveList = reserveService.reserveList(memberId);
		MembersVO member = (MembersVO) session.getAttribute("SessionMember");
		model.addAttribute("reserveList", reserveList);
		model.addAttribute("member", member);
		return "reserve/reserveList";

	}
	
	@RequestMapping(value =  "reserveStatus", method = RequestMethod.GET)
	public String reserveStatus(HttpSession session, HttpServletRequest request,Model model) {
		session  = request.getSession();
		String memberId = (String) session.getAttribute("SessionMemberId");
		if(memberId != null) {
			return "reserve/reserveStatus";
		}
		return "login";
		
	}
	
	@ResponseBody
	@RequestMapping(value = "reserveCancle", method = RequestMethod.POST)
	public int cancleReserve(HttpSession session, ReserveVO vo, 
			HttpServletRequest request,Model model) throws Exception {
		System.out.println(vo.toString());
		ReserveVO reserve = reserveService.checkReserveNo(vo);
		session  = request.getSession();
		String memberId = (String) session.getAttribute("SessionMemberId");
		int data = 0;
		if(reserve.getMemberId().equals(memberId))
		{
			data = 1;
			reserveService.reserveCancle(vo);
			return data;
		}
		return data;		
	}
	
	@RequestMapping(value = "/reserveListAll.do", method = RequestMethod.GET)
	public String reserveListAllError() {
		return "error/gradeCheck";
	}
	
	@RequestMapping(value = "/reserveListAll.do", method = RequestMethod.POST)
	public String reserveListAll(HttpSession session, HttpServletRequest request,
			ReserveVO vo, Model model) throws Exception {
		String memberGrade = "";
		session = request.getSession();
		memberGrade = (String) session.getAttribute("SessionMemberGrade");
		int total = reserveService.totalReserve(vo);
		if (memberGrade.equals("Admin")) {
			if(vo.getSearchCondition()==null) {
				vo.setSearchCondition("MEMBERID");
			}
			if(vo.getSearchKeyword()==null) {
				vo.setSearchKeyword("");
			}
			model.addAttribute("total", total);
			model.addAttribute("reserveListAll", reserveService.reserveListAll(vo));
			return "admin/reserveListAll";
		} else {
			return "error/gradeCheck";
		}		
	}
	
	@RequestMapping(value = "/reserveListAllSearch.do", method = RequestMethod.GET)
	public String reserveListAllSearch(HttpSession session, HttpServletRequest request,
			ReserveVO vo, Model model) throws Exception {
		String memberGrade = "";
		session = request.getSession();
		memberGrade = (String) session.getAttribute("SessionMemberGrade");
		if (memberGrade.equals("Admin")) {
			if(vo.getSearchCondition()==null) {
				vo.setSearchCondition("MEMBERID");
			}
			if(vo.getSearchKeyword()==null) {
				vo.setSearchKeyword("");
			}
			model.addAttribute("reserveListAll", reserveService.reserveListAll(vo));
			return "admin/reserveListSearch";
		} else {
			return "error/gradeCheck";
		}		
	}
	
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("예약번호", "RESERVENO");
		conditionMap.put("방번호", "ROOMNO");
		conditionMap.put("아이디", "MEMBERID");	
		conditionMap.put("예약상태", "RESERVETYPE");
		return conditionMap;
	}
	
	@RequestMapping(value = "/checkOut.do",method = RequestMethod.GET)
	public String checkOUT() {
		return "error/gradeCheck";
	}
	
	@ResponseBody
	@RequestMapping(value = "/checkIn.do", method = RequestMethod.POST)
	public String checkIn(@RequestParam(value = "reserveNo") int reserveNo,
			ReserveVO reserveVo) throws Exception {
		String data ="";
		System.out.println(reserveNo);		
		reserveService.checkIn(reserveNo);
		data = "ok";
		System.out.println(data);
		return data;
	}
	
	@ResponseBody
	@RequestMapping(value = "/checkOut.do", method = RequestMethod.POST)
	public String checkOut(@RequestParam(value = "reserveNo") int reserveNo,
			ReserveVO reserveVo) throws Exception {
		String data ="";
		System.out.println(reserveNo);		
		reserveService.checkOut(reserveNo);
		data = "ok";
		System.out.println(data);
		return data;
	}
}