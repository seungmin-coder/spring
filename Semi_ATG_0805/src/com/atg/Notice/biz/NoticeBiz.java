package com.atg.Notice.biz;

import java.util.List;

import com.atg.Notice.dto.NoticeDto;

public interface NoticeBiz {
	
	public List<NoticeDto> selectList();
	public NoticeDto selectOne(int nt_no);
	public int insert(NoticeDto dto);
	public int update(NoticeDto dto);
	public int delete(int nt_no);
	public List<NoticeDto> search(String search_op, String search);
	
}
