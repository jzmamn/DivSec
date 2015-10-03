package com.aymen.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aymen.dao.SubjectStageDAO;
import com.aymen.entity.SubjecStage;

@Service
@Transactional
public class SubjectStageServiceImpl implements SubjectStageService {

	@Autowired
	SubjectStageDAO sbjStgDao;

	@Override
	public void createSvcSbjStg(SubjecStage division) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateSvcSbjStg(SubjecStage division) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<SubjecStage> listSvcSbjStg() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public SubjecStage getSvcSbjStgById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteSvcSbjStg(int id) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<SubjecStage> listSvcSbjStgBySbjId(int sbjId) {
		return sbjStgDao.listSbjStgBySbjId(sbjId);
	}

}
