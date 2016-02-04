package com.aymen.dao;

import java.util.Iterator;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aymen.entity.Staff;
import com.aymen.entity.StaffRole;

@Repository
public class UserCreationDAOImpl implements UserCreationDAO {
	private static final Logger logger = LoggerFactory.getLogger(UserCreationDAOImpl.class);

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void createStaff(Staff staff) {
		try {
			Session session = sessionFactory.getCurrentSession();
			session.persist(staff);
			logger.debug("Staff saved successfully, Staff Details=" + staff.getStfId());
		} catch (Exception e) {
			System.out.println("DAO" + e.toString());
		}

	}

	@Override
	public void updateStaff(Staff staff) {
		try {
			Session session = sessionFactory.getCurrentSession();
			session.update(staff);

			logger.info("Staff saved successfully, Staff Details=" + staff.getStfId());

		} catch (Exception e) {
			System.out.println(e.toString());
		}

	}

	@Override
	public List<Object> listStaff() {
		String strQuery = "SELECT `stf_id`,`stf_name`, `role_id`,`role_name`, `stf_user_id`,`stf_password`,`stf_dvision_id`,"
				+ " `div_name`, `stf_email`, `stf_mobile`,`stf_note`,`stf_active` FROM `staff`s"
				+ " inner join `division` d on s.`stf_dvision_id` = d.`div_id`"
				+ " left join staff_role r on s.stf_id=r.staff_id";

		System.out.println(strQuery);
		Session session = this.sessionFactory.getCurrentSession();
		SQLQuery query = session.createSQLQuery(strQuery);
		query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
		List<Object> results = query.list();
		return results;

	}

	@SuppressWarnings("rawtypes")
	@Override
	public Staff getStaffById(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Staff staff = (Staff) session.load(Staff.class, new Integer(id));
		logger.info("Staff loaded successfully, Staff details=" + staff.getStfId());
		return staff;
	}

	@Override
	public void deleteStaff(int id) {
		try {
			Session session = this.sessionFactory.getCurrentSession();
			Staff staff = (Staff) session.load(Staff.class, new Integer(id));
			if (null != staff) {
				session.delete(staff);
			}
			logger.info("Staff deleted successfully, person details=" + staff.getStfId());
		} catch (HibernateException e) {
			logger.info("deleteStaff", e.toString());
			System.out.println(e.toString());
		}

	}

	@SuppressWarnings("rawtypes")
	@Override
	public Staff getStaffByUserId(String userId) {

		try {
			System.out.println(userId);
			String qry = "SELECT * FROM staff WHERE stf_user_id = :Id";
			System.out.println("Query" + qry);
			Staff staff = null;
			Session session = this.sessionFactory.getCurrentSession();
			SQLQuery query = (SQLQuery) session.createSQLQuery(qry);
			query.addEntity(Staff.class);
			query.setParameter("Id", userId);
			List results = query.list();

			for (Iterator iterator = results.iterator(); iterator.hasNext();) {
				staff = new Staff();
				staff = (Staff) iterator.next();
			}

			// logger.debug("Staff by username", staff.getStfName());
			return staff;
		} catch (HibernateException e) {
			e.printStackTrace();
			System.out.println(e.toString());
			return null;
		}

	}

	@SuppressWarnings({ "unchecked" })
	@Override
	public List<Staff> getStaffByUserIdWithoutPwd(String userId) {
		try {

			Session session = this.sessionFactory.getCurrentSession();
			String qry = "SELECT  `stf_id`,`stf_name`,`stf_category_id`,`stf_user_id`,`stf_dvision_id`, "
					+ " `stf_email`,`stf_mobile`,`stf_note`,`stf_active` FROM staff WHERE stf_user_id = :Id";

			List<Staff> staffList = session.createQuery(" from Staff").list();
			for (Staff staff : staffList) {

			}
			return staffList;

		} catch (HibernateException e) {
			e.printStackTrace();
			System.out.println(e.toString());
			return null;
		}
	}

	@Override
	public void saveRole(StaffRole StaffRole) {
		try {
			Session session = sessionFactory.getCurrentSession();
			session.persist(StaffRole);
			logger.debug("Staff role saved successfully, Staff Details=" + StaffRole.getRoleName());
		} catch (Exception e) {
			System.out.println("DAO" + e.toString());
		}
	}

	@Override
	public void updateRole(StaffRole stfRole) {
		try {
			Session session = sessionFactory.getCurrentSession();
			session.update(stfRole);
			logger.info("Staff role update successfully, Staff Details=" + stfRole.getRoleName());

		} catch (Exception e) {
			System.out.println(e.toString());
		}

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Object> listStaffById(int stfId) {
		String strQuery = "SELECT `stf_id`,`stf_name`, `role_id`,`role_name`, `stf_user_id`,`stf_password`,`stf_dvision_id`,"
				+ " `div_name`, `stf_email`, `stf_mobile`,`stf_note`,`stf_active` FROM `staff`s"
				+ " inner join `division` d on s.`stf_dvision_id` = d.`div_id`"
				+ " left join staff_role r on s.stf_id=r.staff_id" + " where stf_id=" + stfId;

		System.out.println(strQuery);
		Session session = this.sessionFactory.getCurrentSession();
		SQLQuery query = session.createSQLQuery(strQuery);
		query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
		List<Object> results = query.list();
		return results;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Object> listStaffForDropdown() {
		String strQry = "select * from vw_staff_list";

		System.out.println(strQry);
		Session session = this.sessionFactory.getCurrentSession();

		SQLQuery query = session.createSQLQuery(strQry);
		query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
		List<Object> results = query.list();

		return results;
	}

}
