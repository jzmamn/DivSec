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
import javax.persistence.UniqueConstraint;

/**
 * UserCategory generated by hbm2java
 */
@Entity
@Table(name = "user_category", catalog = "divsec", uniqueConstraints = @UniqueConstraint(columnNames = "cat_name"))
public class UserCategory implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private Integer catId;
	private String catName;
	private Set<Staff> staffs = new HashSet<Staff>(0);

	public UserCategory() {
	}

	public UserCategory(String catName, Set<Staff> staffs) {
		this.catName = catName;
		this.staffs = staffs;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "cat_id", unique = true, nullable = false)
	public Integer getCatId() {
		return this.catId;
	}

	public void setCatId(Integer catId) {
		this.catId = catId;
	}

	@Column(name = "cat_name", unique = true, length = 50)
	public String getCatName() {
		return this.catName;
	}

	public void setCatName(String catName) {
		this.catName = catName;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "userCategory")
	public Set<Staff> getStaffs() {
		return this.staffs;
	}

	public void setStaffs(Set<Staff> staffs) {
		this.staffs = staffs;
	}

}