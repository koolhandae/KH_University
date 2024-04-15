package com.kh.khu.classroom.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.khu.classroom.model.vo.Classroom;

@Repository
public class ClassDao {
	
	public int insertClass(SqlSessionTemplate sqlSession, Classroom c) {
		return sqlSession.insert("classMapper.insertClass", c);
	}

}
