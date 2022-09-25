package pid.qnaBoard.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import pid.members.service.MembersService;
import pid.members.service.MembersVO;
import pid.qnaBoard.service.BoardVO;
import pid.qnaBoard.service.QnABoardService;
import pid.qnaBoard.service.ReplyQnABoardService;
import pid.qnaBoard.service.ReplyQnABoardVO;

@Controller
public class QnABoardController {
	
	@Resource(name = "memberService")
	private MembersService service;
	
	@Resource(name="QnAboardService")
	private QnABoardService qnAboardService; 
	
	@Resource(name="ReplyQnABoardService")
	private ReplyQnABoardService replyQnABoardService;
	
	@RequestMapping("success.do")
	public String success(HttpSession session, HttpServletRequest request) {
		String memberId ="";
		session = request.getSession();
		memberId = (String) session.getAttribute("SessionMemberId");	
		session.setAttribute("SessionMemberId",memberId);
		return "QnAboard/success";
		 
	}
	
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap(){
		Map<String, String> conditionMap=new HashMap<String, String>();
		conditionMap.put("제목","TITLE");
		conditionMap.put("내용","CONTENT");
		return conditionMap;
	}
	
	@RequestMapping("freeboard.do")
	public String board(HttpSession session, HttpServletRequest request,Model model,MembersVO membersVo,BoardVO boardVo,ReplyQnABoardVO replyVo) throws Exception {
		String memberId ="";
		session = request.getSession();
		memberId = (String) session.getAttribute("SessionMemberId");	
		session.setAttribute("SessionMemberId",memberId);
		
		int total= qnAboardService.totalQnA(boardVo);
		int totalPage=(int)Math.ceil((double)total/10);
		int pageList=boardVo.getPageList();
		
		int viewPage=boardVo.getViewPage();
		
		int firstPage = ((viewPage - 1) / pageList) * pageList + 1;
		int lastPage = firstPage + pageList - 1;
		if (lastPage > totalPage) {
			lastPage = totalPage;
		}
		int startIndex = (viewPage - 1) * 10;
		int endIndex = 10;
		
		if(boardVo.getSearchCondition()==null) boardVo.setSearchCondition("TITLE");
		if(boardVo.getSearchKeyword()==null) boardVo.setSearchKeyword("");
		
		boardVo.setStartIndex(startIndex);
		boardVo.setEndIndex(endIndex);
		boardVo.setPageList(pageList);
		boardVo.setFirstPage(firstPage);
		boardVo.setLastPage(lastPage);
	
		List<MembersVO> membersList = service.selectMembers(membersVo);
		List<BoardVO> boardList = qnAboardService.qnABoardList(boardVo);
		List<ReplyQnABoardVO> replyQnABoardList = replyQnABoardService.replyQnABoardList(replyVo);
		
		model.addAttribute("total", total);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("pageList", pageList);
		model.addAttribute("firstPage", firstPage);
		model.addAttribute("lastPage", lastPage);
		
		model.addAttribute("memberList", membersList);
		model.addAttribute("boardList",boardList);
		model.addAttribute("replyQnABoardList",replyQnABoardList);
		return "QnAboard/QnA";
	}
	
	@RequestMapping(value="myQuestion.do")
	public String myQnA(HttpSession session, HttpServletRequest request,Model model,MembersVO membersVo,BoardVO boardVo,ReplyQnABoardVO replyVo) throws Exception {
		String memberId ="";
		session = request.getSession();
		memberId = (String) session.getAttribute("SessionMemberId");
		int total= qnAboardService.totalMyQnA(memberId);
		int totalPage=(int)Math.ceil((double)total/10);
		int pageList=boardVo.getPageList();
		int viewPage=boardVo.getViewPage();
		int firstPage = ((viewPage - 1) / pageList) * pageList + 1;
		int lastPage = firstPage + pageList - 1;
		if (lastPage > totalPage) {
			lastPage = totalPage;
		}
		int startIndex = (viewPage - 1) * 10;
		int endIndex = 10;
		
		if(boardVo.getSearchCondition()==null) boardVo.setSearchCondition("TITLE");
		if(boardVo.getSearchKeyword()==null) boardVo.setSearchKeyword("");
		
		boardVo.setStartIndex(startIndex);
		boardVo.setEndIndex(endIndex);
		boardVo.setPageList(pageList);
		boardVo.setFirstPage(firstPage);
		boardVo.setLastPage(lastPage);
	
		List<MembersVO> membersList = service.selectMembers(membersVo);
		List<BoardVO> boardList = qnAboardService.myQnA(boardVo);
		List<ReplyQnABoardVO> replyQnABoardList = replyQnABoardService.replyQnABoardList(replyVo);
		
		System.out.println("리스트ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ"+boardList);
		
		model.addAttribute("total", total);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("pageList", pageList);
		model.addAttribute("firstPage", firstPage);
		model.addAttribute("lastPage", lastPage);
		
		model.addAttribute("memberList", membersList);
		model.addAttribute("boardList",boardList);
		model.addAttribute("replyQnABoardList",replyQnABoardList);
		model.addAttribute("asd",memberId);
		return "QnAboard/myQnA";
	}
	
	@RequestMapping(value="insert.do",method = RequestMethod.GET)
	public String insert(HttpSession session, HttpServletRequest request,Model model,String memberId) throws Exception {
		System.out.println("135135135"+memberId);
		String memberIds = null;
		session = request.getSession();
		memberIds = (String) session.getAttribute("SessionMemberId");
		if(memberIds != null) {
		model.addAttribute("memberSelect", service.selectMember(memberIds));
		return "QnAboard/insertBoard";
		}else {
			return "QnAboard/error";
		}
	}
	
	@RequestMapping(value="ins.do", method = RequestMethod.POST)
	public String ins(HttpSession session, HttpServletRequest request,BoardVO boardVo) throws Exception {
		String memberId ="";
		String memberNickname = "";
		session = request.getSession();
		memberId = (String) session.getAttribute("SessionMemberId");
		memberNickname = (String) session.getAttribute("SessionMemberNickname");
		session.setAttribute("SessionMemberId",memberId);
		boardVo.setMemberId(memberId);
		boardVo.setMemberNickname(memberNickname);
		boardVo.setBoardType("QnA");
		qnAboardService.QnABoardInsert(boardVo);
		
		return "QnAboard/QnA";
	}
	
	@RequestMapping(value="QnAView.do", method = RequestMethod.GET)
	public String qnABoardView(HttpSession session, HttpServletRequest request,BoardVO boardVo,Model model,ReplyQnABoardVO replyQnABoardVo) throws Exception {
		String memberId ="";
		session = request.getSession();
		memberId = (String) session.getAttribute("SessionMemberId");  
		session.setAttribute("SessionMemberId",memberId);
		BoardVO board = qnAboardService.selectQnABoard(boardVo);
		int min = replyQnABoardService.minReplyQnABoardNo(replyQnABoardVo);
		int max = replyQnABoardService.maxReplyQnABoardNo(replyQnABoardVo);
		model.addAttribute("board",board);
		model.addAttribute("min",min);
		model.addAttribute("max",max);
		return "QnAboard/QnAView";
	}
	
	
	@RequestMapping(value="backPage.do", method = RequestMethod.GET)
	public String backPage(HttpSession session, HttpServletRequest request,BoardVO boardVo,Model model, ReplyQnABoardVO replyQnABoardVo) throws Exception {
		String memberId ="";
		session = request.getSession();
		memberId = (String) session.getAttribute("SessionMemberId");  
		session.setAttribute("SessionMemberId",memberId);
		BoardVO board = qnAboardService.backQnABoard(boardVo);
		int min = replyQnABoardService.minReplyQnABoardNo(replyQnABoardVo);
		model.addAttribute("board",board);
		model.addAttribute("min",min);
		return "QnAboard/QnAView";
	}
	
	@RequestMapping(value="nextPage.do", method = RequestMethod.GET)
	public String nextPage(HttpSession session, HttpServletRequest request,BoardVO boardVo,Model model,ReplyQnABoardVO replyQnABoardVo) throws Exception {
		String memberId ="";
		session = request.getSession();
		memberId = (String) session.getAttribute("SessionMemberId");  
		session.setAttribute("SessionMemberId",memberId);
		BoardVO board = qnAboardService.nextQnABoard(boardVo);
		int max = replyQnABoardService.maxReplyQnABoardNo(replyQnABoardVo);
		model.addAttribute("board",board);
		model.addAttribute("max",max);
		return "QnAboard/QnAView";
	}
	
	
	
	@RequestMapping(value="updateQnABoard.do", method = RequestMethod.GET)
	public String updateQnABoard(HttpSession session, HttpServletRequest request,BoardVO boardVo,Model model) throws Exception {
		String memberId ="";
		session = request.getSession();
		memberId = (String) session.getAttribute("SessionMemberId");  
		session.setAttribute("SessionMemberId",memberId);
		BoardVO board = qnAboardService.selectQnABoard(boardVo);
		model.addAttribute("board",board);
		return "QnAboard/updateQnABoard";
	}
	
	@ResponseBody
	@RequestMapping(value="up.do", method = RequestMethod.POST)
	public String up(HttpSession session, HttpServletRequest request,BoardVO boardVo,Model model) throws Exception {
		String memberId ="";
		session = request.getSession();
		memberId = (String) session.getAttribute("SessionMemberId");  
		session.setAttribute("SessionMemberId",memberId);
		qnAboardService.updateQnABoard(boardVo);
	
		return "QnAboard/QnA";
	}
	
	@RequestMapping(value="del.do", method = RequestMethod.POST)
	public String del(HttpSession session, HttpServletRequest request,BoardVO boardVo,Model model,int boardNo) throws Exception{
		String memberId ="";
		session = request.getSession();
		memberId = (String) session.getAttribute("SessionMemberId");  
		session.setAttribute("SessionMemberId",memberId);
		MembersVO selectMemberId = service.selectMemberId(boardNo);
		
		if(memberId.equals(selectMemberId.getMemberId())) {
			qnAboardService.deleteQnABoard(boardVo);
			return "QnAboard/updateQnABoard";
		}
		return "QnAboard/error";
	} 
	
	@RequestMapping(value="replyQnABoard.do", method = RequestMethod.GET)
	public String replyQnABoard(HttpSession session, HttpServletRequest request, ReplyQnABoardVO replyQnABoardVo, Model model,BoardVO boardVo,int boardNo) throws Exception {
		String memberIds ="";
		String grade = "";
		session = request.getSession();
		memberIds = (String) session.getAttribute("SessionMemberId");  
		session.setAttribute("SessionMemberId",memberIds);
		grade = (String)session.getAttribute("SessionMemberGrade");
		ReplyQnABoardVO selectReplyQnABoard = replyQnABoardService.selectReplyQnABoard(replyQnABoardVo);
		BoardVO board = qnAboardService.selectQnABoard(boardVo);
		MembersVO selectMemberId =service.selectMemberId(boardNo);
		String smid = "";
		smid = (String)selectMemberId.getMemberId();
		if(memberIds == null) {
			return "QnAboard/error";
			
		}else if(memberIds.equals(smid) || grade.equals("Admin")) { 
			model.addAttribute("selectReplyQnABoard",selectReplyQnABoard);
			model.addAttribute("board",board);
			return "QnAboard/replyQnAView";
		}else {
			return "QnAboard/error";
		}
	}
	@RequestMapping(value="insQnA.do")
	public String insQnA(HttpSession session, HttpServletRequest request,Model model,BoardVO boardNo) throws Exception {
		BoardVO selectQnABoard =qnAboardService.selectQnABoard(boardNo);
		model.addAttribute("selectQnABoard", selectQnABoard);
		return "QnAboard/insertQnA";
	}
	
	@ResponseBody
	@RequestMapping(value="replyQnA.do", method = RequestMethod.POST)
	public String replyQnA(HttpSession session, HttpServletRequest request,Model model,ReplyQnABoardVO replyQnABoardVo,int boardNo) throws Exception {

		session = request.getSession();
		MembersVO sessionMember = (MembersVO) session.getAttribute("SessionMember");
		replyQnABoardVo.setBoardNo(boardNo);
		replyQnABoardVo.setMemberId(sessionMember.getMemberId());
		replyQnABoardVo.setMemberNickname(sessionMember.getMemberNickname());
		
		String grade = sessionMember.getMemberGrade();
		System.out.println(grade);
		String data = null;
		if(grade.equals("Admin")) {
			replyQnABoardService.insertReplyQnA(replyQnABoardVo);
			data = "good";
		}else {
			data = "bad";
		}
		System.out.println(data);
		return data;
	}
	
	@ResponseBody
	@RequestMapping(value="replyDel.do", method=RequestMethod.POST)
	public String replyDel(HttpSession session, HttpServletRequest request,int replyQnABoardNo) throws Exception {
		session = request.getSession();
		String rs = null;
		if(session.getAttribute("SessionMemberGrade").equals("Admin")) {
			replyQnABoardService.replyDel(replyQnABoardNo);
			rs = "good";
			return rs;
		}else {
			rs = "bad";
			return rs;
		}
	}
	
	@RequestMapping(value="upReplyQnABoard.do")
	public String upReply(HttpSession session, HttpServletRequest request,ReplyQnABoardVO replyQnABoardNo,Model model,BoardVO boardNo) throws Exception {
		session = request.getSession();
		if(session.getAttribute("SessionMemberGrade").equals("Admin")) {
			model.addAttribute("replyQnABoard", replyQnABoardService.selectReplyQnABoard(replyQnABoardNo));
			model.addAttribute("board",qnAboardService.selectQnABoard(boardNo));
			return "QnAboard/updateReplyQnABoard";
		}
		return "QnAboard/error";
	}
	
	@ResponseBody
	@RequestMapping(value="updateReply.do", method = RequestMethod.POST)
	public String updateReply(HttpSession session, HttpServletRequest request, ReplyQnABoardVO replyQnABoardVo) throws Exception {
		session = request.getSession();
		String rs = "";
		System.out.println("111111111111111111111111111");
		if(session.getAttribute("SessionMemberGrade").equals("Admin")) {
			rs = "good";
			System.out.println("22222222222222222222222222222222222222222");
			replyQnABoardService.upReply(replyQnABoardVo);
			System.out.println("333333333333333333333333333333333333333333");
			return rs;
		}else {
			rs = "bad";
			return rs;
		}
		
	}
}
