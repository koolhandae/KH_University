package com.kh.khu.student.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.khu.student.model.vo.Absence;
import com.kh.khu.student.model.vo.Presence;
import com.kh.khu.classroom.model.vo.ClassDetail;
import com.kh.khu.classroom.model.vo.ClassNotice;
import com.kh.khu.classroom.model.vo.Classroom;
import com.kh.khu.classroom.model.vo.Course;
import com.kh.khu.common.model.vo.PageInfo;
import com.kh.khu.student.model.vo.Student;

@Repository
public class StudentDao {
	
	/* 학생 로그인 */
	public Student loginStudent(SqlSessionTemplate sqlSession, Student s) {
		// System.out.println("dao" + s);
		return sqlSession.selectOne("studentMapper.loginStudent", s);
	}
	
	/*학생 비밀번호 찾기 메일 유효성*/
	public Student selectChkStudent(SqlSessionTemplate sqlSession, String email) {
		return sqlSession.selectOne("studentMapper.selectChkStudent", email);
	}
	
	/*학생 비밀번호 찾기*/
	public int changePwd(SqlSessionTemplate sqlSession, String memberId, String encPwd) {
		// System.out.println("encPwd : " + encPwd);
		 	Map<String, String> parameters = new HashMap();
		    parameters.put("memberId", memberId);
		    parameters.put("userPwd", encPwd);
		    /*hashmap에선 키값을 mapper에 담아줘야됨!*/
		    return sqlSession.update("studentMapper.changePwd", parameters);
	}
	
	/* 학생 수강 강의 조회*/
	public ArrayList<Course> selectCourseList(SqlSessionTemplate sqlsession, int studentNo){	
		return (ArrayList)sqlsession.selectList("studentMapper.selectCourseList", studentNo);
	}
	
	/* 학생 수강 강의 검색*/
	public Course searchCourse(SqlSessionTemplate sqlSession, String courseValue, String studentNo) {
		Map<String, String> parameters = new HashMap();
	    parameters.put("courseValue", courseValue);
	    parameters.put("studentNo", studentNo);
	    
	    System.out.println(parameters);
		return sqlSession.selectOne("studentMapper.searchCourse", parameters);
	}
	
	/* 학생 수강 강의 세부 조회 (공지사항) 개수*/
	public int selectListCount(SqlSessionTemplate sqlSession, String classNum) {
		//System.out.println("DaoclassNum = " + classNum);
		return sqlSession.selectOne("classMapper.selectListCount", classNum);
	}
	
	/* 학생 수강 강의 세부 조회 (공지사항 리스트)*/
	public ArrayList<ClassNotice> selectClassNoticeList(SqlSessionTemplate sqlSession, PageInfo pi, String classNum){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); 
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("classMapper.selectClassNoticeList", classNum, rowBounds);
	}
	
	public int selectTakeOff(SqlSessionTemplate sqlSession, Absence a) {
		return sqlSession.selectOne("studentMapper.selectTakeOff", a);
	}
	
	public int insertReturnSchool(SqlSessionTemplate sqlSession, Presence p) {
		return sqlSession.insert("studentMapper.insertReturnSchool", p);
	}

	public int insertStudent(SqlSessionTemplate sqlSession, Student s) {
		return sqlSession.insert("studentMapper.insertStudent", s);
	}
	
	public String selectStudentId(SqlSessionTemplate sqlSession, Student s) {
		return sqlSession.selectOne("studentMapper.selectStudentId", s);
	}
	public int verifyEmail(SqlSessionTemplate sqlSession, String email) {
		return sqlSession.selectOne("studentMapper.verifyEmail", email);
	}
	
	public int updateAddress(SqlSessionTemplate sqlSession, Student s) {
		return sqlSession.update("studentMapper.updateAddress", s);
	}
	
	/* 학생 수강 강의 세부 조회 (공지사항 디테일 조회수)*/
	public int increaseCount(SqlSessionTemplate sqlSession, String classNum, String cno) {
		Map<String, String> parameters = new HashMap();
	    parameters.put("classNum", classNum);
	    parameters.put("cno", cno);
		return sqlSession.update("classMapper.increaseCount", parameters);
	}
	
	/* 학생 수강 강의 세부 조회 (공지사항 디테일뷰)*/
	public ClassNotice selectClassNoticeDetail(SqlSessionTemplate sqlSession, String classNum, String cno) {
		
		Map<String, Object> parameters = new HashMap();
		parameters.put("classNum", classNum);
		parameters.put("cno", cno);
		
		return sqlSession.selectOne("classMapper.selectClassNoticeDetail", parameters);
	}
	
	/* 학생 수강 강의계획서 조회 */
	public Classroom selectCoursePlan(SqlSessionTemplate sqlSession, String classNum) {
		return sqlSession.selectOne("classMapper.selectCoursePlan", classNum);
	}
	
	public ArrayList<Course> selectClassName(SqlSessionTemplate sqlSession, String classNum) {
		return (ArrayList)sqlSession.selectList("studentMapper.selectClassName", classNum);
	}
	
}
