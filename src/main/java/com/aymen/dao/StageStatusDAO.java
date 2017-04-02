package com.aymen.dao;

import java.util.List;

import com.aymen.entity.StageStatus;

public interface StageStatusDAO {
	public void createStageStatus(StageStatus stgStatus);

	public void updateStageStatus(StageStatus stgStatus);

	public List<StageStatus> listStageStatus();

	public StageStatus getStageStatusById(int id);

	public void deleteStageStatus(int id);
}
