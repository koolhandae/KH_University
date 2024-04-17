package com.kh.khu.classroom.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.khu.classroom.model.vo.Classroom;

@Repository
public class ClassDao {
	
	public int insertClass(SqlSessionTemplate sqlSession, Classroom c) {
		return sqlSession.insert("classMapper.insertClass", c);
	}
	
	public ArrayList<Classroom> classSelect(SqlSessionTemplate sqlSession, String memberId){
		
		return (ArrayList)sqlSession.selectList("classMapper.classSelect",memberId);
	}
}
