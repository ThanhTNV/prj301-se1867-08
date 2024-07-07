/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package OrderDetails;

import DBUtils.DBUtils;
import Order.OrderDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author ADMIN
 */
public class OrderDetailsDAO {
    public boolean addOrderDetail(OrderDetailsDTO orderDetail){
        try {
            Connection con = DBUtils.getConnection();
            String sql = " INSERT INTO orderDetails VALUES (?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, orderDetail.getOrderID());
            ps.setString(2, orderDetail.getProductID());
      

            ps.executeUpdate();
            con.close();
            return true;
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return false;
    }
}
