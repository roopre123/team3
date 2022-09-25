package pid.members.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import pid.members.service.MembersDAO;
import pid.members.service.MembersService;
import pid.members.service.MembersVO;

@Service("memberService")
public class MembersServiceImpl implements MembersService {
	
	@Resource(name = "memberDAOMybatis")
	private MembersDAO dao;

	@Override
	public int memberId_check(String memberId) throws Exception {
		int result = dao.memberId_check(memberId);
		return result;
	}

	@Override
	public int memberNickname_check(String memberNickname) throws Exception {
		int result = dao.memberNickname_check(memberNickname);
		return result;
	}
	
	@Override
	public int memberNickname_check2(MembersVO membersVo) throws Exception {
		int result = dao.memberNickname_check2(membersVo);
		return result;
	}
	
	@Override
	public int memberTelNumber_check(String memberTelNumber) throws Exception {
		int result = dao.memberTelNumber_check(memberTelNumber);
		return result;
	}

	@Override
	public void signUpMember(MembersVO membersVo) throws Exception {
		dao.signUpMember(membersVo);		
	}
	
	@Override
	public int loginMember(MembersVO membersVo) throws Exception {
		int result = dao.loginMember(membersVo);
		return result;
	}

	@Override
	public MembersVO selectMember(String memberId) throws Exception {		
		return dao.selectMember(memberId);
	}
	
	@Override
	public void modifyMemberPassword(MembersVO membersVo) throws Exception {
		dao.modifyMemberPassword(membersVo);
	}
	
	@Override
	public void modifyMemberNickname(MembersVO membersVo) throws Exception {
		dao.modifyMemberNickname(membersVo); 	
	}
	
	@Override
	public void modifyMemberTelNumber(MembersVO membersVo) throws Exception {
		dao.modifyMemberTelNumber(membersVo);
	}

	@Override
	public int unSignUpMember_check(MembersVO membersVo) throws Exception {
		int result = dao.unSignUpMember_check(membersVo);
		return result;
	}

	@Override
	public void unSignUpMember(String memberId) throws Exception {
		dao.unSignUpMember(memberId);
	}
	
	@Override
	public String memberNickname(String memberId) throws Exception {
		return dao.memberNickname(memberId);
	}
	
	@Override
	public String memberTelNumber(String memberId) throws Exception {
		return dao.memberTelNumber(memberId);
	}
	
	@Override
	public String memberGrade(String memberId) throws Exception {
		return dao.memberGrade(memberId);
	}

	@Override
	public String findMemberId(MembersVO membersVo) throws Exception {
		return dao.findMemberId(membersVo);
	}

	@Override
	public void findMemberPassword1(MembersVO membersVo) throws Exception {
		dao.findMemberPassword1(membersVo);		
	}

	@Override
	public int findMemberPassword2(MembersVO membersVo) throws Exception {
		int result = dao.findMemberPassword2(membersVo);
		return result;
	}	
	
	@Override
	public List<MembersVO> selectMembers(MembersVO membersVo) throws Exception {
		return dao.selectMembers(membersVo);
	}

	@Override
	public MembersVO selectMemberId(int memberId) throws Exception {
		return dao.selectMemberId(memberId);
	}

	@Override
	public void modifyMemberGrade(MembersVO membersVo) throws Exception {
		dao.modifyMemberGrade(membersVo);
	}

	@Override
	public int totalMembers(MembersVO membersVo) throws Exception {
		int result = dao.totalMembers(membersVo);
		return result;
	}
}