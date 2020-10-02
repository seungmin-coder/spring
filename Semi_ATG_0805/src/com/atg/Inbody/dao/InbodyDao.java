package com.atg.Inbody.dao;

import java.util.List;

import com.atg.Inbody.dto.InbodyDto;

public interface InbodyDao {

	public List<InbodyDto> selectList(int mb_no);
}
