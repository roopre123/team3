package pid.reserve.service;

import java.util.List;

public interface ReserveService {
	List<RoomVO> reserveAbleSearchRoom(ReserveVO vo) throws Exception;
	
	RoomVO reserveAbleRoomInformation(int vo) throws Exception;
	
	void insertReserve(ReserveVO vo) throws Exception;
	
	ReserveVO lastInsertReserve(String memberId) throws Exception;
	
	List<ReserveVO> reserveList(String memberId) throws Exception;
	
	ReserveVO checkReserveNo(ReserveVO vo) throws Exception;
	
	void reserveCancle(ReserveVO vo) throws Exception;
	
	List<ReserveVO> reserveListAll(ReserveVO vo) throws Exception;
	
	int totalReserve(ReserveVO vo) throws Exception;
	
	void checkIn(int reserveNo) throws Exception;
	
	void checkOut(int reserveNo) throws Exception;
}

