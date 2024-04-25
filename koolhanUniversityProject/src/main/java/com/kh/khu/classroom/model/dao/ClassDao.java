package com.kh.khu.classroom.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.khu.classroom.model.vo.ClassBoard;
import com.kh.khu.classroom.model.vo.Classroom;
import com.kh.khu.common.model.vo.PageInfo;
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
	
	public int selectBoardListCount(SqlSessionTemplate sqlSession, String classNum) {
		return sqlSession.selectOne("classMapper.selectBoardListCount", classNum);
	}
	
	public ArrayList<ClassBoard> selectClassBoardList(SqlSessionTemplate sqlSession, PageInfo pi ,String classNum){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); 
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("classMapper.selectClassBoardList", classNum, rowBounds);
	}
	
	public int classBoardCount(SqlSessionTemplate sqlSession, String bno, String classNum) {
		Map<String, Object> parameters = new HashMap();
		parameters.put("classNum", classNum);
		parameters.put("bno", bno);
		
		return sqlSession.update("classMapper.classBoardCount", parameters);
	}
	
	public ClassBoard selectClassDetailBoard(SqlSessionTemplate sqlSession, String bno, String classNum) {
		Map<String, Object> parameters = new HashMap();
		parameters.put("classNum", classNum);
		parameters.put("bno", bno);
		
		return sqlSession.selectOne("classMapper.selectClassDetailBoard", parameters);
	}
}


