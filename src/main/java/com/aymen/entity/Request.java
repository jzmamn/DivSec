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

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

@Entity
@Table(name = "request", catalog = "divsec")
@JsonIdentityInfo(generator = ObjectIdGenerators.None.class, property = "@reqId")
public class Request implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private Integer reqId;
	private Division division;
	private PublicIndividual publicIndividual;
	private RequestStatus requestStatus;
	private Staff staff;
	private Subject subject;
	private Date reqEntDate;
	private String reqNote;
	private BigDecimal reqFees;
	private Integer reqDurartion;
	private Boolean reqIsRead;
	private Boolean reqProcessed;
	private Boolean reqIsVoid;
	private Set<RequestLog> requestLogs = new HashSet<RequestLog>(0);
	private Set<Aproval> aprovals = new HashSet<Aproval>(0);
	private Set<ProcessRequest> processRequests = new HashSet<ProcessRequest>(0);
	private Set<ProcessStage> processStages = new HashSet<ProcessStage>(0);

	public Request() {
	}

	public Request(Division division, PublicIndividual publicIndividual, RequestStatus requestStatus, Staff staff,
			Subject subject, Date reqEntDate, String reqNote, BigDecimal reqFees, Integer reqDurartion,
			Boolean reqIsRead, Boolean reqProcessed, Boolean reqIsVoid, Set<RequestLog> requestLogs,
			Set<Aproval> aprovals, Set<ProcessRequest> processRequests, Set<ProcessStage> processStages) {
		this.division = division;
		this.publicIndividual = publicIndividual;
		this.requestStatus = requestStatus;
		this.staff = staff;
		this.subject = subject;
		this.reqEntDate = reqEntDate;
		this.reqNote = reqNote;
		this.reqFees = reqFees;
		this.reqDurartion = reqDurartion;
		this.reqIsRead = reqIsRead;
		this.reqProcessed = reqProcessed;
		this.reqIsVoid = reqIsVoid;
		this.requestLogs = requestLogs;
		this.aprovals = aprovals;
		this.processRequests = processRequests;
		this.processStages = processStages;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "req_id", unique = true, nullable = false)
	public Integer getReqId() {
		return this.reqId;
	}

	public void setReqId(Integer reqId) {
		this.reqId = reqId;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "req_division_id")
	public Division getDivision() {
		return this.division;
	}

	public void setDivision(Division division) {
		this.division = division;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "req_public_id")
	public PublicIndividual getPublicIndividual() {
		return this.publicIndividual;
	}

	public void setPublicIndividual(PublicIndividual publicIndividual) {
		this.publicIndividual = publicIndividual;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "req_status_id")
	public RequestStatus getRequestStatus() {
		return this.requestStatus;
	}

	public void setRequestStatus(RequestStatus requestStatus) {
		this.requestStatus = requestStatus;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "req_user_id")
	public Staff getStaff() {
		return this.staff;
	}

	public void setStaff(Staff staff) {
		this.staff = staff;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "req_subject_id")
	public Subject getSubject() {
		return this.subject;
	}

	public void setSubject(Subject subject) {
		this.subject = subject;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "req_ent_date", length = 19)
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone = "Asia/Jayapura")
	public Date getReqEntDate() {
		return this.reqEntDate;
	}

	public void setReqEntDate(Date reqEntDate) {
		this.reqEntDate = reqEntDate;
	}

	@Column(name = "req_note", length = 100)
	public String getReqNote() {
		return this.reqNote;
	}

	public void setReqNote(String reqNote) {
		this.reqNote = reqNote;
	}

	@Column(name = "req_fees", precision = 10)
	public BigDecimal getReqFees() {
		return this.reqFees;
	}

	public void setReqFees(BigDecimal reqFees) {
		this.reqFees = reqFees;
	}

	@Column(name = "req_durartion")
	public Integer getReqDurartion() {
		return this.reqDurartion;
	}

	public void setReqDurartion(Integer reqDurartion) {
		this.reqDurartion = reqDurartion;
	}

	@Column(name = "req_is_read")
	public Boolean getReqIsRead() {
		return this.reqIsRead;
	}

	public void setReqIsRead(Boolean reqIsRead) {
		this.reqIsRead = reqIsRead;
	}

	@Column(name = "req_processed")
	public Boolean getReqProcessed() {
		return this.reqProcessed;
	}

	public void setReqProcessed(Boolean reqProcessed) {
		this.reqProcessed = reqProcessed;
	}

	@Column(name = "req_is_void")
	public Boolean getReqIsVoid() {
		return this.reqIsVoid;
	}

	public void setReqIsVoid(Boolean reqIsVoid) {
		this.reqIsVoid = reqIsVoid;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "request")
	@JsonIgnore
	public Set<RequestLog> getRequestLogs() {
		return this.requestLogs;
	}

	public void setRequestLogs(Set<RequestLog> requestLogs) {
		this.requestLogs = requestLogs;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "request")
	@JsonIgnore
	public Set<Aproval> getAprovals() {
		return this.aprovals;
	}

	public void setAprovals(Set<Aproval> aprovals) {
		this.aprovals = aprovals;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "request")
	@JsonIgnore
	public Set<ProcessRequest> getProcessRequests() {
		return this.processRequests;
	}

	public void setProcessRequests(Set<ProcessRequest> processRequests) {
		this.processRequests = processRequests;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "request")
	@JsonIgnore
	public Set<ProcessStage> getProcessStages() {
		return this.processStages;
	}

	public void setProcessStages(Set<ProcessStage> processStages) {
		this.processStages = processStages;
	}

}
