package com.kh.khu.tuition.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.khu.member.model.vo.AdminTuition;
import com.kh.khu.student.model.vo.Student;
import com.kh.khu.tuition.model.dao.TuitionDao;
import com.kh.khu.tuition.model.vo.AdminTuitionMake;
import com.kh.khu.tuition.model.vo.Top3Student;
import com.kh.khu.tuition.model.vo.TopStudent;
import com.kh.khu.tuition.model.vo.Tuition;
import com.kh.khu.tuition.model.vo.TuitionStudent;
import com.kh.khu.tuition.model.vo.TuitionStudentMake;
import com.kh.khu.tuition.model.vo.TuitionStudentMake.TuitionStudentMakeBuilder;

@Service
public class TuitionServiceImpl implements TuitionService{

	@Autowired
	private TuitionDao tDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public int insertTuitionPay(Tuition t) {
		//System.out.println(t);
		return tDao.insertTuitionPay(sqlSession, t);
	}

	
	@Override
	public ArrayList<Tuition> tuitionPayForm(String studentId) {
		return tDao.tuitionPayForm(sqlSession, studentId);
	}
	

	@Override
	public ArrayList<Tuition> tuitionBillForm(String studentId) {
		return tDao.tuitionBillForm(sqlSession, studentId);
	}


	@Override
	public ArrayList<AdminTuitionMake> tuitionMakeForm() {

		return tDao.tuitionMakeForm(sqlSession);
	}


	@Override
	public AdminTuitionMake latestTuition() {
		// 가장 최신의 등록금 데이터를 가져온다 (좀 더 정확성이 필요)
		AdminTuitionMake t = tDao.latestTution(sqlSession);
		return t;
	}


	@Override
	public List<TuitionStudentMake> makeTuitionStudent() {
		// TODO 기존 등록금_학생 데이터 전체를 지운다 
		tDao.deleteAllTuitionStudent(sqlSession);
		
		// TODO 발급해야 하는 고지서를 가져온다 
		AdminTuitionMake at = tDao.latestTution(sqlSession);
		
		// TODO 학생데이터를 가져온다 (상태가 = 재학중) dao 필요
		List<TuitionStudent> students = tDao.selectAllTuitionStudent(sqlSession);
		// TODO 장학금이 반영된 녀석을 찾아서 셋팅해야 한다
		
		List<TuitionStudentMake> studentList = students
				.stream()
				.map(s -> 
					TuitionStudentMake.builder().student(s).tuition(at).build()
				).collect(Collectors.toList());
		
		// TODO 장학금 대상자를 선별하기 위해 다른 개발자가 만든 성적 데이터를 가져온다 
		List<TopStudent> top3 = tDao.top3SelectStudent(sqlSession);
		
		if(top3.size() > 0) {
			// TODO 장학금이 포함된 데이터를 학생 + 등록금 AdminTuitionMake 를 셋팅해서 INSERT 한다 
			int count = 0;
			for(TopStudent top : top3) {
	
				for(TuitionStudentMake s : studentList) {
					// if 찾는다
					if(s.getStudentNo() == top.getStudentNo()) {
						switch(count) {
							case 0: {
								int tuition = s.getTuition();
								s.setScholarShip(tuition);
						
								break;
							}
							case 1: {
								int tuition = s.getTuition();
								int scholarShip = (int)tuition / 2;
								s.setScholarShip(scholarShip);
				
								break;
							}
							case 2: {
								int tuition = s.getTuition();
								int scholarShip = (int) ((int)tuition * 0.3);
								s.setScholarShip(scholarShip);
					
								break;
							}
							default: break;
						}
						count++;
					}	
				}
		
			}
		}


		// TODO 데이터를 insert 시킨다 
		for(TuitionStudentMake tt : studentList) {
			int result = tDao.insertTuitionMake(sqlSession, tt);
		}

		

		// TODO 화면에 보여질 등록금 납부 대상자를 화면에 출력한다 
		return studentList;
		
	}


	@Override
	public ArrayList<Tuition> studentTuition(String studentId) {
		return tDao.studentTuition(sqlSession, studentId);
	}


}
