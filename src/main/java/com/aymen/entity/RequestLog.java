// default package
// Generated Aug 28, 2015 10:08:05 PM by Hibernate Tools 4.3.1
package com.aymen.entity;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * RequestLog generated by hbm2java
 */
@Entity
@Table(name = "request_log", catalog = "divsec")
public class RequestLog implements java.io.Serializable {

	private int rlId;
	private ProcessRequest processRequest;
	private Date rlTxnDate;
	private Integer rlDivisionId;
	private Integer rlStatusId;
	private Integer rlUserId;
	private String rlNote;

	public RequestLog() {
	}

	public RequestLog(int rlId) {
		this.rlId = rlId;
	}

	public RequestLog(int rlId, ProcessRequest processRequest, Date rlTxnDate,
			Integer rlDivisionId, Integer rlStatusId, Integer rlUserId,
			String rlNote) {
		this.rlId = rlId;
		this.processRequest = processRequest;
		this.rlTxnDate = rlTxnDate;
		this.rlDivisionId = rlDivisionId;
		this.rlStatusId = rlStatusId;
		this.rlUserId = rlUserId;
		this.rlNote = rlNote;
	}

	@Id
	@Column(name = "rl_id", unique = true, nullable = false)
	public int getRlId() {
		return this.rlId;
	}

	public void setRlId(int rlId) {
		this.rlId = rlId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "rl_pr_id")
	public ProcessRequest getProcessRequest() {
		return this.processRequest;
	}

	public void setProcessRequest(ProcessRequest processRequest) {
		this.processRequest = processRequest;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "rl_txn_date", length = 19)
	public Date getRlTxnDate() {
		return this.rlTxnDate;
	}

	public void setRlTxnDate(Date rlTxnDate) {
		this.rlTxnDate = rlTxnDate;
	}

	@Column(name = "rl_division_id")
	public Integer getRlDivisionId() {
		return this.rlDivisionId;
	}

	public void setRlDivisionId(Integer rlDivisionId) {
		this.rlDivisionId = rlDivisionId;
	}

	@Column(name = "rl_status_id")
	public Integer getRlStatusId() {
		return this.rlStatusId;
	}

	public void setRlStatusId(Integer rlStatusId) {
		this.rlStatusId = rlStatusId;
	}

	@Column(name = "rl_user_id")
	public Integer getRlUserId() {
		return this.rlUserId;
	}

	public void setRlUserId(Integer rlUserId) {
		this.rlUserId = rlUserId;
	}

	@Column(name = "rl_note", length = 100)
	public String getRlNote() {
		return this.rlNote;
	}

	public void setRlNote(String rlNote) {
		this.rlNote = rlNote;
	}

}
