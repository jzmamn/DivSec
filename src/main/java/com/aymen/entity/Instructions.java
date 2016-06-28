// default package
// Generated Sep 30, 2015 10:10:01 PM by Hibernate Tools 4.3.1
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

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

@Entity
@Table(name = "instructions", catalog = "divsec")
@JsonIdentityInfo(generator = ObjectIdGenerators.None.class, property = "@insId")
public class Instructions implements java.io.Serializable {

    private static final long serialVersionUID = 1L;
    private Integer insId;
    private Request request;
    private Staff staff;
    private String insInstruction;
    private Date insDate;
    private Boolean insIsRead;

    public Instructions() {
    }

    public Instructions(Request request, Staff staff, String insInstruction, Date insDate, Boolean insIsRead) {
        this.request = request;
        this.staff = staff;
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

    @ManyToOne(fetch = FetchType.EAGER)
    @JsonIgnore
    @JoinColumn(name = "ins_pr_id")
    public Request getRequest() {
        return this.request;
    }

    public void setRequest(Request request) {
        this.request = request;
    }

    @Column(name = "ins_instruction", length = 500)
    public String getInsInstruction() {
        return this.insInstruction;
    }

    public void setInsInstruction(String insInstruction) {
        this.insInstruction = insInstruction;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "ins_date", length = 19)
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone = "Asia/Jayapura")
    public Date getInsDate() {
        return this.insDate;
    }

    public void setInsDate(Date insDate) {
        this.insDate = insDate;
    }

    @Column(name = "ins_is_read")
    public Boolean getInsIsRead() {
        return this.insIsRead;
    }

    public void setInsIsRead(Boolean insIsRead) {
        this.insIsRead = insIsRead;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "ins_stf_id")
    public Staff getStaff() {
        return this.staff;
    }

    public void setStaff(Staff staff) {
        this.staff = staff;
    }

}
