// default package
// Generated Aug 28, 2015 10:08:05 PM by Hibernate Tools 4.3.1
package com.aymen.entity;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Notification generated by hbm2java
 */
@Entity
@Table(name = "notification", catalog = "divsec")
public class Notification implements java.io.Serializable {

	private int ntnId;
	private String ntnType;
	private byte[] ntnActive;
	private Set<PublicIndividual> publicIndividuals = new HashSet<PublicIndividual>(
			0);

	public Notification() {
	}

	public Notification(int ntnId) {
		this.ntnId = ntnId;
	}

	public Notification(int ntnId, String ntnType, byte[] ntnActive,
			Set<PublicIndividual> publicIndividuals) {
		this.ntnId = ntnId;
		this.ntnType = ntnType;
		this.ntnActive = ntnActive;
		this.publicIndividuals = publicIndividuals;
	}

	@Id
	@Column(name = "ntn_id", unique = true, nullable = false)
	public int getNtnId() {
		return this.ntnId;
	}

	public void setNtnId(int ntnId) {
		this.ntnId = ntnId;
	}

	@Column(name = "ntn_type", length = 100)
	public String getNtnType() {
		return this.ntnType;
	}

	public void setNtnType(String ntnType) {
		this.ntnType = ntnType;
	}

	@Column(name = "ntn_active")
	public byte[] getNtnActive() {
		return this.ntnActive;
	}

	public void setNtnActive(byte[] ntnActive) {
		this.ntnActive = ntnActive;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "notification")
	public Set<PublicIndividual> getPublicIndividuals() {
		return this.publicIndividuals;
	}

	public void setPublicIndividuals(Set<PublicIndividual> publicIndividuals) {
		this.publicIndividuals = publicIndividuals;
	}

}
