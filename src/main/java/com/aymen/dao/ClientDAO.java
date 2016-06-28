package com.aymen.dao;

import java.util.List;


public interface ClientDAO {

    public List<Object> listRequestNewAndOpened(int pubId);

    public List<Object> listRequestApproval(int pubId);

  //  public List<Object> listRequestOpened(int pubId);

    public List<Object> listRequestCompleted(int pubId);

    public List<Object> listRequestClosed(int pubId);

    public List<Object> listRequestRejected(int pubId);

}
