package com.aymen.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aymen.dao.SubjectDAO;
import com.aymen.entity.Subject;

@Service
@Transactional
public class SubjectServiceImpl implements SubjectService {

	@Autowired
	private SubjectDAO subjectDAO;

	@Override
	public void createSvcSubject(Subject subject) {
		subjectDAO.createSubject(subject);

	}

	@Override
	public void updateSvcSubject(Subject subject) {
		subjectDAO.updateSubject(subject);
	}

	@Override
	public List<Subject> listSvcSubject() {
		return subjectDAO.listSubject();
	}

	@Override
	public Subject getSvcSubjectById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteSvcSubject(int id) {
		subjectDAO.deleteSubject(id);

	}

	@Override
	public List<Subject> listSvcActiveSubject() {
		return this.subjectDAO.listActiveSubject();
	}

}
