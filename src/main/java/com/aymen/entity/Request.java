// default package
// Generated Sep 30, 2015 10:10:01 PM by Hibernate Tools 4.3.1
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

/**
 * Request generated by hbm2java
 */
@Entity
@Table(name = "request", catalog = "divsec")
public class Request implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer reqId;
	private Division division;
	private PublicIndividual publicIndividual;
	private Staff staff;
	private Subject subject;
	private Date reqEntDate;
	private String reqNote;
	private BigDecimal reqFees;
	private Boolean reqToBeApproved;
	private Set<Aproval> aprovals = new HashSet<Aproval>(0);
	private Set<ProcessRequest> processRequests = new HashSet<ProcessRequest>(0);

	public Request() {
	}

	public Request(Division division, PublicIndividual publicIndividual, Staff staff, Subject subject, Date reqEntDate,
			String reqNote, BigDecimal reqFees, Boolean reqToBeApproved, Set<Aproval> aprovals,
			Set<ProcessRequest> processRequests) {
		this.division = division;
		this.publicIndividual = publicIndividual;
		this.staff = staff;
		this.subject = subject;
		this.reqEntDate = reqEntDate;
		this.reqNote = reqNote;
		this.reqFees = reqFees;
		this.reqToBeApproved = reqToBeApproved;
		this.aprovals = aprovals;
		this.processRequests = processRequests;
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

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "req_division_id")
	public Division getDivision() {
		return this.division;
	}

	public void setDivision(Division division) {
		this.division = division;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "req_public_id")
	public PublicIndividual getPublicIndividual() {
		return this.publicIndividual;
	}

	public void setPublicIndividual(PublicIndividual publicIndividual) {
		this.publicIndividual = publicIndividual;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "req_user_id")
	public Staff getStaff() {
		return this.staff;
	}

	public void setStaff(Staff staff) {
		this.staff = staff;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "req_subject_id")
	public Subject getSubject() {
		return this.subject;
	}

	public void setSubject(Subject subject) {
		this.subject = subject;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "req_ent_date", length = 19)
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

	@Column(name = "req_to_be_approved")
	public Boolean getReqToBeApproved() {
		return this.reqToBeApproved;
	}

	public void setReqToBeApproved(Boolean reqToBeApproved) {
		this.reqToBeApproved = reqToBeApproved;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "request")
	public Set<Aproval> getAprovals() {
		return this.aprovals;
	}

	public void setAprovals(Set<Aproval> aprovals) {
		this.aprovals = aprovals;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "request")
	public Set<ProcessRequest> getProcessRequests() {
		return this.processRequests;
	}

	public void setProcessRequests(Set<ProcessRequest> processRequests) {
		this.processRequests = processRequests;
	}

}
