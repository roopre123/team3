package pid.qnaBoard.service;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReplyQnABoardVO {
	private int replyQnABoardNo;
	private String content;
	private Date wdate;
	private int boardNo;
	private String memberId;
	private String memberNickname;
}
