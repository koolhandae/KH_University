package com.kh.khu.student.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.khu.student.model.dao.StudentDao;
import com.kh.khu.student.model.vo.Absence;
import com.kh.khu.student.model.vo.Presence;
import com.kh.khu.student.model.vo.Student;

@Service
public class StudentServiceImpl implements StudentService{

	@Autowired
	private StudentDao sDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public Student loginStudent(Student s) {
//		System.out.println("service" + s);
		return sDao.loginStudent(sqlSession, s);
	}

	@Override
	public int insertTakeOff(Absence a) {
		//System.out.println("service" + a);
		return sDao.insertTakeOff(sqlSession, a);
	}
	
	public Student selectChkStudent(String email) {
		return sDao.selectChkStudent(sqlSession, email);
	}

	@Override
	public int changePwd(String memberId, String encPwd) {
		return sDao.changePwd(sqlSession, memberId, encPwd);
	}

	@Override
	public int selectTakeOff(Absence a) {
		return sDao.selectTakeOff(sqlSession, a);
	}

	@Override
	public int insertReturnSchool(Presence p) {
		return sDao.insertReturnSchool(sqlSession, p);
	}
	
	
	public int insertStudent(Student s) {
		return sDao.insertStudent(sqlSession, s);
	}

	@Override
	public String selectStudentId(Student s) {
		return sDao.selectStudentId(sqlSession, s);
	}


}
