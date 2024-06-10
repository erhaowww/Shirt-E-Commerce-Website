/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.List;
import javax.annotation.Resource;
import javax.persistence.*;

public class StaffService {

    EntityManager mgr;
    @Resource
    Query query;

    public StaffService(EntityManager mgr) {
        this.mgr = mgr;
    }

    public boolean addStaff(Staff staff) {
        mgr.persist(staff);
        return true;
    }

    public boolean deleteStaff(int staffId) {
        Staff staff = findStaffByStaffId(staffId);
        if (staff != null) {
            mgr.remove(staff);
            return true;
        }
        return false;
    }

    public boolean deleteStaff(String name) {
        Staff staff = findStaffByName(name);
        if (staff != null) {
            mgr.remove(staff);
            return true;
        }
        return false;
    }

    public Staff findStaffByName(String name) {
        Staff staff = mgr.find(Staff.class, name);
        return staff;
    }

    public Staff findStaffByStaffId(int staffId) {
        Staff staff = mgr.find(Staff.class, staffId);
        return staff;
    }

    public boolean updateStaff(Staff staff) {
        Staff tempStaff = findStaffByStaffId(staff.getStaffId());
        if (tempStaff != null) {
            tempStaff.setName(staff.getName());
            tempStaff.setPassword(staff.getPassword());
            tempStaff.setEmail(staff.getEmail());
            tempStaff.setPhoneNum(staff.getPhoneNum());
            tempStaff.setImage(staff.getImage());
            return true;
        }
        return false;
    }
    public boolean updateStaffNoImage(Staff staff) {
        Staff tempStaff = findStaffByStaffId(staff.getStaffId());
        if (tempStaff != null) {
            tempStaff.setName(staff.getName());
            tempStaff.setPassword(staff.getPassword());
            tempStaff.setEmail(staff.getEmail());
            tempStaff.setPhoneNum(staff.getPhoneNum());
            return true;
        }
        return false;
    }

    public List<Staff> findAll() {
        List staffList = mgr.createNamedQuery("Staff.findAll").getResultList();
        return staffList;
    }

    public List<Staff> findAllStaffByName(String search) {
        List staffList = mgr.createNamedQuery("Staff.findByName").setParameter("name", search).getResultList();
        return staffList;
    }
}
