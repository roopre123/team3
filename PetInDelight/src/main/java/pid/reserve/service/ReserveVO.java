package pid.reserve.service;

import java.util.Date;

import lombok.Data;

@Data
public class ReserveVO {
	
	private int reserveNo;
	
	private int roomNo;
	private Date reserveStartDate;
	private Date reserveEndDate;
	private int count;
	
	private String memberId;
	private String reserveType;
	private int price;	
	private String reqContent;
	
	private String searchCondition;
	private String searchKeyword;
	
}
