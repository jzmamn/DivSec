package com.aymen.service;

import java.util.List;

import com.aymen.entity.SubjecStage;

public interface SubjectStageService {
	public void createSvcSbjStg(SubjecStage division);

	public void updateSvcSbjStg(SubjecStage division);

	public List<SubjecStage> listSvcSbjStg();

	public SubjecStage getSvcSbjStgById(int id);

	public void deleteSvcSbjStg(int id);

	public List<SubjecStage> listSvcSbjStgBySbjId(int sbjId);
}
