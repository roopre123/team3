package pid.qnaBoard.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import pid.qnaBoard.service.BoardVO;
import pid.qnaBoard.service.QnABoardDAO;

@Repository("QnAboardDAOMyBatis")
public class QnABoardDAOMyBatis extends EgovAbstractMapper implements QnABoardDAO{

	@Override
	public void QnABoardInsert(BoardVO boardVO) {
		insert("insertQnABoard",boardVO);
	}

	@Override
	public List<BoardVO> qnABoardList(BoardVO boardVo) throws Exception {
		return selectList("qnABoardList",boardVo);
	}

	@Override
	public BoardVO selectQnABoard(BoardVO boardNo) throws Exception {
		return selectOne("selectQnABoard",boardNo);
	}

	@Override
	public void updateQnABoard(BoardVO boardVo) throws Exception {
		update("updateQnABoard",boardVo);
	}

	@Override
	public void deleteQnABoard(BoardVO boardVo) throws Exception {
		delete("deleteQnABoard",boardVo);
		
	}

	@Override
	public BoardVO backQnABoard(BoardVO boardVo) throws Exception {
		return selectOne("backQnABoard",boardVo);
	}

	@Override
	public BoardVO nextQnABoard(BoardVO boardVo) throws Exception {
		return selectOne("nextQnABoard",boardVo);
	}

	@Override
	public int totalQnA(BoardVO board) throws Exception {
		int result=selectOne("totalQnA", board);
		return result;
	}

	@Override
	public List<BoardVO> myQnA(BoardVO boardVo) throws Exception {
		return selectList("myQnA",boardVo);
	}

	@Override
	public int totalMyQnA(String memberId) throws Exception {
		int result=selectOne("totalMyQnA",memberId);
		return result;
	}


	

}
