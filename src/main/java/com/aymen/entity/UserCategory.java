package com.aymen.entity;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "user_category", catalog = "divsec")
public class UserCategory implements java.io.Serializable {

	private static final long serialVersionUID = 1L;

	private Integer catId;
	private String catName;

	public UserCategory() {
	}

	public UserCategory(String catName) {
		this.catName = catName;

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

	@Column(name = "cat_name", length = 50)
	public String getCatName() {
		return this.catName;
	}

	public void setCatName(String catName) {
		this.catName = catName;
	}

}
