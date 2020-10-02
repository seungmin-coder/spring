package com.atg.review.biz;

import java.util.List;

import com.atg.review.dao.ReviewDao;
import com.atg.review.dao.ReviewDaoImpl;
import com.atg.review.dto.ReviewDto;
import com.atg.review_Reply.dto.ReviewReplyDto;

public class ReviewBizImpl implements ReviewBiz {
	
	private ReviewDao dao = new ReviewDaoImpl();
	
	@Override
	public List<ReviewDto> selectList() {
		return dao.selectList();
	}

	@Override
	public ReviewDto selectOne(int rv_no) {
		return dao.selectOne(rv_no);
	}

	@Override
	public int insert(ReviewDto dto) {
		return dao.insert(dto);
	}

	@Override
	public int update(ReviewDto dto) {
		return dao.update(dto);
	}

	@Override
	public int delete(int rv_no, String mb_id) {
		return dao.delete(rv_no, mb_id);
	}
	
}


	
