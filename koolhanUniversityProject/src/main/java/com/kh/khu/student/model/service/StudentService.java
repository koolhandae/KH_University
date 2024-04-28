package com.kh.khu.student.model.service;

import com.kh.khu.student.model.vo.Absence;
import com.kh.khu.student.model.vo.AbsenceStudent;
import com.kh.khu.student.model.vo.Presence;
import java.util.ArrayList;

import com.kh.khu.classroom.model.vo.ClassNotice;
import com.kh.khu.classroom.model.vo.Classroom;
import com.kh.khu.classroom.model.vo.Course;
import com.kh.khu.common.model.vo.PageInfo;
import com.kh.khu.common.model.vo.ProfilePicture;
import com.kh.khu.grade.model.vo.Grade;
import com.kh.khu.student.model.vo.Student;

public interface StudentService {

	Student loginStudent(Student s);

	Student selectChkStudent(String email);

	int changePwd(String userId, String encPwd);

	// 학생용 강의 조회
	ArrayList<Course> selectCourseList(int studentNo);

	// 학생용 강의 조회 검색
	Course searchCourse(String courseValue, String studentNo);

	// 강의 공지사항 게시판 조회
	ArrayList<Course> selectClassName(String classNum);
	int selectListCount(String classNum);

	ArrayList<ClassNotice> selectClassNoticeList(PageInfo pi, String classNum);

	// 강의 강의계획서 게시판 조회
	Course selectClassPlan(int classNum);

	// 강의 세부 공지사항 조회
	int increaseCount(String classNum , String cno);
	ClassNotice selectClassNoticeDetail(String classNum, String cno);
	
	// 이전 수강내역 조회
	ArrayList<Course> selectCourseHistory(int studentNo);

	int insertStudent(Student s);

	String selectStudentId(Student s);
	
	// 학생 수강 강의계획서 조회
	Classroom selectCoursePlan(String classNum);

	int verifyEmail(String email);

	// 학생용 주소 수정
	int updateAddress(Student s);
	
	ArrayList<Absence> selectTakeOff(String absId);
	
	ArrayList<Presence> selectReturnSchool(String preId);
	
	int updatePhone(Student s);
	
	int selectStudentListCount();
	
	int selectStudentListCount(String stStatus);
	
	int selectNameSearchStudentListCount(String studentName);
	
	int selectStatusNameSearchStudentListCount(Student st);

	ArrayList<Student> selectAllStudent(PageInfo pi);

	ArrayList<Student> selectNameSearchAllStudent(PageInfo pi, String studentName);

	ArrayList<Student> selectStatusStudent(PageInfo pi, String stStatus);
	
	ArrayList<Student> selectStatusNameSearchStudent(PageInfo pi, Student st);

	int insertTakeOffStudent(AbsenceStudent s);

	int insertReturnSchool(Presence p);
	
	int selectTakeOffStudent(String studentId);
	
	int selectReturnSchoolStudent(String studentId);

	
	int selectNumberOfStudents(String stStatus);
	
	Classroom classPlanView(String classNum);
	
	int updateProfilePicture(Student s);
	
	int insertProfilePicture(ProfilePicture pp);
	

}
