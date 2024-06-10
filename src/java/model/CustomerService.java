/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

public class CustomerService {

    private String staffName;

    private long numRequest;

    public CustomerService(String staffName, long numRequest) {
        this.staffName = staffName;
        this.numRequest = numRequest;
    }

    public long getNumRequest() {
        return numRequest;
    }

    public void setNumRequest(long numRequest) {
        this.numRequest = numRequest;
    }

    public String getStaffName() {
        return staffName;
    }

    public void setStaffName(String staffName) {
        this.staffName = staffName;
    }

}
