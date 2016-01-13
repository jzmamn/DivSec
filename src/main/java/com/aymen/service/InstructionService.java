package com.aymen.service;

import java.util.List;

import com.aymen.entity.Instructions;

public interface InstructionService {
	public void createSvcInstruction(Instructions inst);

	public void updateSvcInstruction(Instructions inst);

	public List<Instructions> listSvcInstruction();

	public Instructions getSvcInstructionById(int id);

	public void deleteSvcInstruction(int id);

	public List<Instructions> listSvcInstByRequest(int reqId);
}
