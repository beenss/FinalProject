package com.helper.study;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SubjectDAO {
	@Autowired
	private SqlSession session;
	public void deletesubject() {
		session.delete("studyMapper.deletesubject");
	}
	public void insertsubject (List<SubjectDTO>list)throws Exception{
		session.insert("studyMapper.insertsubject",list);
	}
	public List<SubjectDTO> selectall()throws Exception{
		return session.selectList("studyMapper.selectall");
	}
}
