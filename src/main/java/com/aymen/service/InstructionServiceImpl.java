package com.aymen.service;

import com.aymen.component.DateComponent;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aymen.dao.InstructionDAO;
import com.aymen.entity.Instructions;

@Service
@Transactional
public class InstructionServiceImpl implements InstructionService {

	private static final Logger logger = LoggerFactory.getLogger(InstructionServiceImpl.class);

	@Autowired
	private InstructionDAO instDao;
        
        @Autowired
	private DateComponent dateComp;

	@Autowired
	UserCreationService ucs;

	@Override
	public void createSvcInstruction(Instructions inst) {

		// Staff stf = ucs.getSvcStaffById(inst.getInsStfId());

		String strInst = inst.getInsInstruction();
		// strInst = "<br>" + dateInString + "<br> <strong>" + stf.getStfName()
		// + "</strong><br>" + strInst + "<hr/>";
		inst.setInsInstruction(strInst);
		inst.setInsDate(dateComp.getCurrentDate());
		instDao.createInstructions(inst);

	}

	@Override
	public void updateSvcInstruction(Instructions inst) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<Instructions> listSvcInstruction() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Instructions getSvcInstructionById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteSvcInstruction(int id) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<Instructions> listSvcInstByRequest(int reqId) {
		return this.instDao.listInstByRequest(reqId);
	}

//	public Date getCurrentDate() {
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
//		String dateInString = sdf.format(new Date());
//		Date txnDate;
//		try {
//			txnDate = sdf.parse(dateInString);
//			return txnDate;
//		} catch (ParseException e) {
//			e.printStackTrace();
//			return null;
//		}
//
//	}

}
