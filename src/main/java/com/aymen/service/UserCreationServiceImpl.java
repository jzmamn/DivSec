package com.aymen.service;

import com.aymen.component.JsonFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aymen.dao.UserCategoryDAO;
import com.aymen.dao.UserCreationDAO;
import com.aymen.entity.Staff;
import com.aymen.entity.StaffRole;
import com.aymen.entity.UserCategory;

@Service
@Transactional
public class UserCreationServiceImpl implements UserCreationService {

    @Autowired
    private UserCreationDAO userCreationDAO;

    @Autowired
    private UserCategoryDAO userCatDao;

       @SuppressWarnings("unchecked")
    @Override
    public void createSvcStaff(Staff staff) {
        staff.setStfPassword(encrypPassword(staff.getStfPassword()));
        this.userCreationDAO.createStaff(staff);
    }

    @Override
    public void updateSvcStaff(Staff staff) {
        staff.setStfPassword(encrypPassword(staff.getStfPassword()));
        this.userCreationDAO.updateStaff(staff);

    }

    @Override
    public List<Object> listSvcStaff() {
        return this.userCreationDAO.listStaff();
    }

    @Override
    public Staff getSvcStaffById(int id) {
        return this.userCreationDAO.getStaffById(id);
    }

    @Override
    public void deleteSvcStaff(int id) {
        this.userCreationDAO.deleteStaff(id);
    }

    @Override
    public Staff getSvcStaffByUserId(String userId) {
        return this.userCreationDAO.getStaffByUserId(userId);
    }

    @Override
    public List getSvcStaffByUserIdWithoutPwd(String userId) {
        return this.userCreationDAO.getStaffByUserIdWithoutPwd(userId);
    }

    /**
     * Password encryption using BCrypt
     */
    private String encrypPassword(String pwd) {
        PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String hashedPassword = passwordEncoder.encode(pwd);
        return hashedPassword;
    }

    @Override
    public void saveSvcRole(Staff stf) {
        StaffRole stfRole = new StaffRole();
        UserCategory uc = userCatDao.getUserCatById(stf.getStfCategoryId());
        stfRole.setStaff(stf);
        stfRole.setRoleId(stf.getStfCategoryId());
        stfRole.setRoleName(uc.getCatName());
        userCreationDAO.saveRole(stfRole);
    }

    @Override
    public void updateSvcRole(Staff stf) {
        StaffRole stfRole = new StaffRole();
        UserCategory uc = userCatDao.getUserCatById(stf.getStfCategoryId());
        stfRole.setStaff(stf);
        stfRole.setRoleId(stf.getStfCategoryId());
        stfRole.setRoleName(uc.getCatName());
        userCreationDAO.updateRole(stfRole);
    }

    @Override
    public List<Object> listStaffById(int stfId) {
        // TODO Auto-generated method stub
        return this.userCreationDAO.listStaffById(stfId);
    }

    @Override
    public List<Object> listStaffForDropdown() {
        // TODO Auto-generated method stub
        return this.userCreationDAO.listStaffForDropdown();
    }

    @Override
    public List<Object> getStaffByUserRoleSvc(String stfRole) {
        return this.userCreationDAO.getStaffByUserRole(stfRole);
    }

}
