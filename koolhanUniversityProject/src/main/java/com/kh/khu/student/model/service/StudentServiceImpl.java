package com.kh.khu.student.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.khu.classroom.model.vo.ClassNotice;
import com.kh.khu.classroom.model.vo.Course;
import com.kh.khu.common.model.vo.PageInfo;
import com.kh.khu.student.model.dao.StudentDao;
import com.kh.khu.student.model.vo.Absence;
import com.kh.khu.student.model.vo.Presence;
import com.kh.khu.student.model.vo.Student;

@Service
public class StudentServiceImpl implements StudentService {

	@Autowired
	private StudentDao sDao;
	@Autowired
	private SqlSessionTemplate sqlSession;

	/* 학생 로그인 */
	@Override
	public Student loginStudent(Student s) {
//		System.out.println("service" + s);
		return sDao.loginStudent(sqlSession, s);
	}

	/* 학생 비밀번호 찾기 메일 유효성 */
	@Override
	public Student selectChkStudent(String email) {
		return sDao.selectChkStudent(sqlSession, email);
	}

	@Override
	public int insertTakeOff(Absence a) {
		return sDao.insertTakeOff(sqlSession, a);
	}

	/* 학생 비밀번호 찾기 */
	@Override
	public int changePwd(String memberId, String encPwd) {
		return sDao.changePwd(sqlSession, memberId, encPwd);
	}

	/* 학생 수강 강의 조회 */
	@Override
	public ArrayList<Course> selectCourseList(String studentId) {
		return sDao.selectCourseList(sqlSession, studentId);
	}

	/* 학생 수강 강의 검색 */
	@Override
	public Course searchCourse(String courseValue) {
		return sDao.searchCourse(sqlSession, courseValue);
	}

	/* 학생 수강 강의 세부 조회 (공지사항) 개수 */
	@Override
	public int selectListCount(String classNum) {

		System.out.println("serviceclassNum = " + classNum);
		return sDao.selectListCount(sqlSession, classNum);
	}

	/* 학생 수강 강의 세부 조회 (공지사항) */
	@Override
	public ArrayList<ClassNotice> selectClassNoticeList(PageInfo pi, String classNum) {
		return sDao.selectClassNoticeList(sqlSession, pi, classNum);
	}

	@Override
	public int increaseCount(int classNoticeNo) {
		return 0;
	}

	@Override
	public ClassNotice selectClassNoticeDetail(int classNoticeNo) {
		return null;
	}

	@Override
	public ArrayList<Course> selectCourseHistory(int studentNo) {
		return null;
	}

	@Override
	public Course selectClassPlan(int classNum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectTakeOff(Absence a) {
		return sDao.selectTakeOff(sqlSession, a);
	}

	@Override
	public int insertReturnSchool(Presence p) {
		return sDao.insertReturnSchool(sqlSession, p);
	}
	
	@Override
	public int insertStudent(Student s) {
		return sDao.insertStudent(sqlSession, s);
	}

	@Override
	public String selectStudentId(Student s) {
		return sDao.selectStudentId(sqlSession, s);
	}

	@Override
	public int verifyEmail(String email) {
		return sDao.verifyEmail(sqlSession, email);
	}

	@Override
	public int updateAddress(Student s) {
		return sDao.updateAddress(sqlSession, s);
	}

}
