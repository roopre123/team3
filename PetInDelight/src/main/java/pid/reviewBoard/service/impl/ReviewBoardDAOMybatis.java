package pid.reviewBoard.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import pid.members.service.MembersVO;
import pid.reserve.service.ReserveVO;
import pid.reviewBoard.service.BoardVO;
import pid.reviewBoard.service.ReviewBoardDAO;

@Repository("reviewBoardDAOMybatis")
public class ReviewBoardDAOMybatis extends EgovAbstractMapper implements ReviewBoardDAO{
	
	//리뷰글 삽입
	@Override
	public void insertBoard(BoardVO boardVO) throws Exception {
		insert("insertReviewBoard",boardVO);
	}
	

	//리뷰글 리스트
	@Override
	public List<BoardVO> selectReviewList(BoardVO boardVo) throws Exception {
		System.out.println("말바티스"+boardVo.toString());
		return selectList("selectReviewList", boardVo);
	}
	
	//리뷰글 전체 갯수
	@Override
	public int totalReview(BoardVO boardVo) throws Exception{
		int result=selectOne("totalReview", boardVo);
		return result;
	}
	
	//리뷰글 1개조회
	@Override
	public BoardVO selectReview(BoardVO boardVo) throws Exception {
		return (BoardVO) selectOne("selectReview", boardVo);
	}

	//리뷰글 삭제
	@Override
	public void deleteReview(BoardVO boardVo) throws Exception {
		delete("deleteReview",boardVo);
		
	}
	
	//리뷰글 수정
	@Override
	public void updateReview(BoardVO boardVo) throws Exception {
		update("updateReview",boardVo);
		
	}

	//리뷰글 이전
	@Override
	public BoardVO beforeReview(BoardVO boardVo) throws Exception {
		return (BoardVO) selectOne("beforeReview", boardVo);
	}

	//리뷰글 다음
	@Override
	public BoardVO afterReview(BoardVO boardVo) throws Exception {
		return (BoardVO) selectOne("afterReview", boardVo);
	}
	
	//리뷰글 최대 글번호
	@Override
	public int maxReview() throws Exception {
		return selectOne("maxReview");
	}

	//리뷰글 최소 글번호
	@Override
	public int minReview() throws Exception {
		return selectOne("minReview");
	}


	@Override
	public MembersVO selectBoardMem(MembersVO boardVo) throws Exception {
		return (MembersVO) selectOne("selectBoardMem", boardVo);
	}


	//체크아웃 되었니?
	@Override
	public ReserveVO reserveReview(ReserveVO reserveVo) throws Exception {
		return (ReserveVO) selectOne("reserveReview", reserveVo);
	}


	@Override
	public void reserveReviewWrite(ReserveVO reserveVo) throws Exception {
		update("reserveReviewWrite",reserveVo);		
	}


	@Override
	public double totalStars(BoardVO boardVo) throws Exception {
		double result = selectOne("totalStars", boardVo);
		return result;
	}
}
