package com.aymen.entity;

import static javax.persistence.GenerationType.IDENTITY;

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

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

@Entity
@Table(name = "subject", catalog = "divsec")
@JsonIdentityInfo(generator = ObjectIdGenerators.None.class, property = "@sbjId")
public class Subject implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private Integer sbjId;
	private Division division;
	private String sbjCode;
	private String sbjName;
	private Boolean sbjActive;
	private Integer sbjDuration;
	private Double sbjCost;
	private Set<SubjecStage> subjecStages = new HashSet<SubjecStage>(0);
	private Set<Request> requests = new HashSet<Request>(0);

	public Subject() {
	}

	public Subject(Division division, String sbjCode, String sbjName, Boolean sbjActive, Integer sbjDuration,
			Double sbjCost, Set<SubjecStage> subjecStages, Set<Request> requests) {
		this.division = division;
		this.sbjCode = sbjCode;
		this.sbjName = sbjName;
		this.sbjActive = sbjActive;
		this.sbjDuration = sbjDuration;
		this.sbjCost = sbjCost;
		this.subjecStages = subjecStages;
		this.requests = requests;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "sbj_id", unique = true, nullable = false)
	public Integer getSbjId() {
		return this.sbjId;
	}

	public void setSbjId(Integer sbjId) {
		this.sbjId = sbjId;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "sbj_div_id")
	public Division getDivision() {
		return this.division;
	}

	public void setDivision(Division division) {
		this.division = division;
	}

	@Column(name = "sbj_code", length = 50)
	public String getSbjCode() {
		return this.sbjCode;
	}

	public void setSbjCode(String sbjCode) {
		this.sbjCode = sbjCode;
	}

	@Column(name = "sbj_name", length = 50)
	public String getSbjName() {
		return this.sbjName;
	}

	public void setSbjName(String sbjName) {
		this.sbjName = sbjName;
	}

	@Column(name = "sbj_active")
	public Boolean getSbjActive() {
		return this.sbjActive;
	}

	public void setSbjActive(Boolean sbjActive) {
		this.sbjActive = sbjActive;
	}

	@Column(name = "sbj_duration")
	public Integer getSbjDuration() {
		return this.sbjDuration;
	}

	public void setSbjDuration(Integer sbjDuration) {
		this.sbjDuration = sbjDuration;
	}

	@Column(name = "sbj_cost", precision = 18)
	public Double getSbjCost() {
		return this.sbjCost;
	}

	public void setSbjCost(Double sbjCost) {
		this.sbjCost = sbjCost;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "subject")
	@JsonIgnore
	public Set<SubjecStage> getSubjecStages() {
		return this.subjecStages;
	}

	public void setSubjecStages(Set<SubjecStage> subjecStages) {
		this.subjecStages = subjecStages;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "subject")
	@JsonIgnore
	public Set<Request> getRequests() {
		return this.requests;
	}

	public void setRequests(Set<Request> requests) {
		this.requests = requests;
	}

}
