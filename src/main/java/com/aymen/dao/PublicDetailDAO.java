package com.aymen.dao;

import java.util.List;

import com.aymen.entity.PublicIndividual;

public interface PublicDetailDAO {
	public void createPublicIndividual(PublicIndividual pi);

	public void updatePublicIndividual(PublicIndividual pi);

	public List<PublicIndividual> listPublicIndividual();

	public PublicIndividual getPublicIndividualById(int id);

	public void deletePublicIndividual(int id);
        
        public PublicIndividual getPublicByUserId(String publicUserId);

}
