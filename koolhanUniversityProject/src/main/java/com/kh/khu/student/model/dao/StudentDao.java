package com.kh.khu.student.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.khu.student.model.vo.Student;

@Repository
public class StudentDao {
	
	public Student loginStudent(SqlSession sqlSession, Student s) {
		return sqlSession.selectOne("studentMapper.loginStudent", s);
	}

	public int insertTakeOff(SqlSessionTemplate sqlSession, Student s) {
		return sqlSession.insert("studentMapper.insertTakeOff", s);
	}
}
