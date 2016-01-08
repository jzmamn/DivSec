package com.aymen.entity;

import javax.persistence.Column;
import javax.persistence.Embeddable;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

@Embeddable
@JsonIdentityInfo(generator = ObjectIdGenerators.None.class, property = "@Id")
public class VwReqBatchCountId implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private Integer reqStatusId;
	private String rsName;
	private long count;

	public VwReqBatchCountId() {
	}

	public VwReqBatchCountId(long count) {
		this.count = count;
	}

	public VwReqBatchCountId(Integer reqStatusId, String rsName, long count) {
		this.reqStatusId = reqStatusId;
		this.rsName = rsName;
		this.count = count;
	}

	@Column(name = "req_status_id")
	public Integer getReqStatusId() {
		return this.reqStatusId;
	}

	public void setReqStatusId(Integer reqStatusId) {
		this.reqStatusId = reqStatusId;
	}

	@Column(name = "rs_name", length = 50)
	public String getRsName() {
		return this.rsName;
	}

	public void setRsName(String rsName) {
		this.rsName = rsName;
	}

	@Column(name = "count", nullable = false)
	public long getCount() {
		return this.count;
	}

	public void setCount(long count) {
		this.count = count;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof VwReqBatchCountId))
			return false;
		VwReqBatchCountId castOther = (VwReqBatchCountId) other;

		return ((this.getReqStatusId() == castOther.getReqStatusId()) || (this.getReqStatusId() != null
				&& castOther.getReqStatusId() != null && this.getReqStatusId().equals(castOther.getReqStatusId())))
				&& ((this.getRsName() == castOther.getRsName()) || (this.getRsName() != null
						&& castOther.getRsName() != null && this.getRsName().equals(castOther.getRsName())))
				&& (this.getCount() == castOther.getCount());
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result + (getReqStatusId() == null ? 0 : this.getReqStatusId().hashCode());
		result = 37 * result + (getRsName() == null ? 0 : this.getRsName().hashCode());
		result = 37 * result + (int) this.getCount();
		return result;
	}

}
