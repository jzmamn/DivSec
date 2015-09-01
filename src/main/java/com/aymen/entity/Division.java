// default package
// Generated Sep 1, 2015 10:25:55 AM by Hibernate Tools 4.3.1
package com.aymen.entity;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "division", catalog = "divsec")
public class Division implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private Integer divId;
	private String divName;
	private boolean divActive;
	private Set<Staff> staffs = new HashSet<Staff>(0);
	private Set<Request> requests = new HashSet<Request>(0);

	public Division() {
	}

	public Division(String divName, boolean divActive, Set<Staff> staffs, Set<Request> requests) {
		this.divName = divName;
		this.divActive = divActive;
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
	public boolean getDivActive() {
		return this.divActive;
	}

	public void setDivActive(boolean divActive) {
		this.divActive = divActive;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "division")
	public Set<Staff> getStaffs() {
		return this.staffs;
	}

	public void setStaffs(Set<Staff> staffs) {
		this.staffs = staffs;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "division")
	public Set<Request> getRequests() {
		return this.requests;
	}

	public void setRequests(Set<Request> requests) {
		this.requests = requests;
	}

}
