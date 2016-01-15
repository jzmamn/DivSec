package com.aymen.entity;

import static javax.persistence.GenerationType.IDENTITY;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * TicketStatus generated by hbm2java
 */
@Entity
@Table(name = "ticket_status", catalog = "divsec")
public class TicketStatus implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private Integer id;
	private String tktStatus;
	private Set<Ticket> tickets = new HashSet<Ticket>(0);

	public TicketStatus() {
	}

	public TicketStatus(String tktStatus, Set<Ticket> tickets) {
		this.tktStatus = tktStatus;
		this.tickets = tickets;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "tkt_status", length = 45)
	public String getTktStatus() {
		return this.tktStatus;
	}

	public void setTktStatus(String tktStatus) {
		this.tktStatus = tktStatus;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "ticketStatus")
	public Set<Ticket> getTickets() {
		return this.tickets;
	}

	public void setTickets(Set<Ticket> tickets) {
		this.tickets = tickets;
	}

}