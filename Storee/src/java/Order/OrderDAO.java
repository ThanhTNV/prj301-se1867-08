/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Order;

import DBUtils.DBUtils;
import Products.ProductsDTO;
import Users.UserDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author ADMIN
 */
public class OrderDAO {

    public boolean order(OrderDTO order) {
        try {
            Connection con = DBUtils.getConnection();
            String sql = " INSERT INTO orders VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, order.getId());
            ps.setString(2, order.getUserID());
            ps.setString(3, order.getAddress());
            ps.setInt(4, order.getPhone());
            ps.setString(5, order.getStatus());
            ps.setString(6, order.getVoucherID());
            ps.setInt(7, order.getTotalPrice());

            ps.executeUpdate();
            con.close();
            return true;
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return false;
    }

    public String getMaxOrderID() {
        String sql = "SELECT MAX(id) FROM orders";
        String maxIDString = "0";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int maxID = rs.getInt(1) + 1;
                maxIDString = String.valueOf(maxID);
                return maxIDString;
            }

        } catch (SQLException ex) {
            System.out.println("MaxID error!" + ex.getMessage());
            ex.printStackTrace();
        }

        return null;
    }
}
