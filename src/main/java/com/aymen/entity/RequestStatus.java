// default package
// Generated Sep 30, 2015 10:10:01 PM by Hibernate Tools 4.3.1
package com.aymen.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

@Entity
@Table(name = "request_status", catalog = "divsec")
@JsonIdentityInfo(generator = ObjectIdGenerators.None.class, property = "@rsId")
public class RequestStatus implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private int rsId;
	private String rsName;
	private Boolean rsActive;
	private Set<ProcessRequest> processRequests = new HashSet<ProcessRequest>(0);

	public RequestStatus() {
	}

	public RequestStatus(int rsId) {
		this.rsId = rsId;
	}

	public RequestStatus(int rsId, String rsName, Boolean rsActive, Set<ProcessRequest> processRequests) {
		this.rsId = rsId;
		this.rsName = rsName;
		this.rsActive = rsActive;
		this.processRequests = processRequests;
	}

	@Id

	@Column(name = "rs_id", unique = true, nullable = false)
	public int getRsId() {
		return this.rsId;
	}

	public void setRsId(int rsId) {
		this.rsId = rsId;
	}

	@Column(name = "rs_name", length = 50)
	public String getRsName() {
		return this.rsName;
	}

	public void setRsName(String rsName) {
		this.rsName = rsName;
	}

	@Column(name = "rs_active")
	public Boolean getRsActive() {
		return this.rsActive;
	}

	public void setRsActive(Boolean rsActive) {
		this.rsActive = rsActive;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "requestStatus")
	@JsonIgnore
	public Set<ProcessRequest> getProcessRequests() {
		return this.processRequests;
	}

	public void setProcessRequests(Set<ProcessRequest> processRequests) {
		this.processRequests = processRequests;
	}

}
