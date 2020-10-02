package com.atg.Inbody.dao;

import java.util.List;

import com.atg.Inbody.db.InbodySqlMapConfig;
import com.atg.Inbody.dto.InbodyDto;
import org.apache.ibatis.session.SqlSession;

public class InbodyDaoImpl extends InbodySqlMapConfig implements InbodyDao {

	private String namespace = "com.atg.Inbody.mapper.";
	@Override
	public List<InbodyDto> selectList(int mb_no) {
	
		SqlSession session = null;
		List<InbodyDto> list = null;
				
		try {
			session = getSqlSessionFactory().openSession();
			list = session.selectList(namespace + "selectList", mb_no);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return list;
	}
	
}
