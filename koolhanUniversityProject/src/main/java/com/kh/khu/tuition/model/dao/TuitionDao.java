package com.kh.khu.tuition.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.khu.student.model.vo.Student;
import com.kh.khu.tuition.model.vo.AdminTuitionMake;
import com.kh.khu.tuition.model.vo.Top3Student;
import com.kh.khu.tuition.model.vo.TopStudent;
import com.kh.khu.tuition.model.vo.Tuition;
import com.kh.khu.tuition.model.vo.TuitionStudent;
import com.kh.khu.tuition.model.vo.TuitionStudentMake;

@Repository
public class TuitionDao {
	
	public int insertTuitionPay(SqlSessionTemplate sqlSession, Tuition t) {
		//System.out.println("dao" + t);
		return sqlSession.insert("tuitionMapper.insertTuitionPay", t);
	}
	
	public ArrayList<Tuition> tuitionBillForm(SqlSessionTemplate sqlSession, String studentId){
		//System.out.println(studentId);
		return (ArrayList)sqlSession.selectList("tuitionMapper.tuitionBillForm", studentId);
	}
	
	public ArrayList<AdminTuitionMake> tuitionMakeForm(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("tuitionMapper.tuitionMakeForm");
	}
	
	public int insertTuitionMake(SqlSessionTemplate sqlSession, TuitionStudentMake students) {
		// todo: 화면에서 입력받은 등록금 데이터를 db 에 insert 
		return sqlSession.insert("tuitionMapper.insertTuitionStudents", students);
	}
	
	public AdminTuitionMake latestTution(SqlSessionTemplate sqlSession) {
		// todo: 다음번 등록금 데이터를 정확성있게 가져온다
		AdminTuitionMake tuition = sqlSession.selectOne("tuitionMapper.latestTuition");
		return tuition;
	}

	public void deleteAllTuitionStudent(SqlSessionTemplate sqlSession) {
		// TODO delete table 쿼리를 만든다
		sqlSession.delete("tuitionMapper.deleteTuitionStudent");
	}

	public ArrayList<TuitionStudent> selectAllTuitionStudent(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("tuitionMapper.selectAllTuitionStudent");
	}

	public ArrayList<TopStudent> top3SelectStudent(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("tuitionMapper.topSelectStudent");
	}

}
