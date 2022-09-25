package pid.reviewBoard.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import pid.members.service.MembersVO;
import pid.reserve.service.ReserveVO;
import pid.reviewBoard.service.BoardVO;
import pid.reviewBoard.service.ReviewBoardDAO;
import pid.reviewBoard.service.ReviewBoardService;

@Service("reviewBoardService")
public class ReviewBoardServiceImpl implements ReviewBoardService{
	
	@Resource(name="reviewBoardDAOMybatis")
	private ReviewBoardDAO boardDAO;

	//리뷰글 삽입
	@Override
	public void insertBoard(BoardVO boardVo) throws Exception {
		boardDAO.insertBoard(boardVo);
	}

	//리뷰글 리스트
	@Override
	public List<BoardVO> selectReviewList(BoardVO boardVo) throws Exception {
		return boardDAO.selectReviewList(boardVo);
	}
	
	//리뷰글 전체 갯수
	@Override
	public int totalReview(BoardVO boardVo) throws Exception{
		int result=boardDAO.totalReview(boardVo);
		return result;
	}
	
	//리뷰글 1개 조회
	@Override
	public BoardVO selectReview(BoardVO boardVo) throws Exception {
		return boardDAO.selectReview(boardVo);
	}
	
	//리뷰글 삭제
	@Override
	public void deleteReview(BoardVO boardVo) throws Exception {
		boardDAO.deleteReview(boardVo);		
	}

	//리뷰글 수정
	@Override
	public void updateReview(BoardVO boardVo) throws Exception {
		boardDAO.updateReview(boardVo);
	}

	//리뷰글 이전
	@Override
	public BoardVO beforeReview(BoardVO boardVo) throws Exception {
		return boardDAO.beforeReview(boardVo);
	}

	//리뷰글 다음
	@Override
	public BoardVO afterReview(BoardVO boardVo) throws Exception {
		return boardDAO.afterReview(boardVo);
	}

	//리뷰글 최대 글 번호
	@Override
	public int maxReview() throws Exception {
		return boardDAO.maxReview();
	}

	//리뷰글 최소 글 번호
	@Override
	public int minReview() throws Exception {
		return boardDAO.minReview();
	}

	//글쓴사람 정보
	@Override
	public MembersVO selectBoardMem(MembersVO membersVo) throws Exception {
		return boardDAO.selectBoardMem(membersVo);
	}

	@Override
	public ReserveVO reserveReview(ReserveVO reserveVo) throws Exception {
		return boardDAO.reserveReview(reserveVo);
	}

	@Override
	public void reserveReviewWrite(ReserveVO reserveVo) throws Exception {
		boardDAO.reserveReviewWrite(reserveVo);
		
	}

	@Override
	public double totalStars(BoardVO boardVo) throws Exception {
		double result = boardDAO.totalStars(boardVo);
		return result;
	}
	

}
