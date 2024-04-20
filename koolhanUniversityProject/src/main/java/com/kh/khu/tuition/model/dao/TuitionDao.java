package com.kh.khu.tuition.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.khu.tuition.model.vo.AdminTuitionMake;
import com.kh.khu.tuition.model.vo.Tuition;

@Repository
public class TuitionDao {
	
	public int insertTuitionPay(SqlSessionTemplate sqlSession, Tuition t) {
		System.out.println("dao" + t);
		return sqlSession.insert("tuitionMapper.insertTuitionPay", t);
	}
	
	public ArrayList<Tuition> tuitionBillForm(SqlSessionTemplate sqlSession, Tuition t){
		return (ArrayList)sqlSession.selectList("tuitionMapper.tuitionBillForm", t);
	}
	
	public ArrayList<AdminTuitionMake> tuitionMakeForm(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("tuitionMapper.tuitionMakeForm");
	}
	
	public int insertTuitionMake(SqlSessionTemplate sqlSession) {
		// todo: 화면에서 입력받은 등록금 데이터를 db 에 insert 
		return 0;
	}
	
	public AdminTuitionMake latestTution() {
		// todo: 다음번 등록금 데이터를 정확성있게 가져온다
		return null;
	}

	public void deleteAllTuitionStudent() {
		// TODO delete table 쿼리를 만든다
		
	}

}
