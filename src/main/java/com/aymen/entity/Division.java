// default package
// Generated Sep 30, 2015 10:10:01 PM by Hibernate Tools 4.3.1
package com.aymen.entity;

import static javax.persistence.GenerationType.IDENTITY;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

@Entity
@Table(name = "division", catalog = "divsec")
@JsonIdentityInfo(generator = ObjectIdGenerators.None.class, property = "@divId")
public class Division implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private Integer divId;
	private String divName;
	private Boolean divActive;
	private Set<Subject> subjects = new HashSet<Subject>(0);
	private Set<Staff> staffs = new HashSet<Staff>(0);
	private Set<Request> requests = new HashSet<Request>(0);

	public Division() {
	}

	public Division(String divName, Boolean divActive, Set<Subject> subjects, Set<Staff> staffs,
			Set<Request> requests) {
		this.divName = divName;
		this.divActive = divActive;
		this.subjects = subjects;
		this.staffs = staffs;
		this.requests = requests;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "div_id", unique = true, nullable = false)
	public Integer getDivId() {
		return this.divId;
	}

	public void setDivId(Integer divId) {
		this.divId = divId;
	}

	@Column(name = "div_name", length = 50)
	public String getDivName() {
		return this.divName;
	}

	public void setDivName(String divName) {
		this.divName = divName;
	}

	@Column(name = "div_active")
	public Boolean getDivActive() {
		return this.divActive;
	}

	public void setDivActive(Boolean divActive) {
		this.divActive = divActive;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "division")
	@JsonIgnore
	public Set<Subject> getSubjects() {
		return this.subjects;
	}

	public void setSubjects(Set<Subject> subjects) {
		this.subjects = subjects;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "division")
	@JsonIgnore
	public Set<Staff> getStaffs() {
		return this.staffs;
	}

	public void setStaffs(Set<Staff> staffs) {
		this.staffs = staffs;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "division")
	@JsonIgnore
	public Set<Request> getRequests() {
		return this.requests;
	}

	public void setRequests(Set<Request> requests) {
		this.requests = requests;
	}

}
