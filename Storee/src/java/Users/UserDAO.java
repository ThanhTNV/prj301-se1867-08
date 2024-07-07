/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Users;

import DBUtils.DBUtils;
import Users.UserDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import Users.UserDTO;
/**
 *
 * @author ducco
 */
public class UserDAO {

    public UserDTO checkLogin(String username, String password) {
        UserDTO user = null;
        try {
            Connection con = DBUtils.getConnection();
            String sql=" SELECT * FROM users WHERE username = ? AND password = ?";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password);
            
            ResultSet rs = stmt.executeQuery();
            
            if(rs != null){
                if(rs.next()){
                    user = new UserDTO();
                    user.setUsername(rs.getString("username"));
                    user.setPassword(rs.getString("password"));
                    user.setMail(rs.getString("mail"));
                    user.setStatus(rs.getInt("status"));
                }
            }
            con.close();
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
                
        }
        return user;
    }
    
    public UserDTO load(String username) {
        UserDTO user = null;
        try {
            Connection con = DBUtils.getConnection();
            String sql=" SELECT * FROM users WHERE username = ? ";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, username);
            
            ResultSet rs = stmt.executeQuery();
            
            if(rs != null){
                if(rs.next()){
                    user = new UserDTO();
                    user.setUsername(rs.getString("username"));
                    user.setPassword(rs.getString("password"));
                    user.setMail(rs.getString("mail"));
                    user.setStatus(rs.getInt("status"));
                }
            }
            con.close();
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
                
        }
        return user;
    }
    
    public boolean register(UserDTO user){
        try {
            Connection con = DBUtils.getConnection();
            String sql = " INSERT INTO users VALUES (?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getMail());
            ps.setInt(4, user.getStatus());

            ps.executeUpdate();
            con.close();
            return true;
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return false;
    }
    
    public boolean update(UserDTO user){
        
        String sql = "UPDATE users SET password = ?, mail = ? WHERE username = ? ";
        try {
            
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);                      
            
            ps.setString(1, user.getPassword());
            ps.setString(2, user.getMail());
            ps.setString(3, user.getUsername());

            ps.executeUpdate();
            
            conn.close();
            
            return true;
           
	}
        catch (SQLException ex) {
            System.out.println("Update error!" + ex.getMessage());
            ex.printStackTrace();
        }
        
                
        
        return false;
    } 
}
