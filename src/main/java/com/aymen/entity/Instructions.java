// default package
// Generated Sep 1, 2015 10:25:55 AM by Hibernate Tools 4.3.1
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

/**
 * Instructions generated by hbm2java
 */
@Entity
@Table(name = "instructions", catalog = "divsec")
public class Instructions implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private Integer insId;
	private ProcessRequest processRequest;
	private String insInstruction;
	private Date insDate;
	private byte[] insIsRead;

	public Instructions() {
	}

	public Instructions(ProcessRequest processRequest, String insInstruction, Date insDate, byte[] insIsRead) {
		this.processRequest = processRequest;
		this.insInstruction = insInstruction;
		this.insDate = insDate;
		this.insIsRead = insIsRead;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "ins_id", unique = true, nullable = false)
	public Integer getInsId() {
		return this.insId;
	}

	public void setInsId(Integer insId) {
		this.insId = insId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ins_pr_id")
	public ProcessRequest getProcessRequest() {
		return this.processRequest;
	}

	public void setProcessRequest(ProcessRequest processRequest) {
		this.processRequest = processRequest;
	}

	@Column(name = "ins_instruction", length = 100)
	public String getInsInstruction() {
		return this.insInstruction;
	}

	public void setInsInstruction(String insInstruction) {
		this.insInstruction = insInstruction;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "ins_date", length = 10)
	public Date getInsDate() {
		return this.insDate;
	}

	public void setInsDate(Date insDate) {
		this.insDate = insDate;
	}

	@Column(name = "ins_is_read")
	public byte[] getInsIsRead() {
		return this.insIsRead;
	}

	public void setInsIsRead(byte[] insIsRead) {
		this.insIsRead = insIsRead;
	}

}
