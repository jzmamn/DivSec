package com.aymen.dao;

import java.util.List;

import com.aymen.entity.SubjecStage;

public interface SubjectStageDAO {
	public void createSbjStg(SubjecStage stg);

	public void updateSbjStg(SubjecStage stg);

	public List<SubjecStage> listSbjStg();

	public SubjecStage getSbjStgById(int id);

	public void deleteSbjStg(int id);

	public List<SubjecStage> listSbjStgBySbjId(int sbjId);
}
