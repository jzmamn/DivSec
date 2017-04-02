package com.aymen.dao;

import java.util.List;

import com.aymen.entity.Instructions;

public interface InstructionDAO {
	public void createInstructions(Instructions inst);

	public void updateInstructions(Instructions inst);

	public List<Instructions> listInstructions();

	public Instructions getInstructionsById(int id);

	public void deleteInstructions(int id);

	public List<Instructions> listInstByRequest(int reqId);
}
