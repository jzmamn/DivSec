package com.aymen.service;

import java.util.List;

import com.aymen.entity.PublicIndividual;

public interface PublicDetailService {
	public void createSvcPublicIndividual(PublicIndividual pi);

	public void updateSvcPublicIndividual(PublicIndividual pi);

	public List<PublicIndividual> listSvcPublicIndividual();

	public PublicIndividual getSvcPublicIndividualById(int id);

	public void deleteSvcPublicIndividual(int id);

}
