package com.aymen.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

@Entity
@Table(name = "staff_role", catalog = "divsec")
@JsonIdentityInfo(generator = ObjectIdGenerators.None.class, property = "@id")
public class StaffRole implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private int id;
	private Staff staff;
	private Integer roleId;
	private String roleName;

	public StaffRole() {
	}

	public StaffRole(int id, Staff staff) {
		this.id = id;
		this.staff = staff;
	}

	public StaffRole(int id, Staff staff, Integer roleId, String roleName) {
		this.id = id;
		this.staff = staff;
		this.roleId = roleId;
		this.roleName = roleName;
	}

	@Id

	@Column(name = "id", unique = true, nullable = false)
	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "staff_id", nullable = false)
	public Staff getStaff() {
		return this.staff;
	}

	public void setStaff(Staff staff) {
		this.staff = staff;
	}

	@Column(name = "role_id")
	public Integer getRoleId() {
		return this.roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	@Column(name = "role_name", length = 45)
	public String getRoleName() {
		return this.roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

}
