package com.aymen.entity;

import static javax.persistence.GenerationType.IDENTITY;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "stage_log", catalog = "divsec")
public class StageLog implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private Integer psId;
	private ProcessStage processStage;
	private Integer psStageId;
	private Integer psStatusId;
	private Date psTxnDate;
	private Integer psUserId;
	private String psNote;
	private Date psEntDate;

	public StageLog() {
	}

	public StageLog(ProcessStage processStage, Integer psStageId, Integer psStatusId, Date psTxnDate, Integer psUserId,
			String psNote, Date psEntDate) {
		this.processStage = processStage;
		this.psStageId = psStageId;
		this.psStatusId = psStatusId;
		this.psTxnDate = psTxnDate;
		this.psUserId = psUserId;
		this.psNote = psNote;
		this.psEntDate = psEntDate;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "ps_id", unique = true, nullable = false)
	public Integer getPsId() {
		return this.psId;
	}

	public void setPsId(Integer psId) {
		this.psId = psId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ps_rst_id")
	public ProcessStage getProcessStage() {
		return this.processStage;
	}

	public void setProcessStage(ProcessStage processStage) {
		this.processStage = processStage;
	}

	@Column(name = "ps_stage_id")
	public Integer getPsStageId() {
		return this.psStageId;
	}

	public void setPsStageId(Integer psStageId) {
		this.psStageId = psStageId;
	}

	@Column(name = "ps_status_id")
	public Integer getPsStatusId() {
		return this.psStatusId;
	}

	public void setPsStatusId(Integer psStatusId) {
		this.psStatusId = psStatusId;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "ps_txn_date", length = 19)
	public Date getPsTxnDate() {
		return this.psTxnDate;
	}

	public void setPsTxnDate(Date psTxnDate) {
		this.psTxnDate = psTxnDate;
	}

	@Column(name = "ps_user_id")
	public Integer getPsUserId() {
		return this.psUserId;
	}

	public void setPsUserId(Integer psUserId) {
		this.psUserId = psUserId;
	}

	@Column(name = "ps_note", length = 100)
	public String getPsNote() {
		return this.psNote;
	}

	public void setPsNote(String psNote) {
		this.psNote = psNote;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "ps_ent_date", length = 19)
	public Date getPsEntDate() {
		return this.psEntDate;
	}

	public void setPsEntDate(Date psEntDate) {
		this.psEntDate = psEntDate;
	}

}
