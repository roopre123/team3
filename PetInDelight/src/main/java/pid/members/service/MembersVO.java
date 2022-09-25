package pid.members.service;

import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class MembersVO {
	private String memberId;
	private String memberPassword;
	private String memberCheckPassword;
	private String memberName;
	private String memberNickname;
	private String memberResident;
	private String memberAddress;
	private String memberTelNumber;
	private Date memberSignDate;
	private String memberGrade;
	private String memberRole;
	private String memberEtc;	
	
	private String searchCondition;
	private String searchKeyword;
	
	

	public MembersVO(String memberId, String memberPassword, String memberCheckPassword, String memberName,
			String memberNickname, String memberResident, String memberAddress, String memberTelNumber) {
		super();
		this.memberId = memberId;
		this.memberPassword = memberPassword;
		this.memberCheckPassword = memberCheckPassword;
		this.memberName = memberName;
		this.memberNickname = memberNickname;
		this.memberResident = memberResident;
		this.memberAddress = memberAddress;
		this.memberTelNumber = memberTelNumber;
	}

}
