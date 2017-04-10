/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.sql.Timestamp;

/**
 *
 * @author TungVoDoi
 */
public class BillEntity {
    private int billId;
    private int userId;
    private double total;
    private String payment;
    private String address;
    private Timestamp date;
    private int status;
    private String usname;
    private String mobile;

    public BillEntity(int billId, int userId, double total, String payment, String address, Timestamp date, int status, String usname, String mobile) {
        this.billId = billId;
        this.userId = userId;
        this.total = total;
        this.payment = payment;
        this.address = address;
        this.date = date;
        this.status = status;
        this.usname = usname;
        this.mobile = mobile;
    }

    public BillEntity(int billId, int userId, double total, String payment, String address, Timestamp date, int status) {
        this.billId = billId;
        this.userId = userId;
        this.total = total;
        this.payment = payment;
        this.address = address;
        this.date = date;
        this.status = status;
    }

    
    public BillEntity(int userId, double total, String payment, String address, Timestamp date) {
        this.userId = userId;
        this.total = total;
        this.payment = payment;
        this.address = address;
        this.date = date;
    }

    public BillEntity() {
    }

    public BillEntity(int userId, double total, String payment, String address, Timestamp date, int status) {
        this.userId = userId;
        this.total = total;
        this.payment = payment;
        this.address = address;
        this.date = date;
        this.status = status;
    }

    /**
     * @return the billId
     */
    public int getBillId() {
        return billId;
    }

    /**
     * @param billId the billId to set
     */
    public void setBillId(int billId) {
        this.billId = billId;
    }

    /**
     * @return the userId
     */
    public int getUserId() {
        return userId;
    }

    /**
     * @param userId the userId to set
     */
    public void setUserId(int userId) {
        this.userId = userId;
    }

    /**
     * @return the total
     */
    public double getTotal() {
        return total;
    }

    /**
     * @param total the total to set
     */
    public void setTotal(double total) {
        this.total = total;
    }

    /**
     * @return the payment
     */
    public String getPayment() {
        return payment;
    }

    /**
     * @param payment the payment to set
     */
    public void setPayment(String payment) {
        this.payment = payment;
    }

    /**
     * @return the address
     */
    public String getAddress() {
        return address;
    }

    /**
     * @param address the address to set
     */
    public void setAddress(String address) {
        this.address = address;
    }

    /**
     * @return the date
     */
    public Timestamp getDate() {
        return date;
    }

    /**
     * @param date the date to set
     */
    public void setDate(Timestamp date) {
        this.date = date;
    }

    /**
     * @return the status
     */
    public int getStatus() {
        return status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(int status) {
        this.status = status;
    }

    /**
     * @return the usname
     */
    public String getUsname() {
        return usname;
    }

    /**
     * @param usname the usname to set
     */
    public void setUsname(String usname) {
        this.usname = usname;
    }

    /**
     * @return the mobile
     */
    public String getMobile() {
        return mobile;
    }

    /**
     * @param mobile the mobile to set
     */
    public void setMobile(String mobile) {
        this.mobile = mobile;
    }
}
