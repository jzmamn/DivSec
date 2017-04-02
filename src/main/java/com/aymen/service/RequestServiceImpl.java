package com.aymen.service;

import com.aymen.component.JsonFormatter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aymen.dao.ProcessStageDAO;
import com.aymen.dao.RequestDAO;
import com.aymen.dao.SubjectStageDAO;
import com.aymen.entity.Aproval;
import com.aymen.entity.EmailLog;
import com.aymen.entity.ProcessStage;
import com.aymen.entity.Request;
import com.aymen.entity.SmsLog;
import com.aymen.entity.Staff;
import com.aymen.entity.StageStatus;
import com.aymen.entity.SubjecStage;

@Service
@Transactional
public class RequestServiceImpl implements RequestService {

    private static final Logger logger = LoggerFactory.getLogger(RequestServiceImpl.class);

    @Autowired
    RequestDAO reqDao;

    @Autowired
    SubjectStageDAO sbjStgDao;

    @Autowired
    ProcessStageDAO prcStageDao;

    @Autowired
    JsonFormatter jsonFormatter;

    @Override
    public void createSvcRequest(Request req) {
        req.setReqIsRead(false);
        req.setReqProcessed(false);

        this.reqDao.createRequest(req);

        // Save new Requests
        Request lastRequest = reqDao.getLastRequest();

        // Save stages for new requests
        List<SubjecStage> lstStg = sbjStgDao.listSbjStgBySbjId(lastRequest.getSubject().getSbjId());
        System.out.println("Size of the List" + lstStg.toString());
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
    public List<Request> listSvcRequestByDivision(int divId) {
        return this.reqDao.listSvcRequestByDivision(divId);
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
    public void updateSvcRequestStatus(int reqId, int statusId, boolean isVoid, String note,Staff staff) {
        this.reqDao.updateRequestStatus(reqId, statusId, isVoid, note,staff);
    }

    public Date getCurrentDate() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
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

    @Override
    public List<Request> getSvcReqByStatusByDivision(int statusId, int divId) {
        return this.reqDao.getReqByStatusByDivision(statusId, divId);
    }

    @Override
    public List<Request> filterRequest(int rqId, int sbId, int pbId, int dvId, int stsId, int staffId, String fromDate,
            String toDate) {
        return this.reqDao.filterRequest(rqId, sbId, pbId, dvId, stsId, staffId, fromDate, toDate);
    }

    @Override
    public List<Request> filterSvcAllRequest() {
        return this.reqDao.filterAllRequest();
    }

    @Override
    public List<Object> getSvcRequestTrail(int rqId, int sbId, int pbId, int dvId, int stsId, int staffId,
            String fromDate, String toDate) {
        return this.reqDao.getRequestTrail(rqId, sbId, pbId, dvId, stsId, staffId, fromDate, toDate);
    }

    @Override
    public List<Object> getSvcOverDueRequests(int reqId, String fromDate, String toDate) {
        return this.reqDao.getOverDueRequests(reqId, fromDate, toDate);
    }

    @Override
    public List<Object> getReminderRequestsSvc(int reqId, String fromDate, String toDate) {
        return this.reqDao.getReminderRequests(reqId, fromDate, toDate);
    }

    @Override
    public List<Object> getDivPeriodStatus(int divId, int month, int year) {
        return this.reqDao.getDivPeriodStatus(divId, month, year);
    }

    @Override
    public List<Object> getSvcSMSContent(int reqId) {
        return this.reqDao.getSMSContent(reqId);
    }

    @Override
    public List<Object> listSvcBatchCountByDivision(int divId) {
        return this.reqDao.listBatchCountByDivision(divId);
    }

    @Override
    public void saveApprovalsSvc(int requestId, int appReqStatus, int appUserId) {
        Request req = getSvcRequestById(requestId);
        Aproval approval = new Aproval();
        approval.setRequest(req);
        approval.setAppDate(getCurrentDate());
        approval.setAppIsPrinted(false);
        approval.setAppReqStatus(appReqStatus);
        approval.setAppPrintedDate(null);
        approval.setAppUserId(appUserId);
        this.reqDao.saveApprovals(approval);

    }

    @Override
    public void updateApprovalsSvc(int requestId, int appReqStatus, int appUserId) {
        Aproval approval = getApprovalByRequestIdSvc(requestId);
        approval.setRequest(getSvcRequestById(requestId));
        approval.setAppDate(getCurrentDate());
        approval.setAppIsPrinted(false);
        approval.setAppReqStatus(appReqStatus);
        approval.setAppUserId(appUserId);
        this.reqDao.saveApprovals(approval);
    }

    @Override
    public Aproval getApprovalByRequestIdSvc(int reqId) {
        Request req = getSvcRequestById(reqId);
        return this.reqDao.getApprovalByRequestId(req);
    }

    @Override
    public List<Object> listUndoPrintedSvc() {
        return this.reqDao.listUndoPrinted();
    }

    @Override
    public void undoPrintedSvc(int requestId, boolean flag, int staffId) {
        Request req = getSvcRequestById(requestId);
        Aproval aproval = reqDao.getApprovalByRequestId(req);
        aproval.setAppIsPrinted(flag);
        aproval.setAppUserId(staffId);
        this.reqDao.undoPrinted(aproval);
    }

    @Override
    public String printApprovalSvc() {
        return jsonFormatter.formatToJSON(this.reqDao.printApproval());
    }

    @Override
    public void updatePrintedApprovalsSvc() {
        this.reqDao.updatePrintedApprovals();
    }

    @Override
    public List<Object> getBulkSMSContentSvc() {
        return this.reqDao.getBulkSMSContent();
    }

    @Override
    public void SaveSMSLogSvc(SmsLog smsLog) {
        reqDao.SaveSMSLog(smsLog);
    }

    @Override
    public List<Object> getBulkEmailContentSvc() {
        return this.reqDao.getBulkEmailContent();
    }

    @Override
    public void SaveEmailLogSvc(EmailLog emailLog) {
        reqDao.SaveEmailLog(emailLog);
    }

    @Override
    public List<Object> listSMSLogSvc() {
        return this.reqDao.listSMSLog();

    }

    @Override
    public List<Object> listEmailLogSvc() {
        return this.reqDao.listEmailLog();
    }

}
