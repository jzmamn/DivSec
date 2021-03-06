package com.aymen.entity;

import static javax.persistence.GenerationType.IDENTITY;

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
import javax.persistence.UniqueConstraint;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

@Entity
@Table(name = "staff", catalog = "divsec", uniqueConstraints = @UniqueConstraint(columnNames = "stf_user_id"))
@JsonIdentityInfo(generator = ObjectIdGenerators.None.class, property = "@stfId")
public class Staff implements java.io.Serializable {

    private static final long serialVersionUID = 1L;

    private Integer stfId;
    private Division division;
    private String stfName;
    private Integer stfCategoryId;
    private String stfUserId;
    private String stfPassword;
    private String stfEmail;
    private String stfMobile;
    private String stfNote;
    private Boolean stfActive;
    private String stfRole;
    private Integer stfPiId;
    private Set<ProcessStage> processStages = new HashSet<ProcessStage>(0);
    private Set<Request> requests = new HashSet<Request>(0);
    private Set<StaffRole> staffRoles = new HashSet<StaffRole>(0);

    public Staff() {
    }

    public Staff(Division division) {
        this.division = division;
    }

    public Staff(Division division, String stfName, Integer stfCategoryId, String stfUserId, String stfPassword,
            String stfEmail, String stfMobile, String stfNote, Boolean stfActive, String stfRole, Integer stfPiId,
            Set<ProcessStage> processStages,
            Set<Request> requests, Set<StaffRole> staffRoles) {
        this.division = division;
        this.stfName = stfName;
        this.stfCategoryId = stfCategoryId;
        this.stfUserId = stfUserId;
        this.stfPassword = stfPassword;
        this.stfEmail = stfEmail;
        this.stfMobile = stfMobile;
        this.stfNote = stfNote;
        this.stfActive = stfActive;
        this.stfRole = stfRole;
        this.stfPiId = stfPiId;
        this.processStages = processStages;
        this.requests = requests;
        this.staffRoles = staffRoles;
    }

    @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "stf_id", unique = true, nullable = false)
    public Integer getStfId() {
        return this.stfId;
    }

    public void setStfId(Integer stfId) {
        this.stfId = stfId;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JsonIgnore
    @JoinColumn(name = "stf_dvision_id", nullable = false)
    public Division getDivision() {
        return this.division;
    }

    public void setDivision(Division division) {
        this.division = division;
    }

    @Column(name = "stf_name", length = 50)
    public String getStfName() {
        return this.stfName;
    }

    public void setStfName(String stfName) {
        this.stfName = stfName;
    }

    @Column(name = "stf_category_id")
    public Integer getStfCategoryId() {
        return this.stfCategoryId;
    }

    public void setStfCategoryId(Integer stfCategoryId) {
        this.stfCategoryId = stfCategoryId;
    }

    @Column(name = "stf_user_id", unique = true, length = 10)
    public String getStfUserId() {
        return this.stfUserId;
    }

    public void setStfUserId(String stfUserId) {
        this.stfUserId = stfUserId;
    }

    @Column(name = "stf_password", length = 300)
    public String getStfPassword() {
        return this.stfPassword;
    }

    public void setStfPassword(String stfPassword) {
        this.stfPassword = stfPassword;
    }

    @Column(name = "stf_email", length = 100)
    public String getStfEmail() {
        return this.stfEmail;
    }

    public void setStfEmail(String stfEmail) {
        this.stfEmail = stfEmail;
    }

    @Column(name = "stf_mobile", length = 10)
    public String getStfMobile() {
        return this.stfMobile;
    }

    public void setStfMobile(String stfMobile) {
        this.stfMobile = stfMobile;
    }

    @Column(name = "stf_note", length = 100)
    public String getStfNote() {
        return this.stfNote;
    }

    public void setStfNote(String stfNote) {
        this.stfNote = stfNote;
    }

    @Column(name = "stf_active")
    public Boolean getStfActive() {
        return this.stfActive;
    }

    public void setStfActive(Boolean stfActive) {
        this.stfActive = stfActive;
    }

    @Column(name = "stf_role", length = 20)
    public String getStfRole() {
        return this.stfRole;
    }

    public void setStfRole(String stfRole) {
        this.stfRole = stfRole;
    }

    @Column(name = "stf_pi_id")
    public Integer getStfPiId() {
        return this.stfPiId;
    }

    public void setStfPiId(Integer stfPiId) {
        this.stfPiId = stfPiId;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "staff")
    @JsonIgnore
    public Set<ProcessStage> getProcessStages() {
        return this.processStages;
    }

    public void setProcessStages(Set<ProcessStage> processStages) {
        this.processStages = processStages;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "staff")
    @JsonIgnore
    public Set<Request> getRequests() {
        return this.requests;
    }

    public void setRequests(Set<Request> requests) {
        this.requests = requests;
    }

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "staff")
    @JsonIgnore
    public Set<StaffRole> getStaffRoles() {
        return this.staffRoles;
    }

    public void setStaffRoles(Set<StaffRole> staffRoles) {
        this.staffRoles = staffRoles;
    }

}
