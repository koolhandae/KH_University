package com.kh.khu.student.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.khu.classroom.model.vo.ClassNotice;
import com.kh.khu.classroom.model.vo.Classroom;
import com.kh.khu.classroom.model.vo.Course;
import com.kh.khu.common.model.vo.PageInfo;
import com.kh.khu.common.model.vo.ProfilePicture;
import com.kh.khu.common.template.Pagination;
import com.kh.khu.student.model.vo.Absence;
import com.kh.khu.student.model.vo.AbsenceStudent;
import com.kh.khu.student.model.vo.AbsenceStudentResult;
import com.kh.khu.student.model.vo.Presence;
import com.kh.khu.grade.model.vo.Grade;
import com.kh.khu.member.model.vo.Member;
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
	    
//	    //System.out.println(parameters);
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
	
	
	public int insertTakeOffStudent(SqlSessionTemplate sqlSession, AbsenceStudent a) {
		return sqlSession.insert("studentMapper.insertTakeOff", a);
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
	public int increaseCount(SqlSessionTemplate sqlSession, String classNum, String classNoticeNo) {
		Map<String, String> parameters = new HashMap();
	    parameters.put("classNum", classNum);
	    parameters.put("classNoticeNo", classNoticeNo);
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
	
	public Classroom classPlanView(SqlSessionTemplate sqlSession, String classNum) {
		return sqlSession.selectOne("classMapper.classPlanView", classNum);
	}

	public AbsenceStudentResult selectTakeOffStudent(SqlSessionTemplate sqlSession, String studentId) {
		return sqlSession.selectOne("studentMapper.selectTakeOffStudent", studentId);
	}
	
	public Presence selectReturnSchoolStudent(SqlSessionTemplate sqlSession, String studentId) {
		return sqlSession.selectOne("studentMapper.selectReturnSchoolStudent", studentId);
	}
	
	public ArrayList<Absence> selectTakeOff(SqlSessionTemplate sqlSession, String absId) {
		return (ArrayList)sqlSession.selectList("studentMapper.selectTakeOff", absId);
	}
	
	public ArrayList<Presence> selectReturnSchool(SqlSessionTemplate sqlSession, String preId) {
		return (ArrayList)sqlSession.selectList("studentMapper.selectReturnSchool", preId);
		
	}
	
	public int updatePhone(SqlSessionTemplate sqlSession, Student s) {
		return sqlSession.update("studentMapper.updatePhone", s);
	}
	
	public ArrayList<Student> selectAllStudent(SqlSessionTemplate sqlSession, PageInfo spi){
		return (ArrayList)sqlSession.selectList("studentMapper.selectAllStudent", null, Pagination.getRowBounds(spi));
	}

	public ArrayList<Student> selectNameSearchAllStudent(SqlSessionTemplate sqlSession, PageInfo spi, String studentName){
		return (ArrayList)sqlSession.selectList("studentMapper.selectNameSearchAllStudent", studentName, Pagination.getRowBounds(spi));
	}
	
	public ArrayList<Student> selectStatusStudent(SqlSessionTemplate sqlSession, PageInfo spi, String stStatus){
		return (ArrayList)sqlSession.selectList("studentMapper.selectStatusStudent", stStatus, Pagination.getRowBounds(spi));
	}
	
	public ArrayList<Student> selectStatusNameSearchStudent(SqlSessionTemplate sqlSession, PageInfo spi, Student st){
		return (ArrayList)sqlSession.selectList("studentMapper.selectStatusNameSearchStudent", st, Pagination.getRowBounds(spi));
	}

	public int selectStudentListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("studentMapper.selectStudentListCount");
	}
	
	public int selectStudentListCount(SqlSessionTemplate sqlSession, String stStatus) {
		return sqlSession.selectOne("studentMapper.selectStudentListCountType", stStatus);
	}
	
	public int selectNameSearchStudentListCount(SqlSessionTemplate sqlSession, String studentName) {
		return sqlSession.selectOne("studentMapper.selectNameSearchStudentListCount", studentName);
	}
	
	public int selectStatusNameSearchStudentListCount(SqlSessionTemplate sqlSession, Student st) {
		return sqlSession.selectOne("studentMapper.selectStatusNameSearchStudentListCount", st);
	}
	
	public int selectNumberOfStudent(SqlSessionTemplate sqlSession, String stStatus) {
		return sqlSession.selectOne("studentMapper.selectNumberOfStudent",stStatus);
	}
	
	public int updateProfilePicture(SqlSessionTemplate sqlSession, ProfilePicture pp) {
		return sqlSession.update("studentMapper.updateProfilePicture", pp);
	}
	public int insertProfilePicture(SqlSessionTemplate sqlSession, ProfilePicture pp) {
		return sqlSession.update("studentMapper.insertProfilePicture", pp);
	}

}
