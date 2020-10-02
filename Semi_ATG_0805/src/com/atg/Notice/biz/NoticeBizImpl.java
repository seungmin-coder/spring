package com.atg.Notice.biz;

import java.util.List;

import com.atg.Notice.dao.NoticeDao;
import com.atg.Notice.dao.NoticeDaoImpl;
import com.atg.Notice.dto.NoticeDto;

public class NoticeBizImpl implements NoticeBiz {
	
	private NoticeDao dao = new NoticeDaoImpl();
	
	public List<NoticeDto> selectList() {
		return dao.selectList();
	}
	
	public NoticeDto selectOne(int nt_no) {
		return dao.selectOne(nt_no);
	}
	
	public int insert(NoticeDto dto) {
		return dao.insert(dto);
	}
	
	public int update(NoticeDto dto) {
		return dao.update(dto);
	}
	
	public int delete(int nt_no) {
		return dao.delete(nt_no);
	}
	
	public List<NoticeDto> search(String search_op, String search) {
		return dao.search(search_op, search);
	}
	
}
