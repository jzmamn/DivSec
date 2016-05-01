// default package
// Generated Sep 30, 2015 10:10:01 PM by Hibernate Tools 4.3.1
package com.aymen.entity;

import static javax.persistence.GenerationType.IDENTITY;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

@Entity
@Table(name = "process_stage", catalog = "divsec")
@JsonIdentityInfo(generator = ObjectIdGenerators.None.class, property = "@rstId")
public class ProcessStage implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private Integer rstId;
	private Request request;
	private Staff staff;
	private StageStatus stageStatus;
	private SubjecStage subjecStage;
	private Integer rsSequenceNo;
	private Date rstTxnDate;
	private String rstNote;
	private Set<StageLog> stageLogs = new HashSet<StageLog>(0);

	public ProcessStage() {
	}

	public ProcessStage(Request request, StageStatus stageStatus) {
		this.request = request;
		this.stageStatus = stageStatus;
	}

	public ProcessStage(Request request, Staff staff, StageStatus stageStatus, SubjecStage subjecStage,
			Integer rstStgId, Integer rsSequenceNo, Date rstTxnDate, String rstNote, Set<StageLog> stageLogs) {
		this.request = request;
		this.staff = staff;
		this.stageStatus = stageStatus;
		this.subjecStage = subjecStage;

		this.rsSequenceNo = rsSequenceNo;
		this.rstTxnDate = rstTxnDate;
		this.rstNote = rstNote;
		this.stageLogs = stageLogs;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "rst_id", unique = true, nullable = false)
	public Integer getRstId() {
		return this.rstId;
	}

	public void setRstId(Integer rstId) {
		this.rstId = rstId;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "rst_pr_id", nullable = false)
	public Request getRequest() {
		return this.request;
	}

	public void setRequest(Request request) {
		this.request = request;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "rst_user_id")
	public Staff getStaff() {
		return this.staff;
	}

	public void setStaff(Staff staff) {
		this.staff = staff;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "rst_stage_status_id", nullable = false)
	public StageStatus getStageStatus() {
		return this.stageStatus;
	}

	public void setStageStatus(StageStatus stageStatus) {
		this.stageStatus = stageStatus;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "rst_stg_id")
	public SubjecStage getSubjecStage() {
		return this.subjecStage;
	}

	public void setSubjecStage(SubjecStage subjecStage) {
		this.subjecStage = subjecStage;
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
	@JsonIgnore
	public Set<StageLog> getStageLogs() {
		return this.stageLogs;
	}

	public void setStageLogs(Set<StageLog> stageLogs) {
		this.stageLogs = stageLogs;
	}

}