package pid.qnaBoard.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import pid.qnaBoard.service.BoardVO;
import pid.qnaBoard.service.QnABoardDAO;
import pid.qnaBoard.service.QnABoardService;

@Service("QnAboardService")
public class QnABoardServiceImpl implements QnABoardService{
	
	@Resource(name = "QnAboardDAOMyBatis")
	private QnABoardDAO qnABoardDAO;

	@Override
	public void QnABoardInsert(BoardVO boardVO) throws Exception {
		qnABoardDAO.QnABoardInsert(boardVO);
	}

	@Override
	public List<BoardVO> qnABoardList(BoardVO boardVo) throws Exception {
		return qnABoardDAO.qnABoardList(boardVo);
	}

	@Override
	public BoardVO selectQnABoard(BoardVO boardNo) throws Exception {
		return qnABoardDAO.selectQnABoard(boardNo);
	}

	@Override
	public void updateQnABoard(BoardVO boardVo) throws Exception {
		qnABoardDAO.updateQnABoard(boardVo);
		
	}

	@Override
	public void deleteQnABoard(BoardVO boardVo) throws Exception {
		qnABoardDAO.deleteQnABoard(boardVo);
		
	}

	@Override
	public BoardVO backQnABoard(BoardVO boardVo) throws Exception {
		return qnABoardDAO.backQnABoard(boardVo);
	}

	@Override
	public BoardVO nextQnABoard(BoardVO boardVo) throws Exception {
		return qnABoardDAO.nextQnABoard(boardVo);
	}

	@Override
	public int totalQnA(BoardVO board) throws Exception {
		int result=qnABoardDAO.totalQnA(board);
		return result;
	}

	@Override
	public List<BoardVO> myQnA(BoardVO boardVo) throws Exception {
		return qnABoardDAO.myQnA(boardVo);
	}

	@Override
	public int totalMyQnA(String memeberId) throws Exception {
		int result = qnABoardDAO.totalMyQnA(memeberId);
		return result;
	}



}