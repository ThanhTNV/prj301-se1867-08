/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Order;

import java.sql.Date;

/**
 *
 * @author ADMIN
 */
public class OrderDTO {
    private String id;
    private String userID;
    private String address;
    private int phone;
    private String status;
    private String voucherID;
    private int totalPrice;

    public OrderDTO() {
    }

    public OrderDTO(String id, String userID, String address, int phone, String status, String voucherID, int totalPrice) {
        this.id = id;
        this.userID = userID;
        this.address = address;
        this.phone = phone;
        this.status = status;
        this.voucherID = voucherID;
        this.totalPrice = totalPrice;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getPhone() {
        return phone;
    }

    public void setPhone(int phone) {
        this.phone = phone;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getVoucherID() {
        return voucherID;
    }

    public void setVoucherID(String voucherID) {
        this.voucherID = voucherID;
    }

    public int getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }
    
    
}
