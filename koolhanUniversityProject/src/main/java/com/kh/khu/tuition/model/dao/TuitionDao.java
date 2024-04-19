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
	
	public ArrayList<AdminTuitionMake> tuitionMakeForm(SqlSessionTemplate sqlSession, AdminTuitionMake at) {
		return (ArrayList)sqlSession.selectList("tuitionMapper.tuitionMakeForm", at);
	}

}
