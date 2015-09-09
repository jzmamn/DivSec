// default package
// Generated Sep 1, 2015 10:25:55 AM by Hibernate Tools 4.3.1
package com.aymen.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * ProcessStage generated by hbm2java
 */
@Entity
@Table(name = "process_stage", catalog = "divsec")
public class ProcessStage implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private int rstId;
	private ProcessRequest processRequest;
	private Staff staff;
	private StageStatus stageStatus;
	private Integer rstStgId;
	private Integer rsSequenceNo;
	private Date rstTxnDate;
	private String rstNote;
	private Set<StageLog> stageLogs = new HashSet<StageLog>(0);

	public ProcessStage() {
	}

	public ProcessStage(int rstId, ProcessRequest processRequest, StageStatus stageStatus) {
		this.rstId = rstId;
		this.processRequest = processRequest;
		this.stageStatus = stageStatus;
	}

	public ProcessStage(int rstId, ProcessRequest processRequest, Staff staff, StageStatus stageStatus,
			Integer rstStgId, Integer rsSequenceNo, Date rstTxnDate, String rstNote, Set<StageLog> stageLogs) {
		this.rstId = rstId;
		this.processRequest = processRequest;
		this.staff = staff;
		this.stageStatus = stageStatus;
		this.rstStgId = rstStgId;
		this.rsSequenceNo = rsSequenceNo;
		this.rstTxnDate = rstTxnDate;
		this.rstNote = rstNote;
		this.stageLogs = stageLogs;
	}

	@Id

	@Column(name = "rst_id", unique = true, nullable = false)
	public int getRstId() {
		return this.rstId;
	}

	public void setRstId(int rstId) {
		this.rstId = rstId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "rst_pr_id", nullable = false)
	public ProcessRequest getProcessRequest() {
		return this.processRequest;
	}

	public void setProcessRequest(ProcessRequest processRequest) {
		this.processRequest = processRequest;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "rst_user_id")
	public Staff getStaff() {
		return this.staff;
	}

	public void setStaff(Staff staff) {
		this.staff = staff;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "rst_stage_status_id", nullable = false)
	public StageStatus getStageStatus() {
		return this.stageStatus;
	}

	public void setStageStatus(StageStatus stageStatus) {
		this.stageStatus = stageStatus;
	}

	@Column(name = "rst_stg_id")
	public Integer getRstStgId() {
		return this.rstStgId;
	}

	public void setRstStgId(Integer rstStgId) {
		this.rstStgId = rstStgId;
	}

	@Column(name = "rs_sequence_no")
	public Integer getRsSequenceNo() {
		return this.rsSequenceNo;
	}

	public void setRsSequenceNo(Integer rsSequenceNo) {
		this.rsSequenceNo = rsSequenceNo;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "rst_txn_date", length = 19)
	public Date getRstTxnDate() {
		return this.rstTxnDate;
	}

	public void setRstTxnDate(Date rstTxnDate) {
		this.rstTxnDate = rstTxnDate;
	}

	@Column(name = "rst_note", length = 100)
	public String getRstNote() {
		return this.rstNote;
	}

	public void setRstNote(String rstNote) {
		this.rstNote = rstNote;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "processStage")
	public Set<StageLog> getStageLogs() {
		return this.stageLogs;
	}

	public void setStageLogs(Set<StageLog> stageLogs) {
		this.stageLogs = stageLogs;
	}

}
