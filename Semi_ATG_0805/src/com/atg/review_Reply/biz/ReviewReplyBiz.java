package com.atg.review_Reply.biz;

import java.util.List;
import java.util.Map;

import com.atg.review_Reply.dto.ReviewReplyDto;

public interface ReviewReplyBiz {
	
	// 리스트 전체
	public List<ReviewReplyDto> seleList(int rv_no);
	
	public ReviewReplyDto selectOne(int rv_no);
	
	
	// key value 값으로  댓글 등록하기 
	public int insert(ReviewReplyDto dto);
	
	public ReviewReplyDto selectLastReply(Map<String, String> map);
	
	// 글수정하기 
	public int update(ReviewReplyDto dto);
	
	
	//글 삭제하기 
	public int delete(int rr_no);
	
	//댓글 달기 
	public int answerProc(Map<String, String> param);
	
	public int answerProc(ReviewReplyDto dto);
	

}
