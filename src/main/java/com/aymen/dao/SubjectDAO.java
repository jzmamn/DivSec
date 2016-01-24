package com.aymen.dao;

import java.util.List;

import com.aymen.entity.Subject;

public interface SubjectDAO {

	public void createSubject(Subject subject);

	public void updateSubject(Subject subject);

	public List<Subject> listSubject();

	public List<Subject> listActiveSubject();

	public Subject getSubjectById(int id);

	public void deleteSubject(int id);
}
