package com.aymen.entity;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * EmailSetup generated by hbm2java
 */
@Entity
@Table(name = "email_setup", catalog = "divsec")
public class EmailSetup implements java.io.Serializable {

	private Integer emailId;
	private byte[] emailIsOutLook;
	private String emailSenderName;
	private String emailSenderEmail;
	private String emailServerName;
	private String emailPort;
	private String emailUserName;
	private String emailPassword;

	public EmailSetup() {
	}

	public EmailSetup(byte[] emailIsOutLook, String emailSenderName,
			String emailSenderEmail, String emailServerName, String emailPort,
			String emailUserName, String emailPassword) {
		this.emailIsOutLook = emailIsOutLook;
		this.emailSenderName = emailSenderName;
		this.emailSenderEmail = emailSenderEmail;
		this.emailServerName = emailServerName;
		this.emailPort = emailPort;
		this.emailUserName = emailUserName;
		this.emailPassword = emailPassword;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "email_id", unique = true, nullable = false)
	public Integer getEmailId() {
		return this.emailId;
	}

	public void setEmailId(Integer emailId) {
		this.emailId = emailId;
	}

	@Column(name = "email_is_out_look")
	public byte[] getEmailIsOutLook() {
		return this.emailIsOutLook;
	}

	public void setEmailIsOutLook(byte[] emailIsOutLook) {
		this.emailIsOutLook = emailIsOutLook;
	}

	@Column(name = "email_sender_name", length = 100)
	public String getEmailSenderName() {
		return this.emailSenderName;
	}

	public void setEmailSenderName(String emailSenderName) {
		this.emailSenderName = emailSenderName;
	}

	@Column(name = "email_sender_email", length = 100)
	public String getEmailSenderEmail() {
		return this.emailSenderEmail;
	}

	public void setEmailSenderEmail(String emailSenderEmail) {
		this.emailSenderEmail = emailSenderEmail;
	}

	@Column(name = "email_server_name", length = 50)
	public String getEmailServerName() {
		return this.emailServerName;
	}

	public void setEmailServerName(String emailServerName) {
		this.emailServerName = emailServerName;
	}

	@Column(name = "email_port", length = 6)
	public String getEmailPort() {
		return this.emailPort;
	}

	public void setEmailPort(String emailPort) {
		this.emailPort = emailPort;
	}

	@Column(name = "email_user_name", length = 100)
	public String getEmailUserName() {
		return this.emailUserName;
	}

	public void setEmailUserName(String emailUserName) {
		this.emailUserName = emailUserName;
	}

	@Column(name = "email_password", length = 100)
	public String getEmailPassword() {
		return this.emailPassword;
	}

	public void setEmailPassword(String emailPassword) {
		this.emailPassword = emailPassword;
	}

}
