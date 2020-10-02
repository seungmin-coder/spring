package com.atg.Basket.biz;

import java.util.List;

import com.atg.Basket.dao.BasketDao;
import com.atg.Basket.dao.BasketDaoImpl;
import com.atg.Basket.dto.BasketDto;

public class BasketBizImpl implements BasketBiz {
	
	BasketDao dao = new BasketDaoImpl();

	@Override
	public List<BasketDto> selectList(int mb_no) {
		
		return dao.selectList(mb_no);
	}

	@Override
	public int insert(BasketDto dto) {
		
		return dao.insert(dto);
	}

	@Override
	public int multiDelete(String[] seq) {
		// TODO Auto-generated method stub
		return dao.multiDelete(seq);
	}
	
	
}
