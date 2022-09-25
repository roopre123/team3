package pid.reserve.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import pid.reserve.service.ReserveDAO;
import pid.reserve.service.ReserveService;
import pid.reserve.service.ReserveVO;
import pid.reserve.service.RoomVO;

@Service("reserveService")
public class ReserveServiceImpl implements ReserveService{
	
	@Resource(name = "reserveDAOMybatis")
	private ReserveDAO reserveDAO;
	
	@Override
	public List<RoomVO> reserveAbleSearchRoom(ReserveVO vo) throws Exception {
		return reserveDAO.reserveAbleSearchRoom(vo);
	}
	
	@Override
	public RoomVO reserveAbleRoomInformation(int vo) throws Exception {
		return reserveDAO.reserveAbleRoomInformation(vo);
	}

	@Override
	public void insertReserve(ReserveVO vo) throws Exception {
		reserveDAO.insertReserve(vo);
	}
	
	@Override
	public ReserveVO lastInsertReserve(String memberId) throws Exception {
		return reserveDAO.lastInsertReserve(memberId);
	}
	
	@Override
	public List<ReserveVO> reserveList(String memberId) throws Exception {
		return reserveDAO.reserveList(memberId);
	}
	
	@Override
	public ReserveVO checkReserveNo(ReserveVO vo) throws Exception {
		return reserveDAO.checkReserveNo(vo);
	}
	
	@Override
	public void reserveCancle(ReserveVO vo) throws Exception {
		reserveDAO.reserveCancle(vo);
	}

	@Override
	public List<ReserveVO> reserveListAll(ReserveVO vo) throws Exception {		
		return reserveDAO.reserveListAll(vo);
	}

	@Override
	public int totalReserve(ReserveVO vo) throws Exception {
		int result = reserveDAO.totalReserve(vo);
		return result;
	}

	@Override
	public void checkIn(int reserveNo) throws Exception {
		reserveDAO.checkIn(reserveNo);	
	}
	
	@Override
	public void checkOut(int reserveNo) throws Exception {
		reserveDAO.checkOut(reserveNo);		
	}
}
