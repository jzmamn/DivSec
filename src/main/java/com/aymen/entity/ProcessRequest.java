package com.aymen.entity;

import static javax.persistence.GenerationType.IDENTITY;

import java.math.BigDecimal;
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

@Entity
@Table(name = "process_request", catalog = "divsec")
public class ProcessRequest implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private Integer prId;
	private Request request;
	private RequestStatus requestStatus;
	private Integer prSubjectId;
	private Integer prDivisionId;
	private Integer prUserId;
	private Date prTxnDate;
	private Integer prDuration;
	private String prNote;
	private BigDecimal prCost;
	private Set<Instructions> instructionses = new HashSet<Instructions>(0);

	public ProcessRequest() {
	}

	public ProcessRequest(Request request, RequestStatus requestStatus, Integer prSubjectId, Integer prDivisionId,
			Integer prUserId, Date prTxnDate, Integer prDuration, String prNote, BigDecimal prCost,
			Set<RequestLog> requestLogs, Set<Instructions> instructionses) {
		this.request = request;
		this.requestStatus = requestStatus;
		this.prSubjectId = prSubjectId;
		this.prDivisionId = prDivisionId;
		this.prUserId = prUserId;
		this.prTxnDate = prTxnDate;
		this.prDuration = prDuration;
		this.prNote = prNote;
		this.prCost = prCost;
		this.instructionses = instructionses;
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

	@Column(name = "pr_subject_id")
	public Integer getPrSubjectId() {
		return this.prSubjectId;
	}

	public void setPrSubjectId(Integer prSubjectId) {
		this.prSubjectId = prSubjectId;
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

	@Column(name = "pr_duration")
	public Integer getPrDuration() {
		return this.prDuration;
	}

	public void setPrDuration(Integer prDuration) {
		this.prDuration = prDuration;
	}

	@Column(name = "pr_note", length = 100)
	public String getPrNote() {
		return this.prNote;
	}

	public void setPrNote(String prNote) {
		this.prNote = prNote;
	}

	@Column(name = "pr_cost", precision = 18)
	public BigDecimal getPrCost() {
		return this.prCost;
	}

	public void setPrCost(BigDecimal prCost) {
		this.prCost = prCost;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "processRequest")
	public Set<Instructions> getInstructionses() {
		return this.instructionses;
	}

	public void setInstructionses(Set<Instructions> instructionses) {
		this.instructionses = instructionses;
	}

}
