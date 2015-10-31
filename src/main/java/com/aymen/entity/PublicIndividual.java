package com.aymen.entity;

import static javax.persistence.GenerationType.IDENTITY;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

@Entity
@Table(name = "public_individual", catalog = "divsec", uniqueConstraints = @UniqueConstraint(columnNames = "pi_ind_user_id") )
@JsonIdentityInfo(generator = ObjectIdGenerators.None.class, property = "@piId")
public class PublicIndividual implements java.io.Serializable {
	private static final long serialVersionUID = 1L;
	private Integer piId;
	private Notification notification;
	private String piName;
	private String piAddress1;
	private String piAddress2;
	private String piAddress3;
	private String piLandPhone;
	private String piMobilePhone;
	private String piEmail;
	private Integer piIndUserId;
	private String piUserPwd;
	private String piNic;
	private Date piDob;
	private String piGender;
	private String piNote;
	private Integer piUserId;
	private Boolean piActive;
	private Set<Request> requests = new HashSet<Request>(0);

	public PublicIndividual() {
	}

	public PublicIndividual(Notification notification, String piName, String piAddress1, String piAddress2,
			String piAddress3, String piLandPhone, String piMobilePhone, String piEmail, Integer piIndUserId,
			String piUserPwd, String piNic, Date piDob, String piGender, String piNote, Integer piUserId,
			Boolean piActive, Set<Request> requests) {
		this.notification = notification;
		this.piName = piName;
		this.piAddress1 = piAddress1;
		this.piAddress2 = piAddress2;
		this.piAddress3 = piAddress3;
		this.piLandPhone = piLandPhone;
		this.piMobilePhone = piMobilePhone;
		this.piEmail = piEmail;
		this.piIndUserId = piIndUserId;
		this.piUserPwd = piUserPwd;
		this.piNic = piNic;
		this.piDob = piDob;
		this.piGender = piGender;
		this.piNote = piNote;
		this.piUserId = piUserId;
		this.piActive = piActive;
		this.requests = requests;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "pi_id", unique = true, nullable = false)
	public Integer getPiId() {
		return this.piId;
	}

	public void setPiId(Integer piId) {
		this.piId = piId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "pi_notfication_type_id")
	public Notification getNotification() {
		return this.notification;
	}

	public void setNotification(Notification notification) {
		this.notification = notification;
	}

	@Column(name = "pi_name", length = 100)
	public String getPiName() {
		return this.piName;
	}

	public void setPiName(String piName) {
		this.piName = piName;
	}

	@Column(name = "pi_address1", length = 50)
	public String getPiAddress1() {
		return this.piAddress1;
	}

	public void setPiAddress1(String piAddress1) {
		this.piAddress1 = piAddress1;
	}

	@Column(name = "pi_address2", length = 50)
	public String getPiAddress2() {
		return this.piAddress2;
	}

	public void setPiAddress2(String piAddress2) {
		this.piAddress2 = piAddress2;
	}

	@Column(name = "pi_address3", length = 50)
	public String getPiAddress3() {
		return this.piAddress3;
	}

	public void setPiAddress3(String piAddress3) {
		this.piAddress3 = piAddress3;
	}

	@Column(name = "pi_land_phone", length = 10)
	public String getPiLandPhone() {
		return this.piLandPhone;
	}

	public void setPiLandPhone(String piLandPhone) {
		this.piLandPhone = piLandPhone;
	}

	@Column(name = "pi_mobile_phone", length = 10)
	public String getPiMobilePhone() {
		return this.piMobilePhone;
	}

	public void setPiMobilePhone(String piMobilePhone) {
		this.piMobilePhone = piMobilePhone;
	}

	@Column(name = "pi_email", length = 100)
	public String getPiEmail() {
		return this.piEmail;
	}

	public void setPiEmail(String piEmail) {
		this.piEmail = piEmail;
	}

	@Column(name = "pi_ind_user_id", unique = true)
	public Integer getPiIndUserId() {
		return this.piIndUserId;
	}

	public void setPiIndUserId(Integer piIndUserId) {
		this.piIndUserId = piIndUserId;
	}

	@Column(name = "pi_user_pwd", length = 100)
	public String getPiUserPwd() {
		return this.piUserPwd;
	}

	public void setPiUserPwd(String piUserPwd) {
		this.piUserPwd = piUserPwd;
	}

	@Column(name = "pi_nic", length = 10)
	public String getPiNic() {
		return this.piNic;
	}

	public void setPiNic(String piNic) {
		this.piNic = piNic;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "pi_dob", length = 19)
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd,HH:00", timezone = "CET")
	public Date getPiDob() {

		return this.piDob;
	}

	public void setPiDob(Date piDob) {
		this.piDob = piDob;
	}

	@Column(name = "pi_gender", length = 5)
	public String getPiGender() {
		return this.piGender;
	}

	public void setPiGender(String piGender) {
		this.piGender = piGender;
	}

	@Column(name = "pi_note", length = 100)
	public String getPiNote() {
		return this.piNote;
	}

	public void setPiNote(String piNote) {
		this.piNote = piNote;
	}

	@Column(name = "pi_user_id")
	public Integer getPiUserId() {
		return this.piUserId;
	}

	public void setPiUserId(Integer piUserId) {
		this.piUserId = piUserId;
	}

	@Column(name = "pi_active")
	public Boolean getPiActive() {
		return this.piActive;
	}

	public void setPiActive(Boolean piActive) {
		this.piActive = piActive;
	}

	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "publicIndividual")
	public Set<Request> getRequests() {
		return this.requests;
	}

	public void setRequests(Set<Request> requests) {
		this.requests = requests;
	}

}
