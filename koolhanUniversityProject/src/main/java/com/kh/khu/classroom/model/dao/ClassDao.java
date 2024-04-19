package com.kh.khu.classroom.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.khu.classroom.model.vo.Classroom;
import com.kh.khu.common.model.vo.PageInfo;

@Repository
public class ClassDao {
	
	public int insertClass(SqlSessionTemplate sqlSession, Classroom c) {
		return sqlSession.insert("classMapper.insertClass", c);
	}
	
	public ArrayList<Classroom> classSelect(SqlSessionTemplate sqlSession, String memberId){
		
		return (ArrayList)sqlSession.selectList("classMapper.classSelect",memberId);
	}

	public int selectClassListCount(SqlSessionTemplate sqlSession,String memberId) {
		return sqlSession.selectOne("classMapper.selectClassListCount",memberId);
	}
	
	public ArrayList<Classroom> selectClassList(SqlSessionTemplate sqlSession, PageInfo pi,String memberId){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("classMapper.selectClassList", memberId, rowBounds);
	}

	public Classroom selectClassDetail(SqlSessionTemplate sqlSession, int classNo) {
		return sqlSession.selectOne("classMapper.selectClassDetail",classNo);
	}
	
	public int delectClass(SqlSessionTemplate sqlSession,int classNo) {
		return sqlSession.update("classMapper.delectClass",classNo);
	}
	
	public int professorClassUpdate(SqlSessionTemplate sqlSession, Classroom c ) {
		return sqlSession.update("classMapper.professorClassUpdate", c);
	}
}
