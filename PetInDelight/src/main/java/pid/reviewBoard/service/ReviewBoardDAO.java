package pid.reviewBoard.service;

import java.util.List;

import pid.members.service.MembersVO;
import pid.reserve.service.ReserveVO;

public interface ReviewBoardDAO {
	
	void insertBoard(BoardVO boardVo) throws Exception;
	
	List<BoardVO> selectReviewList(BoardVO boardVo) throws Exception;
	
	BoardVO selectReview(BoardVO boardVo) throws Exception;
	
	void deleteReview(BoardVO boardVo) throws Exception;
	
	void updateReview(BoardVO boardVo) throws Exception;
	
	BoardVO beforeReview(BoardVO boardVo) throws Exception;
	
	BoardVO afterReview(BoardVO boardVo) throws Exception;
	
	int maxReview() throws Exception;
	
	int minReview() throws Exception;
	
	public int totalReview(BoardVO boardVo) throws Exception;
	
	MembersVO selectBoardMem(MembersVO boardVo) throws Exception;
	
	ReserveVO reserveReview(ReserveVO reserveVo) throws Exception;
	
	void reserveReviewWrite(ReserveVO reserveVo) throws Exception;
	
	double totalStars(BoardVO boardVo) throws Exception;
	
}
