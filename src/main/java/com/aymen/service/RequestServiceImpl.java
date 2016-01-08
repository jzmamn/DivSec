package com.aymen.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aymen.dao.ProcessStageDAO;
import com.aymen.dao.RequestDAO;
import com.aymen.dao.SubjectStageDAO;
import com.aymen.entity.ProcessStage;
import com.aymen.entity.Request;
import com.aymen.entity.StageStatus;
import com.aymen.entity.SubjecStage;

@Service
@Transactional
public class RequestServiceImpl implements RequestService {

	@Autowired
	RequestDAO reqDao;

	@Autowired
	SubjectStageDAO sbjStgDao;

	@Autowired
	ProcessStageDAO prcStageDao;

	@Override
	public void createSvcRequest(Request req) {
		req.setReqIsRead(false);
		req.setReqProcessed(false);

		this.reqDao.createRequest(req);

		// Save new Requests
		Request lastRequest = reqDao.getLastRequest();

		// Save stages for new requests
		List<SubjecStage> lstStg = sbjStgDao.listSbjStgBySbjId(lastRequest.getSubject().getSbjId());
		System.out.println("Size of the List" + lstStg.size());

		for (int i = 0; i < lstStg.size(); i++) {
			ProcessStage prcStage = new ProcessStage();
			SubjecStage sbjStage = new SubjecStage();

			StageStatus stgStatus = new StageStatus();

			prcStage.setRequest(lastRequest);
			prcStage.getRequest().setReqId(lastRequest.getReqId());

			prcStage.setSubjecStage(sbjStage);
			prcStage.getSubjecStage().setStgId(lstStg.get(i).getStgId());

			prcStage.setStageStatus(stgStatus);
			prcStage.getStageStatus().setSsId(1);

			prcStage.setRstTxnDate(getCurrentDate());

			prcStage.setRsSequenceNo(i);
			prcStage.setRstNote("");

			prcStage.setStaff(lastRequest.getStaff());
			prcStage.getStaff().setStfId(lastRequest.getStaff().getStfId());

			prcStageDao.createReqStg(prcStage);
		}

	}

	@Override
	public void updateSvcRequest(Request req) {
		this.reqDao.updateRequest(req);
	}

	@Override
	public List<Request> listSvcRequest() {
		return this.reqDao.listSvcRequest();
	}

	@Override
	public Request getSvcRequestById(int id) {
		return this.reqDao.getRequestById(id);
	}

	@Override
	public void deleteSvcRequest(int id) {
		this.deleteSvcRequest(id);
	}

	@Override
	public void updateSvcRequestStatus(int reqId, int statusId, boolean isVoid) {
		this.reqDao.updateRequestStatus(reqId, statusId, isVoid);
	}

	public Date getCurrentDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("dd-M-yyyy hh:mm:ss");
		String dateInString = sdf.format(new Date());
		Date txnDate;
		try {
			txnDate = sdf.parse(dateInString);
			return txnDate;
		} catch (ParseException e) {
			e.printStackTrace();
			return null;
		}

	}

	@Override
	public List<Object> listSvcBatchCount() {
		return this.reqDao.listBatchCount();
	}

	@Override
	public List<Request> getSvcReqByStatus(int statusId) {
		return this.reqDao.getReqByStatus(statusId);
	}

}
