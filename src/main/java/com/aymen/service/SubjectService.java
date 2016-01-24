package com.aymen.service;

import java.util.List;

import com.aymen.entity.Subject;

public interface SubjectService {

	public void createSvcSubject(Subject subject);

	public void updateSvcSubject(Subject subject);

	public List<Subject> listSvcSubject();

	public List<Subject> listSvcActiveSubject();

	public Subject getSvcSubjectById(int id);

	public void deleteSvcSubject(int id);
}
