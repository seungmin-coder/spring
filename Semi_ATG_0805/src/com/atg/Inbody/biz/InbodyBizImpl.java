package com.atg.Inbody.biz;

import java.util.List;

import com.atg.Inbody.dao.InbodyDaoImpl;
import com.atg.Inbody.dao.InbodyDao;
import com.atg.Inbody.dto.InbodyDto;

public class InbodyBizImpl implements InbodyBiz {

	InbodyDao dao = new InbodyDaoImpl();
	@Override
	public List<InbodyDto> selectList(int mb_no) {
		
		return dao.selectList(mb_no);
	}

}
