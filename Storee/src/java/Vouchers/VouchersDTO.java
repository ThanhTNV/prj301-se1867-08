/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Vouchers;

import java.sql.Date;

/**
 *
 * @author ADMIN
 */
public class VouchersDTO {
    
private String id;
    private int value;
    private int status;

    public VouchersDTO() {
    }

    public VouchersDTO(String id, int value, int status) {
        this.id = id;
        this.value = value;
        this.status = status;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getValue() {
        return value;
    }

    public void setValue(int value) {
        this.value = value;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "VouchersDTO{" + "id=" + id + ", value=" + value + ", status=" + status + '}';
    }
    
}
