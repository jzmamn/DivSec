// default package
// Generated Aug 28, 2015 10:08:05 PM by Hibernate Tools 4.3.1
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

/**
 * StageStatus generated by hbm2java
 */
@Entity
@Table(name = "stage_status", catalog = "divsec")
public class StageStatus implements java.io.Serializable {

	private Integer ssId;
	private String ssName;
	private byte[] ssActive;
	private Set<ProcessStage> processStages = new HashSet<ProcessStage>(0);

	public StageStatus() {
	}

	public StageStatus(String ssName, byte[] ssActive,
			Set<ProcessStage> processStages) {
		this.ssName = ssName;
		this.ssActive = ssActive;
		this.processStages = processStages;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "ss_id", unique = true, nullable = false)
	public Integer getSsId() {
		return this.ssId;
	}

	public void setSsId(Integer ssId) {
		this.ssId = ssId;
	}

	@Column(name = "ss_name", length = 50)
	public String getSsName() {
		return this.ssName;
	}

	public void setSsName(String ssName) {
		this.ssName = ssName;
	}

	@Column(name = "ss_active")
	public byte[] getSsActive() {
		return this.ssActive;
	}

	public void setSsActive(byte[] ssActive) {
		this.ssActive = ssActive;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "stageStatus")
	public Set<ProcessStage> getProcessStages() {
		return this.processStages;
	}

	public void setProcessStages(Set<ProcessStage> processStages) {
		this.processStages = processStages;
	}

}