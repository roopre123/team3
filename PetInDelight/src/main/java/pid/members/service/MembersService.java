package pid.members.service;

import java.util.List;

public interface MembersService {
	
	int memberId_check(String memberId) throws Exception;
	
	int memberNickname_check(String memberNickname) throws Exception;
	
	int memberNickname_check2(MembersVO membersVo) throws Exception;
	
	int memberTelNumber_check(String memberTelNumber) throws Exception;

	void signUpMember(MembersVO membersVo) throws Exception;
	
	int loginMember(MembersVO membersVo) throws Exception;
	
	MembersVO selectMember(String memberId) throws Exception;	
	
	void modifyMemberPassword(MembersVO membersVo) throws Exception;
	
	void modifyMemberNickname(MembersVO membersVo) throws Exception;
	
	void modifyMemberTelNumber(MembersVO membersVo) throws Exception;
	
	int unSignUpMember_check(MembersVO membersVo) throws Exception;
	
	void unSignUpMember(String memberId) throws Exception;
	
	String memberNickname(String memberId) throws Exception;
	
	String memberTelNumber(String memberId) throws Exception;
	
	String memberGrade(String memberId) throws Exception;
	
	String findMemberId(MembersVO membersVo) throws Exception;
	
	void findMemberPassword1(MembersVO membersVo) throws Exception;
	
	int findMemberPassword2(MembersVO membersVo) throws Exception;
	
	MembersVO selectMemberId(int memberId) throws Exception;
	
	List<MembersVO> selectMembers(MembersVO membersVo) throws Exception;
	
	void modifyMemberGrade(MembersVO membersVo) throws Exception;
	
	int totalMembers(MembersVO membersVo) throws Exception;
}
