/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

/**
 *
 * @author TungVoDoi
 */
public class BillDetailEntity {
    private int billdetailId;
    private int billId;
    private int productId;
    private double price;
    private int quantity;
    private String proname;

    public BillDetailEntity() {
    }

    public BillDetailEntity(int billId, int productId, double price, int quantity) {
        this.billId = billId;
        this.productId = productId;
        this.price = price;
        this.quantity = quantity;
    }

    /**
     * @return the billdetailId
     */
    public int getBilldetailId() {
        return billdetailId;
    }

    /**
     * @param billdetailId the billdetailId to set
     */
    public void setBilldetailId(int billdetailId) {
        this.billdetailId = billdetailId;
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
     * @return the productId
     */
    public int getProductId() {
        return productId;
    }

    /**
     * @param productId the productId to set
     */
    public void setProductId(int productId) {
        this.productId = productId;
    }

    /**
     * @return the price
     */
    public double getPrice() {
        return price;
    }

    /**
     * @param price the price to set
     */
    public void setPrice(double price) {
        this.price = price;
    }

    /**
     * @return the quantity
     */
    public int getQuantity() {
        return quantity;
    }

    /**
     * @param quantity the quantity to set
     */
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    /**
     * @return the proname
     */
    public String getProname() {
        return proname;
    }

    /**
     * @param proname the proname to set
     */
    public void setProname(String proname) {
        this.proname = proname;
    }
}
