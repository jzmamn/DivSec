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

/**
 * ProcessRequest generated by hbm2java
 */
@Entity
@Table(name = "process_request", catalog = "divsec")
public class ProcessRequest implements java.io.Serializable {

	private Integer prId;
	private Request request;
	private RequestStatus requestStatus;
	private Integer prDivisionId;
	private Integer prUserId;
	private Date prTxnDate;
	private String prNote;
	private Set<RequestLog> requestLogs = new HashSet<RequestLog>(0);
	private Set<Instructions> instructionses = new HashSet<Instructions>(0);
	private Set<ProcessStage> processStages = new HashSet<ProcessStage>(0);

	public ProcessRequest() {
	}

	public ProcessRequest(Request request, RequestStatus requestStatus, Integer prDivisionId, Integer prUserId,
			Date prTxnDate, String prNote, Set<RequestLog> requestLogs, Set<Instructions> instructionses,
			Set<ProcessStage> processStages) {
		this.request = request;
		this.requestStatus = requestStatus;
		this.prDivisionId = prDivisionId;
		this.prUserId = prUserId;
		this.prTxnDate = prTxnDate;
		this.prNote = prNote;
		this.requestLogs = requestLogs;
		this.instructionses = instructionses;
		this.processStages = processStages;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "pr_id", unique = true, nullable = false)
	public Integer getPrId() {
		return this.prId;
	}

	public void setPrId(Integer prId) {
		this.prId = prId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "pr_request_id")
	public Request getRequest() {
		return this.request;
	}

	public void setRequest(Request request) {
		this.request = request;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "pr_status_id")
	public RequestStatus getRequestStatus() {
		return this.requestStatus;
	}

	public void setRequestStatus(RequestStatus requestStatus) {
		this.requestStatus = requestStatus;
	}

	@Column(name = "pr_division_id")
	public Integer getPrDivisionId() {
		return this.prDivisionId;
	}

	public void setPrDivisionId(Integer prDivisionId) {
		this.prDivisionId = prDivisionId;
	}

	@Column(name = "pr_user_id")
	public Integer getPrUserId() {
		return this.prUserId;
	}

	public void setPrUserId(Integer prUserId) {
		this.prUserId = prUserId;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "pr_txn_date", length = 19)
	public Date getPrTxnDate() {
		return this.prTxnDate;
	}

	public void setPrTxnDate(Date prTxnDate) {
		this.prTxnDate = prTxnDate;
	}

	@Column(name = "pr_note", length = 100)
	public String getPrNote() {
		return this.prNote;
	}

	public void setPrNote(String prNote) {
		this.prNote = prNote;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "processRequest")
	public Set<RequestLog> getRequestLogs() {
		return this.requestLogs;
	}

	public void setRequestLogs(Set<RequestLog> requestLogs) {
		this.requestLogs = requestLogs;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "processRequest")
	public Set<Instructions> getInstructionses() {
		return this.instructionses;
	}

	public void setInstructionses(Set<Instructions> instructionses) {
		this.instructionses = instructionses;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "processRequest")
	public Set<ProcessStage> getProcessStages() {
		return this.processStages;
	}

	public void setProcessStages(Set<ProcessStage> processStages) {
		this.processStages = processStages;
	}

}
