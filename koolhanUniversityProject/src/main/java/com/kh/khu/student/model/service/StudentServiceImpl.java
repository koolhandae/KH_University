package com.kh.khu.student.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.khu.classroom.model.vo.ClassNotice;
import com.kh.khu.classroom.model.vo.Classroom;
import com.kh.khu.classroom.model.vo.Course;
import com.kh.khu.common.model.vo.PageInfo;
import com.kh.khu.student.model.dao.StudentDao;
import com.kh.khu.student.model.vo.Absence;
import com.kh.khu.student.model.vo.AbsenceStudent;
import com.kh.khu.student.model.vo.AbsenceStudentResult;
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

//	@Override
//	public int insertTakeOff(Absence a) {
//		return sDao.insertTakeOff(sqlSession, a);
//	}

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
	
	/* 학생 수강 강의 세부 조회 (공지사항 리스트)*/
	@Override
	public ArrayList<ClassNotice> selectClassNoticeList(PageInfo pi, String classNum) {
		return sDao.selectClassNoticeList(sqlSession, pi, classNum);
	}
	
	/* 학생 수강 강의 세부 조회 (공지사항 디테일 조회수)*/
	@Override
	public int increaseCount(String cno) {
		return sDao.increaseCount(sqlSession, cno);
	}
	
	/* 학생 수강 강의 세부 조회 (공지사항 디테일뷰)*/
	@Override
	public ClassNotice selectClassNoticeDetail(String cno) {
		return sDao.selectClassNoticeDetail(sqlSession, cno);
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
	public int insertStudent(Student s) {
		return sDao.insertStudent(sqlSession, s);
	}

	@Override
	public String selectStudentId(Student s) {
		return sDao.selectStudentId(sqlSession, s);
	}
	
	// 학생 수강 강의계획서 조회
	@Override
	public Classroom selectCoursePlan(String classNum) {
		return sDao.selectCoursePlan(sqlSession, classNum);
	}

	@Override
	public Course selectClassName(String classNum) {
		return sDao.selectClassName(sqlSession, classNum);
	}

	@Override
	public int verifyEmail(String email) {
		return sDao.verifyEmail(sqlSession, email);
	}

	@Override
	public int updateAddress(Student s) {
		return sDao.updateAddress(sqlSession, s);
	}

	@Override
	public int insertTakeOffStudent(AbsenceStudent s) {
		// 없으면 데이터를 넣을 수 있게 
		// TODO 화면에 입력된 데이터를 데이터베이스에 넣는다
		// 승인: Y, 처리중: I, 반려: N
		s.setTbStatus("I");
		return sDao.insertTakeOffStudent(sqlSession, s);
	}
	
	@Override
	public int insertReturnSchool(Presence p) {
		p.setTbStatus("I");
		return sDao.insertReturnSchool(sqlSession, p);
	}

	@Override
	public int selectTakeOffStudent(String studentId) {
		// DB 테이블에 휴학생 데이터가 있는지 확인한다 
		// 있으면 바로 리턴하고 화면에서 등록버튼을 없앤다 
		AbsenceStudentResult result = sDao.selectTakeOffStudent(sqlSession, studentId);
		if(result == null)
			return 0;
		
		// TODO DB 데이터가 있는지 유무만 확인해서 리턴 데이터 있으면 1, 없으면 0
		return 1;
	}
	
	@Override
	public int selectReturnSchoolStudent(String studentId) {
		// DB 테이블에 복학생 데이터 확인
		Presence result = sDao.selectReturnSchoolStudent(sqlSession, studentId);
		if(result == null)
		return 0;
		
		// TODO DB 데이터가 있는지 유무만 확인해서 리턴 데이터 있으면 1, 없으면 0
		return 1;
	}
	
	@Override
	public ArrayList<Absence> selectTakeOff(String absId) {
		return sDao.selectTakeOff(sqlSession, absId);
	}

	@Override
	public ArrayList<Presence> selectReturnSchool(String preId) {
		return sDao.selectReturnSchool(sqlSession, preId);
	}



	

}
