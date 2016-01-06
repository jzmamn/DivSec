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
@Table(name = "request_log", catalog = "divsec")
public class RequestLog implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private Integer rlId;
	private Request request;
	private Date rlTxnDate;
	private Integer rlStatusId;
	private Integer rlUserId;
	private String rlNote;
	private Date rlEntDate;
	private Boolean rlVoid;

	public RequestLog() {
	}

	public RequestLog(Request request, Date rlTxnDate, Integer rlStatusId, Integer rlUserId, String rlNote,
			Date rlEntDate, Boolean rlVoid) {
		this.request = request;
		this.rlTxnDate = rlTxnDate;
		this.rlStatusId = rlStatusId;
		this.rlUserId = rlUserId;
		this.rlNote = rlNote;
		this.rlEntDate = rlEntDate;
		this.rlVoid = rlVoid;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "rl_id", unique = true, nullable = false)
	public Integer getRlId() {
		return this.rlId;
	}

	public void setRlId(Integer rlId) {
		this.rlId = rlId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "rl_pr_id")
	public Request getRequest() {
		return this.request;
	}

	public void setRequest(Request request) {
		this.request = request;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "rl_txn_date", length = 19)
	public Date getRlTxnDate() {
		return this.rlTxnDate;
	}

	public void setRlTxnDate(Date rlTxnDate) {
		this.rlTxnDate = rlTxnDate;
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

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "rl_ent_date", length = 19)
	public Date getRlEntDate() {
		return this.rlEntDate;
	}

	public void setRlEntDate(Date rlEntDate) {
		this.rlEntDate = rlEntDate;
	}

	@Column(name = "rl_void")
	public Boolean getRlVoid() {
		return this.rlVoid;
	}

	public void setRlVoid(Boolean rlVoid) {
		this.rlVoid = rlVoid;
	}

}
