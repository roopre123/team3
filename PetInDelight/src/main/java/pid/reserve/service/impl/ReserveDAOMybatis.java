package pid.reserve.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import pid.reserve.service.ReserveDAO;
import pid.reserve.service.ReserveVO;
import pid.reserve.service.RoomVO;

@Repository("reserveDAOMybatis")
public class ReserveDAOMybatis extends EgovAbstractMapper implements ReserveDAO{
	
	@Override
	public List<RoomVO> reserveAbleSearchRoom(ReserveVO vo) throws Exception {
		List<RoomVO> searchRoom = selectList("searchRoom", vo);
		return searchRoom;
	}
	
	@Override
	public RoomVO reserveAbleRoomInformation(int vo) throws Exception {
		return selectOne("roomInformation", vo);
	}
	
	@Override
	public void insertReserve(ReserveVO vo) throws Exception {
		insert("insertReserve", vo);
	}
	
	@Override
	public ReserveVO lastInsertReserve(String memberId) throws Exception {
		return selectOne("lastInsertReserve", memberId);
	}
	
	@Override
	public List<ReserveVO> reserveList(String memberId) throws Exception {
		return selectList("reserveList", memberId);
	}
	
	@Override
	public ReserveVO checkReserveNo(ReserveVO vo) throws Exception {
		return selectOne("checkReserveNo", vo);
	}
	
	@Override
	public void reserveCancle(ReserveVO vo) throws Exception {
		update("reserveCancle", vo);
	}

	@Override
	public List<ReserveVO> reserveListAll(ReserveVO vo) throws Exception {
		return selectList("reserveListAll", vo);
	}

	@Override
	public int totalReserve(ReserveVO vo) throws Exception {
		int result = selectOne("totalReserve", vo);
		return result;
	}

	@Override
	public void checkIn(int reserveNo) throws Exception {
		update("checkIn", reserveNo);
	}
	
	@Override
	public void checkOut(int reserveNo) throws Exception {
		update("checkOut", reserveNo);
	}
}
