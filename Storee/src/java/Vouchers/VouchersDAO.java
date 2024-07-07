/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Vouchers;

import DBUtils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class VouchersDAO {

    public List<VouchersDTO> list() {

        List<VouchersDTO> list = new ArrayList<VouchersDTO>();

        try {

            Connection con = DBUtils.getConnection();
            String sql = " SELECT * FROM vouchers ";

            PreparedStatement stmt = con.prepareStatement(sql);

            ResultSet rs = stmt.executeQuery();

            if (rs != null) {
                while (rs.next()) {
                    String id = rs.getString("id");
                    int value = rs.getInt("value");
                    int status = rs.getInt("status");

                    VouchersDTO vouchers = new VouchersDTO();
                    vouchers.setId(id);
                    vouchers.setValue(value);
                    vouchers.setStatus(status);
                    
                    list.add(vouchers);
                }
            }
            con.close();
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();

        }
        return list;
    }
    public VouchersDTO load(String id) {

        String sql = "select * from vouchers where id = ?";

        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1,  id);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                id = rs.getString("id");
                int value = rs.getInt("value");
                int status = rs.getInt("status");

                VouchersDTO vouchers = new VouchersDTO();
                vouchers.setId(id);
                vouchers.setStatus(status);
                vouchers.setValue(value);
                return vouchers;
            }
            conn.close();
        } catch (SQLException ex) {
            System.out.println("Query  error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

    public String insert(VouchersDTO vouchers) {
        String sql = "INSERT INTO vouchers( id, value, status) VALUES (?, ?, ?)";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, vouchers.getId());
            ps.setInt(2, vouchers.getValue());
            ps.setInt(3, vouchers.getStatus());

            ps.executeUpdate();

            conn.close();

            return vouchers.getId();

        } catch (SQLException ex) {
            System.out.println("Insert Vouchers error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

    public boolean update(VouchersDTO vouchers) {

        String sql = "UPDATE vouchers SET value = ?, status = ? WHERE id = ? ";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            
            ps.setInt(1, vouchers.getValue());
            ps.setInt(2, vouchers.getStatus());
            ps.setString(3, vouchers.getId());

            ps.executeUpdate();

            conn.close();

            return true;

        } catch (SQLException ex) {
            System.out.println("Update Vouchers error!" + ex.getMessage());
            ex.printStackTrace();
        }

        return false;
    }

    public boolean delete(String id) {
        String sql = "DELETE vouchers WHERE id = ? ";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, id);

            ps.executeUpdate();

            conn.close();

            return true;

        } catch (SQLException ex) {
            System.out.println("Delete Vouchers error!" + ex.getMessage());
            ex.printStackTrace();
        }

        return false;
    }
  
}
