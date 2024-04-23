package com.kh.khu.project.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.khu.classroom.model.vo.Course;
import com.kh.khu.common.model.vo.PageInfo;
import com.kh.khu.project.model.vo.Project;
import com.kh.khu.project.model.vo.StudentProject;

@Repository
public class ProjectDao {
	
	public int insertProject(SqlSessionTemplate sqlSession, Project pj) {
		System.out.println("project Dao"+pj);
		return sqlSession.insert("projectMapper.insertProject", pj);
	}
	
	public ArrayList<Project> selectProjectList(SqlSessionTemplate sqlSession, String memberId){
		return (ArrayList)sqlSession.selectList("projectMapeer.selectProjectList", memberId);
		
	}
	
	public int selectProfessorProjectListCount(SqlSessionTemplate sqlSession, String memberId) {
		return sqlSession.selectOne("projectMapper.selectProfessorProjectListCount", memberId);
	}
	
	public ArrayList<Project> selectProfessorProjectList(SqlSessionTemplate sqlSession,PageInfo pi, String memberId ){
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("projectMapper.selectProfessorProjectList", memberId, rowBounds );
	}

	public Project selectProfessorProjectDetail(SqlSessionTemplate sqlSession, int pjNo) {
		return sqlSession.selectOne("projectMapper.selectProfessorProjectDetail",pjNo);
	}
	
	public Project selectProjectNo(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("projectMapper.selectProjectNo");
	}
	
	public ArrayList<Course> selectCourseStudent(SqlSessionTemplate sqlSession, String classNo){
		return (ArrayList)sqlSession.selectList("studentMapper.selectCourseStudent", classNo);
	}
	
	public int insertStuProjectTable(SqlSessionTemplate sqlSession, int sno, String classNo) {
		
		Map<String, Object> parameters = new HashMap();
		parameters.put("sno", sno);
		parameters.put("classNo", classNo);
		
		return sqlSession.insert("projectMapper.insertStuProjectTable", parameters);
	}
	  
	public ArrayList<StudentProject> selectStudentProject(SqlSessionTemplate sqlSession, String classNum, int studentNo) {
		Map<String, Object> parameters = new HashMap();
		parameters.put("classNum", classNum);
		parameters.put("studentNo", studentNo);	
		return (ArrayList)sqlSession.selectList("projectMapper.selectStudentProject", parameters);
	}
	
	public int ingProjectCount(SqlSessionTemplate sqlSession, String classNum, int studentNo) {
		Map<String, Object> parameters = new HashMap();
		parameters.put("classNum", classNum);
		parameters.put("studentNo", studentNo);	
		
		return sqlSession.selectOne("projectMapper.ingProjectCount", parameters);
	}
	
	public int missProjectCount(SqlSessionTemplate sqlSession, String classNum, int studentNo) {
		Map<String, Object> parameters = new HashMap();
		parameters.put("classNum", classNum);
		parameters.put("studentNo", studentNo);	
		
		return sqlSession.selectOne("projectMapper.missProjectCount", parameters);
	}
	
	public int doneProjectCount(SqlSessionTemplate sqlSession, String classNum, int studentNo) {
		Map<String, Object> parameters = new HashMap();
		parameters.put("classNum", classNum);
		parameters.put("studentNo", studentNo);	
		
		return sqlSession.selectOne("projectMapper.doneProjectCount", parameters);
	}
	
	public Project projectViewStudent(SqlSessionTemplate sqlSession, String pjNo) {
		return sqlSession.selectOne("projectMapper.projectViewStudent", pjNo);
	}
	
	public int enrollProjectStudent(SqlSessionTemplate sqlSession, StudentProject sp) {
		System.out.println("pjdAO sp 객체" + sp);
		return sqlSession.update("projectMapper.enrollProjectStudent", sp);
	}
	
	public ArrayList<StudentProject> selectStudentDoneProject (SqlSessionTemplate sqlSession, int studentNo, String classNum){
		Map<String, Object> parameters = new HashMap();
		parameters.put("classNum", classNum);
		parameters.put("studentNo", studentNo);	
		
		return (ArrayList)sqlSession.selectList("projectMapper.selectStudentDoneProject", parameters);
	}
	
	public ArrayList<StudentProject> selectStudentNoneProject (SqlSessionTemplate sqlSession, int studentNo, String classNum){
		Map<String, Object> parameters = new HashMap();
		parameters.put("classNum", classNum);
		parameters.put("studentNo", studentNo);	
		
		return (ArrayList)sqlSession.selectList("projectMapper.selectStudentNoneProject", parameters);
	}
	
	public StudentProject projectFileView(SqlSessionTemplate sqlSession, int studentNo, String classNum, String pjno) {
		Map<String, Object> parameters = new HashMap();
		parameters.put("studentNo", studentNo);	
		parameters.put("classNum", classNum);
		parameters.put("pjno", pjno);
		
		return (StudentProject)sqlSession.selectOne("projectMapper.projectFileView", parameters);
	}
}
