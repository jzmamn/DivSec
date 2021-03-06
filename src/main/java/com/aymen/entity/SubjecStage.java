// default package
// Generated Sep 30, 2015 10:10:01 PM by Hibernate Tools 4.3.1
package com.aymen.entity;

import static javax.persistence.GenerationType.IDENTITY;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

/**
 * SubjecStage generated by hbm2java
 */
@Entity
@Table(name = "subjec_stage", catalog = "divsec")
@JsonIdentityInfo(generator = ObjectIdGenerators.None.class, property = "@stgId")
public class SubjecStage implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private Integer stgId;
	private Subject subject;
	private String stgName;
	private Boolean stgActive;
	private BigDecimal stgCost;

	public SubjecStage() {
	}

	public SubjecStage(Subject subject, String stgName, Boolean stgActive, BigDecimal stgCost) {
		this.subject = subject;
		this.stgName = stgName;
		this.stgActive = stgActive;
		this.stgCost = stgCost;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "stg_id", unique = true, nullable = false)
	public Integer getStgId() {
		return this.stgId;
	}

	public void setStgId(Integer stgId) {
		this.stgId = stgId;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "stg_subject_id")
	public Subject getSubject() {
		return this.subject;
	}

	public void setSubject(Subject subject) {
		this.subject = subject;
	}

	@Column(name = "stg_name", length = 100)
	public String getStgName() {
		return this.stgName;
	}

	public void setStgName(String stgName) {
		this.stgName = stgName;
	}

	@Column(name = "stg_active")
	public Boolean getStgActive() {
		return this.stgActive;
	}

	public void setStgActive(Boolean stgActive) {
		this.stgActive = stgActive;
	}

	@Column(name = "stg_cost", precision = 10)
	public BigDecimal getStgCost() {
		return this.stgCost;
	}

	public void setStgCost(BigDecimal stgCost) {
		this.stgCost = stgCost;
	}

}
