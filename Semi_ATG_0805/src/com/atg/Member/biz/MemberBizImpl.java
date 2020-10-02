package com.atg.Member.biz;

import java.util.List;

import com.atg.Member.dao.MemberDao;
import com.atg.Member.dao.MemberDaoImpl;
import com.atg.Member.dto.MemberDto;

public class MemberBizImpl implements MemberBiz {
	
	private MemberDao dao = new MemberDaoImpl();
	
	public List<MemberDto> selectList() {
		return dao.selectList();
	}
	
	public MemberDto selectOne(int mb_no) {
		return dao.selectOne(mb_no);
	}
	
	public int update(MemberDto dto) {
		return dao.update(dto);
	}
	
	public List<MemberDto> search(String search_op, String search) {
		return dao.search(search_op, search);
	}

}
