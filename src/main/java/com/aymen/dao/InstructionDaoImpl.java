package com.aymen.dao;

import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aymen.entity.Instructions;

@Repository
public class InstructionDaoImpl implements InstructionDAO {

	private static final Logger logger = LoggerFactory.getLogger(InstructionDaoImpl.class);

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void createInstructions(Instructions inst) {
		try {
			Session session = sessionFactory.getCurrentSession();
			session.persist(inst);
			logger.info("Division saved successfully, Person Details=" + inst.getInsId());
		} catch (Exception e) {
			System.out.println(e.toString());
		}

	}

	@Override
	public void updateInstructions(Instructions inst) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<Instructions> listInstructions() {
		Session session = this.sessionFactory.getCurrentSession();
		@SuppressWarnings("unchecked")
		List<Instructions> instList = session.createQuery(" from Instructions").list();
		for (Instructions d : instList) {
			logger.info("Person List::" + d);
			// System.out.println(d);
		}
		return instList;
	}

	@Override
	public Instructions getInstructionsById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteInstructions(int id) {
		// TODO Auto-generated method stub

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Instructions> listInstByRequest(int reqId) {
		String sql = "SELECT * FROM Instructions WHERE ins_pr_id = :Id ";
		Session session = sessionFactory.getCurrentSession();
		try {
			SQLQuery query = session.createSQLQuery(sql);
			query.addEntity(Instructions.class);
			query.setParameter("Id", reqId);
			List<Instructions> lst = query.list();
			return lst;
		} catch (Exception e) {
			System.out.println(e.toString());
			logger.error(e.toString());
			return null;
		}

	}

}
