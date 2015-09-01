// default package
// Generated Sep 1, 2015 10:25:55 AM by Hibernate Tools 4.3.1
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
 * Aproval generated by hbm2java
 */
@Entity
@Table(name = "aproval", catalog = "divsec")
public class Aproval implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int appId;
	private Request request;
	private byte[] appIsApproved;
	private Date appDate;
	private Date appEntDate;
	private String appUserId;

	public Aproval() {
	}

	public Aproval(int appId, Request request) {
		this.appId = appId;
		this.request = request;
	}

	public Aproval(int appId, Request request, byte[] appIsApproved, Date appDate, Date appEntDate, String appUserId) {
		this.appId = appId;
		this.request = request;
		this.appIsApproved = appIsApproved;
		this.appDate = appDate;
		this.appEntDate = appEntDate;
		this.appUserId = appUserId;
	}

	@Id

	@Column(name = "app_id", unique = true, nullable = false)
	public int getAppId() {
		return this.appId;
	}

	public void setAppId(int appId) {
		this.appId = appId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "app_request_id", nullable = false)
	public Request getRequest() {
		return this.request;
	}

	public void setRequest(Request request) {
		this.request = request;
	}

	@Column(name = "app_is_approved")
	public byte[] getAppIsApproved() {
		return this.appIsApproved;
	}

	public void setAppIsApproved(byte[] appIsApproved) {
		this.appIsApproved = appIsApproved;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "app_date", length = 19)
	public Date getAppDate() {
		return this.appDate;
	}

	public void setAppDate(Date appDate) {
		this.appDate = appDate;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "app_ent_date", length = 19)
	public Date getAppEntDate() {
		return this.appEntDate;
	}

	public void setAppEntDate(Date appEntDate) {
		this.appEntDate = appEntDate;
	}

	@Column(name = "app_user_id", length = 45)
	public String getAppUserId() {
		return this.appUserId;
	}

	public void setAppUserId(String appUserId) {
		this.appUserId = appUserId;
	}

}
