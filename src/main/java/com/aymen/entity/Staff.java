package com.aymen.entity;// default package

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
import javax.persistence.UniqueConstraint;

@Entity
@Table(name = "staff", catalog = "divsec", uniqueConstraints = @UniqueConstraint(columnNames = "stf_user_id"))
public class Staff implements java.io.Serializable {

	private int stfId;
	private Division division;
	private UserCategory userCategory;
	private String stfName;
	private String stfUserId;
	private String stfPassword;
	private String stfEmail;
	private String stfMobile;
	private String stfNote;
	private byte[] stfActive;
	private Set<ProcessStage> processStages = new HashSet<ProcessStage>(0);
	private Set<Request> requests = new HashSet<Request>(0);

	public Staff() {
	}

	public Staff(int stfId, Division division) {
		this.stfId = stfId;
		this.division = division;
	}

	public Staff(int stfId, Division division, UserCategory userCategory,
			String stfName, String stfUserId, String stfPassword,
			String stfEmail, String stfMobile, String stfNote,
			byte[] stfActive, Set<ProcessStage> processStages,
			Set<Request> requests) {
		this.stfId = stfId;
		this.division = division;
		this.userCategory = userCategory;
		this.stfName = stfName;
		this.stfUserId = stfUserId;
		this.stfPassword = stfPassword;
		this.stfEmail = stfEmail;
		this.stfMobile = stfMobile;
		this.stfNote = stfNote;
		this.stfActive = stfActive;
		this.processStages = processStages;
		this.requests = requests;
	}

	@Id
	@Column(name = "stf_id", unique = true, nullable = false)
	public int getStfId() {
		return this.stfId;
	}

	public void setStfId(int stfId) {
		this.stfId = stfId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "stf_dvision_id", nullable = false)
	public Division getDivision() {
		return this.division;
	}

	public void setDivision(Division division) {
		this.division = division;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "stf_category_id")
	public UserCategory getUserCategory() {
		return this.userCategory;
	}

	public void setUserCategory(UserCategory userCategory) {
		this.userCategory = userCategory;
	}

	@Column(name = "stf_name", length = 50)
	public String getStfName() {
		return this.stfName;
	}

	public void setStfName(String stfName) {
		this.stfName = stfName;
	}

	@Column(name = "stf_user_id", unique = true, length = 10)
	public String getStfUserId() {
		return this.stfUserId;
	}

	public void setStfUserId(String stfUserId) {
		this.stfUserId = stfUserId;
	}

	@Column(name = "stf_password", length = 100)
	public String getStfPassword() {
		return this.stfPassword;
	}

	public void setStfPassword(String stfPassword) {
		this.stfPassword = stfPassword;
	}

	@Column(name = "stf_email", length = 100)
	public String getStfEmail() {
		return this.stfEmail;
	}

	public void setStfEmail(String stfEmail) {
		this.stfEmail = stfEmail;
	}

	@Column(name = "stf_mobile", length = 10)
	public String getStfMobile() {
		return this.stfMobile;
	}

	public void setStfMobile(String stfMobile) {
		this.stfMobile = stfMobile;
	}

	@Column(name = "stf_note", length = 100)
	public String getStfNote() {
		return this.stfNote;
	}

	public void setStfNote(String stfNote) {
		this.stfNote = stfNote;
	}

	@Column(name = "stf_active")
	public byte[] getStfActive() {
		return this.stfActive;
	}

	public void setStfActive(byte[] stfActive) {
		this.stfActive = stfActive;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "staff")
	public Set<ProcessStage> getProcessStages() {
		return this.processStages;
	}

	public void setProcessStages(Set<ProcessStage> processStages) {
		this.processStages = processStages;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "staff")
	public Set<Request> getRequests() {
		return this.requests;
	}

	public void setRequests(Set<Request> requests) {
		this.requests = requests;
	}

}
