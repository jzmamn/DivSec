package com.aymen.service;

import java.util.List;

import com.aymen.entity.ProcessStage;
import com.aymen.entity.Staff;

public interface ProcessStageService {

    public void createSvcReqStg(ProcessStage processStg);

    public void updateSvcReqStg(ProcessStage processStg);

    public List<ProcessStage> listSvcReqStg();

    public ProcessStage getSvcReqStgById(int id);

    public void deleteSvcReqStg(int id);

    public List<ProcessStage> listSvcReqStgByReqId(int reqId);

    public void updateSvcStageStatus(int reqStageId, int reqStgStsId, String note, Staff staff);

    // For Request Report
    public List<Object> filterSvcRequestStage(int rqId, int sbId, int pbId, int dvId, int stsId, int staffid,
            String fromDate, String toDate);

    public List<Object> filterSvcAllRequestStage();

    public List<Object> getSvcRequestStageTrail(int reqId, int staffId, String fromDate, String toDate);

}
