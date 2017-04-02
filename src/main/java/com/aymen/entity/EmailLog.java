package com.aymen.entity;
// Generated Jun 9, 2016 7:02:58 PM by Hibernate Tools 4.3.1

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * EmailLog generated by hbm2java
 */
@Entity
@Table(name = "email_log", catalog = "divsec"
)
public class EmailLog implements java.io.Serializable {

    private Integer emailId;
    private Date emailDate;
    private Integer emailReqId;
    private Integer emailUserId;

    public EmailLog() {
    }

    public EmailLog(Date emailDate, Integer emailReqId, Integer emailUserId) {
        this.emailDate = emailDate;
        this.emailReqId = emailReqId;
        this.emailUserId = emailUserId;
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

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "email_date", length = 19)
    public Date getEmailDate() {
        return this.emailDate;
    }

    public void setEmailDate(Date emailDate) {
        this.emailDate = emailDate;
    }

    @Column(name = "email_req_id")
    public Integer getEmailReqId() {
        return this.emailReqId;
    }

    public void setEmailReqId(Integer emailReqId) {
        this.emailReqId = emailReqId;
    }

    @Column(name = "email_user_id")
    public Integer getEmailUserId() {
        return this.emailUserId;
    }

    public void setEmailUserId(Integer emailUserId) {
        this.emailUserId = emailUserId;
    }

}