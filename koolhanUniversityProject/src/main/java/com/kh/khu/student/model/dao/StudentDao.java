package com.kh.khu.student.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.khu.student.model.vo.Student;

@Repository
public class StudentDao {
	
	public Student loginStudent(SqlSession sqlSession, Student s) {
		System.out.println("dao" + s);
		return sqlSession.selectOne("studentMapper.loginStudent", s);
	}
}
