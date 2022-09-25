package pid.members.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import pid.members.service.MembersDAO;
import pid.members.service.MembersVO;

@Repository("memberDAOMybatis")
public class MembersDAOMybatis extends EgovAbstractMapper implements MembersDAO {

	@Override
	public int memberId_check(String memberId) throws Exception {
		int result = selectOne("memberId_check", memberId);
		return result;
	}

	@Override
	public int memberNickname_check(String memberNickname) throws Exception {
		int result = selectOne("memberNickname_check", memberNickname);
		return result;
	}
	
	@Override
	public int memberNickname_check2(MembersVO membersVo) throws Exception {
		int result = selectOne("memberNickname_check2", membersVo);
		return result;
	}	
	
	@Override
	public int memberTelNumber_check(String memberTelNumber) throws Exception {
		int result = selectOne("memberTelNumber_check", memberTelNumber);
		return result;
	}
	
	@Override
	public void signUpMember(MembersVO membersVo) throws Exception {
		insert("signUpMember", membersVo);
	}
	
	@Override
	public int loginMember(MembersVO membersVo) throws Exception {
		int result = selectOne("loginMember", membersVo);
		return result;
	}

	@Override
	public MembersVO selectMember(String memberId) throws Exception {		
		return selectOne("selectMember", memberId);
	}
	
	
	@Override
	public void modifyMemberPassword(MembersVO membersVo) throws Exception {
		update("modifyMemberPassword", membersVo);
	}
	
	@Override
	public void modifyMemberNickname(MembersVO membersVo) throws Exception {
		update("modifyMemberNickname", membersVo);
	}
	
	@Override
	public void modifyMemberTelNumber(MembersVO membersVo) throws Exception {
		update("modifyMemberTelNumber", membersVo);
	}

	@Override
	public int unSignUpMember_check(MembersVO membersVo) throws Exception {
		int result = selectOne("unSignUpMember_check", membersVo);
		return result;
	}

	@Override
	public void unSignUpMember(String memberId) throws Exception {
		delete("unSignUpMember", memberId);		
	}
		
	@Override
	public String memberNickname(String memberId) throws Exception {
		return selectOne("memberNickname", memberId);
	}
	
	@Override
	public String memberTelNumber(String memberId) throws Exception {
		return selectOne("memberTelNumber", memberId);
	}
	
	@Override
	public String memberGrade(String memberId) throws Exception {		
		return selectOne("memberGrade", memberId);
	}

	@Override
	public String findMemberId(MembersVO membersVo) throws Exception {
		return selectOne("findMemberId", membersVo);
	}
	
	@Override
	public void findMemberPassword1(MembersVO membersVo) throws Exception {
		update("findMemberPassword1", membersVo);		
	}

	@Override
	public int findMemberPassword2(MembersVO membersVo) throws Exception {
		int result = selectOne("findMemberPassword2", membersVo);
		return result;
	}
	
	@Override
	public List<MembersVO> selectMembers(MembersVO membersVo) throws Exception {
		return selectList("selectMembers",membersVo);
	}

	@Override
	public MembersVO selectMemberId(int memberId) throws Exception {
		return selectOne("selectMemberId",memberId);
	}

	@Override
	public void modifyMemberGrade(MembersVO membersVo) throws Exception {
		update("modifyMemberGrade", membersVo);		
	}
	
	public int totalMembers(MembersVO membersVo) throws Exception {
		int result = selectOne("totalMembers", membersVo);
		return result;
	}
}
