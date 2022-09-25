package pid.reviewBoard.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import pid.members.service.MembersVO;
import pid.reserve.service.ReserveVO;
import pid.reviewBoard.service.BoardVO;
import pid.reviewBoard.service.ReviewBoardService;

@Controller
public class ReviewBoardController {

	@Resource(name = "reviewBoardService")
	private ReviewBoardService boardService;

	// 예약칼럼이 체크아웃인지 비교
	@ResponseBody
	@RequestMapping(value = "/writeAble.do")
	public String writeAble(HttpSession session, HttpServletRequest request, Model model, ReserveVO reserveVo)
			throws Exception {
		System.out.println("예약정보..!!!" + reserveVo.toString());
		String data = "g";

		// 로그인 한 정보
		String memberId = null;
		session = request.getSession();
		memberId = (String) session.getAttribute("SessionMemberId");
		System.out.println(memberId);

		// 예약정보
		ReserveVO reserve = boardService.reserveReview(reserveVo);
		System.out.println("예약정보 갖고와~!" + reserve.toString());

		// 예약한사람의 아이디와 로그인 한 사람의 아이디가 같은가?
		if (reserve.getMemberId().equals(memberId)) {
			System.out.println("아이디가 일치합니다.");
			data = "yes";
			model.addAttribute("a", reserve);
		} else {
			System.out.println("아이디가 불일치합니다.");
			data = "no";
		}

		return data;
	}

	// 글쓰기로 이동.
	@RequestMapping(value = "/write.do")
	public String write(HttpSession session, HttpServletRequest request, Model model, ReserveVO reserveVo)
			throws Exception {
		System.out.println("예약 넘버 가져와..!!!" + reserveVo);
		ReserveVO reserve = boardService.reserveReview(reserveVo);

		String memberId = null;
		session = request.getSession();
		memberId = (String) session.getAttribute("SessionMemberId");

		model.addAttribute("memberId", memberId);
		model.addAttribute("reserve", reserve);
		return "ReviewBoard/ReviewWriteForm";
	}

	// 리뷰 글쓰기
	@ResponseBody
	@RequestMapping(value = "/insertReviewboard.do", method = RequestMethod.POST)
	public String insertReviewBoard(ReserveVO reserveVo, BoardVO boardVO, MembersVO membersVO, HttpSession session,
			HttpServletRequest request) throws Exception {
		System.out.println("값 넘어왔당");
		System.out.println("예약번호~~!!!" + reserveVo.toString());

		String memberId = null;
		String memberNickname = null;
		String data = "";

		session = request.getSession();
		// System.out.println(session);
		memberId = (String) session.getAttribute("SessionMemberId");
		memberNickname = (String) session.getAttribute("SessionMemberNickname");
		// System.out.println("닉네임"+memberNickname);

		boardVO.setMemberId(memberId);
		boardVO.setMemberNickname(memberNickname);
		boardVO.setBoardType("Review");
		// System.out.println("값 넘어왔당");

		if (memberId != null) {
			boardService.insertBoard(boardVO);
			boardService.reserveReviewWrite(reserveVo);

		} else if (memberId == null)
			data = "no";
		return data;
	}

	// 리뷰 검색
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("제목", "TITLE");
		conditionMap.put("내용", "CONTENT");
		return conditionMap;
	}

	// 리뷰글 조회
	@RequestMapping(value = "/reviewBoardlist.do")
	public String reviewBoardlist(BoardVO boardVo, Model model, HttpSession session, HttpServletRequest request)
			throws Exception {
		// System.out.println("목록보기");
		String memberId = null;
		session = request.getSession();
		memberId = (String) session.getAttribute("SessionMemberId");
		double stars = boardService.totalStars(boardVo);
		int star = (int) stars;

		System.out.println("dddd" + stars);
		System.out.println("dddd" + star);
		int total = boardService.totalReview(boardVo);

		int totalPage = (int) Math.ceil((double) total / 10);

		int pageList = boardVo.getPageList();

		int viewPage = boardVo.getViewPage();

		int firstPage = ((viewPage - 1) / pageList) * pageList + 1;
		int lastPage = firstPage + pageList - 1;
		if (lastPage > totalPage) {
			lastPage = totalPage;
		}
		int startIndex = (viewPage - 1) * 10;
		int endIndex = 10;

		boardVo.setStartIndex(startIndex);
		boardVo.setEndIndex(endIndex);

		boardVo.setPageList(pageList);
		boardVo.setFirstPage(firstPage);
		boardVo.setLastPage(lastPage);

		if (boardVo.getSearchCondition() == null)
			boardVo.setSearchCondition("TITLE");
		if (boardVo.getSearchKeyword() == null)
			boardVo.setSearchKeyword("");

		model.addAttribute("memberId", memberId);
		model.addAttribute("total", total);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("pageList", pageList);
		model.addAttribute("firstPage", firstPage);
		model.addAttribute("lastPage", lastPage);

		model.addAttribute("totalStars", stars);
		model.addAttribute("totalStar", star);

		model.addAttribute("reviewBoardList", boardService.selectReviewList(boardVo));

		return "ReviewBoard/reviewBoardlist";
	}

	// 리뷰글 1개조회
	@RequestMapping(value = "/reviewBoard.do")
	public String reviewBoard(BoardVO boardVo, Model model, HttpSession session, HttpServletRequest request,
			MembersVO membersVo) throws Exception {
		// System.out.println("리뷰보드 컨트롤러");
		System.out.println("보드" + boardVo);
		String memberId = null;
		MembersVO sessionMember = null;
		session = request.getSession();
		memberId = (String) session.getAttribute("SessionMemberId");
		sessionMember = (MembersVO) session.getAttribute("SessionMember");

		// 등급 가져오기
		BoardVO reviewBoard = boardService.selectReview(boardVo);
		// System.out.println("글쓴사람 아이디~~~!!"+reviewBoard.getMemberId());

		membersVo.setMemberId(reviewBoard.getMemberId());
		// System.out.println("아아아아아"+membersVo.toString());
		// System.out.println("정보가지고와!!!!등급!!!"+boardService.selectBoardMem(membersVo));

		model.addAttribute("reviewBoard", reviewBoard);
		model.addAttribute("memberId", memberId);
		model.addAttribute("minReview", boardService.minReview());
		model.addAttribute("maxReview", boardService.maxReview());
		model.addAttribute("sessionMember", sessionMember);
		model.addAttribute("boardMem", boardService.selectBoardMem(membersVo));
		return "ReviewBoard/reviewBoard";
	}

	// 리뷰글 삭제
	@RequestMapping(value = "/deleteReview.do")
	public String deleteReview(BoardVO boardVo) throws Exception {
		// System.out.println("딜리트시작");
		// System.out.println("딜리트넘버값"+boardVo.toString());
		boardService.deleteReview(boardVo);
		return "ReviewBoard/reviewBoard";
	}

	// 수정페이지 이동
	@RequestMapping(value = "reviewUp.do")
	public String reviewUp(BoardVO boardVo, Model model, HttpSession session, HttpServletRequest request)
			throws Exception {
		// System.out.println(boardVo);
		String memberId = null;
		MembersVO sessionMember = null;
		BoardVO test = boardService.selectReview(boardVo);
		System.out.println("내용이 뭐니" + test.getContent());
		test.setContent(test.getContent().replace("<br>", "\r\n"));

		memberId = (String) session.getAttribute("SessionMemberId");
		sessionMember = (MembersVO) session.getAttribute("SessionMember");
		model.addAttribute("memberId", memberId);
		model.addAttribute("sessionMember", sessionMember);
//		/* model.addAttribute("reviewBoard", boardService.selectReview(boardVo)); */
		model.addAttribute("reviewBoard", test);
		// System.out.println(reviewBoard.toString());
		return "ReviewBoard/ReviewWriteForm";
	}

	// 이전글 이동
	@RequestMapping(value = "beforeReview.do")
	public String reviewBefore(BoardVO boardVo, Model model, HttpSession session, HttpServletRequest request,
			MembersVO membersVo) throws Exception {
		System.out.println("이전글 이동" + boardVo);

		// System.out.println("이전 글 넘버뭐야????"+boardService.beforeReview(boardVo));
		BoardVO reviewBoard = boardService.beforeReview(boardVo);
		membersVo.setMemberId(reviewBoard.getMemberId());
		// System.out.println("이전글 사람 정보
		// 가져와~~!"+boardService.selectBoardMem(membersVo));

		String memberId = null;
		MembersVO sessionMember = null;
		session = request.getSession();
		memberId = (String) session.getAttribute("SessionMemberId");
		sessionMember = (MembersVO) session.getAttribute("SessionMember");
		model.addAttribute("reviewBoard", boardService.beforeReview(boardVo));
		model.addAttribute("sessionMember", sessionMember);
		model.addAttribute("memberId", memberId);
		model.addAttribute("minReview", boardService.minReview());
		model.addAttribute("boardMem", boardService.selectBoardMem(membersVo));
		return "ReviewBoard/reviewBoard";

	}

	// 다음 글 이동
	@RequestMapping(value = "afterReview.do")
	public String afterReview(BoardVO boardVo, Model model, HttpSession session, HttpServletRequest request,
			MembersVO membersVo) throws Exception {
		// System.out.println("다음글 이동"+boardVo);
		String memberId = null;
		MembersVO sessionMember = null;

		BoardVO reviewBoard = boardService.afterReview(boardVo);
		membersVo.setMemberId(reviewBoard.getMemberId());

		session = request.getSession();
		memberId = (String) session.getAttribute("SessionMemberId");
		sessionMember = (MembersVO) session.getAttribute("SessionMember");
		// System.out.println("다음글" + reviewBoard);
		model.addAttribute("reviewBoard", boardService.afterReview(boardVo));
		model.addAttribute("sessionMember", sessionMember);
		model.addAttribute("memberId", memberId);
		model.addAttribute("maxReview", boardService.maxReview());
		model.addAttribute("boardMem", boardService.selectBoardMem(membersVo));
		return "ReviewBoard/reviewBoard";

	}
	
	// 진짜 수정
		@RequestMapping(value = "reviewUpdate.do", method=RequestMethod.POST)
		public String reviewUpdate(BoardVO boardVO, @RequestParam("file") MultipartFile file,
				MembersVO membersVO, HttpSession session, HttpServletRequest request) throws Exception {
			// System.out.println("넘어온 값"+boardVo.toString());
			
			System.out.println("------>" + boardVO.toString());
			String data = "";
			session = request.getSession();
			// System.out.println(session);

			String fileRealName = file.getOriginalFilename(); // 파일명을 얻어낼 수 있는 메서드!
			long size = file.getSize(); // 파일 사이즈

			System.out.println("파일명 : " + fileRealName);
			System.out.println("용량크기(byte) : " + size);
			// 서버에 저장할 파일이름 fileextension으로 .jsp이런식의 확장자 명을 구함
			// 여기서 화이트 리스트로 정리해서 파일 업로드 막아야함....
			
			
			String fileExtension = "";
			
			if(fileRealName != "") {
				fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());
				
			}
			// String uploadFolder =
			// "/Users/roopre/egov/PetInDeligth/src/main/webapp/resource/upload";
			String uploadFolder = "/Users/roopre/Desktop/DIP/picture";
//			윈도우 쪽 파일 업로드 경로.... 맥이라 저랑 다름..
//			String uploadFolder = "C:\\test\\upload";
			// 이러면 upload 파일 안에 들어감

			/*
			 * 파일 업로드시 파일명이 동일한 파일이 이미 존재할 수도 있고 사용자가 업로드 하는 파일명이 언어 이외의 언어로 되어있을 수 있습니다.
			 * 타인어를 지원하지 않는 환경에서는 정산 동작이 되지 않습니다.(리눅스가 대표적인 예시) 고유한 랜던 문자를 통해 db와 서버에 저장할
			 * 파일명을 새롭게 만들어 준다.
			 * 
			 * /Users/roopre/egov/PetInDeligth/src/main/webapp/resource/upload
			 */

			UUID uuid = UUID.randomUUID();
			System.out.println(uuid.toString());
			String[] uuids = uuid.toString().split("-");

			String uniqueName = uuids[0];
			System.out.println("생성된 고유문자열" + uniqueName);
			System.out.println("확장자명" + fileExtension);

			// System.out.println("닉네임"+memberNickname);

			boardVO.setReviewPicturePath(uniqueName + fileExtension);
			boardService.updateReview(boardVO);
			// uniqueName이게 어떻게 해서 만들어진 사진 이름
			// fileExtension 이 어떻게 해서 만들어진 파일 확장자 이름

			// File saveFile = new File(uploadFolder+"\\"+fileRealName); uuid 적용 전
			//File saveFile = new File(uploadFolder + "\\" + uniqueName + fileExtension); // 적용 후
			File saveFile = new File(uploadFolder+"/"+uniqueName + fileExtension); // 적용
			// 후
			try {
				file.transferTo(saveFile); // 실제 파일 저장메서드(filewriter 작업을 손쉽게 한방에 처리해준다.)

			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			return "forward:reviewBoardlist.do";
		}

	@PostMapping("/upload_ok")
	public String upload(@RequestParam("file") MultipartFile file, ReserveVO reserveVo, BoardVO boardVO,
			MembersVO membersVO, HttpSession session, HttpServletRequest request) throws Exception {

		System.out.println("------>" + reserveVo.toString());
		System.out.println("------>" + boardVO.toString());
		String data = "";
		session = request.getSession();
		// System.out.println(session);
		String memberId = (String) session.getAttribute("SessionMemberId");
		String memberNickname = (String) session.getAttribute("SessionMemberNickname");
		System.out.println("------>" + memberId + " : " + memberNickname);

		String fileRealName = file.getOriginalFilename(); // 파일명을 얻어낼 수 있는 메서드!
		long size = file.getSize(); // 파일 사이즈

		System.out.println("파일명 : " + fileRealName);
		System.out.println("용량크기(byte) : " + size);
		// 서버에 저장할 파일이름 fileextension으로 .jsp이런식의 확장자 명을 구함
		// 여기서 화이트 리스트로 정리해서 파일 업로드 막아야함....
		
		
		String fileExtension = "";
		
		if(fileRealName != "") {
			fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());
			
		}
		// String uploadFolder =
		// "/Users/roopre/egov/PetInDeligth/src/main/webapp/resource/upload";
		String uploadFolder = "/Users/roopre/Desktop/DIP/picture";
//		윈도우 쪽 파일 업로드 경로.... 맥이라 저랑 다름..
//		String uploadFolder = "C:\\test\\upload";
		// 이러면 upload 파일 안에 들어감

		/*
		 * 파일 업로드시 파일명이 동일한 파일이 이미 존재할 수도 있고 사용자가 업로드 하는 파일명이 언어 이외의 언어로 되어있을 수 있습니다.
		 * 타인어를 지원하지 않는 환경에서는 정산 동작이 되지 않습니다.(리눅스가 대표적인 예시) 고유한 랜던 문자를 통해 db와 서버에 저장할
		 * 파일명을 새롭게 만들어 준다.
		 * 
		 * /Users/roopre/egov/PetInDeligth/src/main/webapp/resource/upload
		 */

		UUID uuid = UUID.randomUUID();
		System.out.println(uuid.toString());
		String[] uuids = uuid.toString().split("-");

		String uniqueName = uuids[0];
		System.out.println("생성된 고유문자열" + uniqueName);
		System.out.println("확장자명" + fileExtension);

		memberId = (String) session.getAttribute("SessionMemberId");
		memberNickname = (String) session.getAttribute("SessionMemberNickname");
		// System.out.println("닉네임"+memberNickname);

		boardVO.setMemberId(memberId);
		boardVO.setMemberNickname(memberNickname);
		boardVO.setBoardType("Review");
		boardVO.setReviewPicturePath(uniqueName + fileExtension);
		boardService.insertBoard(boardVO);
		boardService.reserveReviewWrite(reserveVo);
		System.out.println();

		// uniqueName이게 어떻게 해서 만들어진 사진 이름
		// fileExtension 이 어떻게 해서 만들어진 파일 확장자 이름

		// File saveFile = new File(uploadFolder+"\\"+fileRealName); uuid 적용 전
		//File saveFile = new File(uploadFolder + "\\" + uniqueName + fileExtension); // 적용 후
		File saveFile = new File(uploadFolder+"/"+uniqueName + fileExtension); // 적용
		// 후
		try {
			file.transferTo(saveFile); // 실제 파일 저장메서드(filewriter 작업을 손쉽게 한방에 처리해준다.)

		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "forward:reviewBoardlist.do";
	}
}