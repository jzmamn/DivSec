package com.aymen.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aymen.dao.PublicDetailDAO;
import com.aymen.entity.PublicIndividual;

@Service
@Transactional
public class PublicDetailServiceImpl implements PublicDetailService {
	private static final Logger logger = LoggerFactory.getLogger(PublicDetailServiceImpl.class);
	@Autowired
	PublicDetailDAO pdDAO;

	@Override
	public void createSvcPublicIndividual(PublicIndividual pi) {
		logger.info("createSvcPublicIndividual");
		this.pdDAO.createPublicIndividual(pi);

	}

	@Override
	public void updateSvcPublicIndividual(PublicIndividual pi) {
		this.pdDAO.updatePublicIndividual(pi);

	}

	@Override
	public List<PublicIndividual> listSvcPublicIndividual() {
		return this.pdDAO.listPublicIndividual();
	}

	@Override
	public PublicIndividual getSvcPublicIndividualById(int id) {

		return this.pdDAO.getPublicIndividualById(id);
	}

	@Override
	public void deleteSvcPublicIndividual(int id) {
		this.pdDAO.deletePublicIndividual(id);

	}

}
