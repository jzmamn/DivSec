package com.aymen.dao;

import com.aymen.entity.Aproval;
import com.aymen.entity.EmailLog;
import java.util.List;

import com.aymen.entity.Request;
import com.aymen.entity.SmsLog;
import com.aymen.entity.Staff;
import java.util.Date;

public interface RequestDAO {

    public void createRequest(Request req);

    public void updateRequest(Request req);

    public List<Request> listSvcRequest();

    public List<Request> listSvcRequestByDivision(int divId);

    public Request getRequestById(int id);

    public void deleteRequest(int id);

    public Request getLastRequest();

    public void updateRequestStatus(int reqId, int statusId, boolean isVoid, String note,Staff staff);

    public List<Object> listBatchCount();

    public List<Object> listBatchCountByDivision(int divId);

    public List<Request> getReqByStatus(int statusId);

    public List<Request> getReqByStatusByDivision(int statusId, int divId);

    public Aproval getApprovalByRequestId(Request req);

    // Save Approvals
    public void saveApprovals(Aproval approval);

    // Update Approvals
    public void updateApprovals(Aproval approval);

    //Update Printed approvals
    public void updatePrintedApprovals();

    //Print Approvals 
    public List<Object> printApproval();

    // Undo/Redo printed approvals list
    public List<Object> listUndoPrinted();

    //Undo/Redo the printed approvals
    public void undoPrinted(Aproval approval);

    // SMS Area
    public List<Object> getSMSContent(int reqId);

    // SMS BULK Area
    public List<Object> getBulkSMSContent();

    //Save SMS Log
    public void SaveSMSLog(SmsLog smsLog);

    //Get SMS log
    public List<Object> listSMSLog();

    //Email Bulik Area
    public List<Object> getBulkEmailContent();

    //Save Email Log
    public void SaveEmailLog(EmailLog emailLog);
    
    //Get Email Log
     public List<Object> listEmailLog();


    // For Request Reports
    public List<Request> filterAllRequest();

    public List<Request> filterRequest(int reqId, int sbjId, int pubId, int divId, int statusId, int staffId,
            String fromDate, String toDate);

    public List<Object> getRequestTrail(int reqId, int sbjId, int pubId, int divId, int statusId, int staffId,
            String fromDate, String toDate);

    public List<Object> getOverDueRequests(int reqId, String fromDate, String toDate);

    public List<Object> getReminderRequests(int reqId, String fromDate, String toDate);

    public List<Object> getDivPeriodStatus(int divId, int month, int year);

}
