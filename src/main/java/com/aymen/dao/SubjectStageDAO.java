package com.aymen.dao;

import java.util.List;

import com.aymen.entity.SubjecStage;

public interface SubjectStageDAO {
	public void createSbjStg(SubjecStage division);

	public void updateSbjStg(SubjecStage division);

	public List<SubjecStage> listSbjStg();

	public SubjecStage getSbjStgById(int id);

	public void deleteSbjStg(int id);

	public List<SubjecStage> listSbjStgBySbjId(int sbjId);
}
