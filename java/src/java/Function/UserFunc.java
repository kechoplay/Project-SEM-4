/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Function;

import Entity.UserEntity;
import connect.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author TungVoDoi
 */
public class UserFunc {

    public boolean ckeckemail(String email) {
        Connection connection = DBConnect.getConnecttion();
        String sql = "select * from customer where email='" + email + "'";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                connection.close();
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserFunc.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean ckeckusername(String name) {
        Connection connection = DBConnect.getConnecttion();
        String sql = "select * from customer where username='" + name + "'";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                connection.close();
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserFunc.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean ckeckpass(int id) {
        Connection connection = DBConnect.getConnecttion();
        String sql = "select password from customer where cus_id=" + id;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                connection.close();
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserFunc.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public ArrayList<UserEntity> getListUser() {
        Connection con = DBConnect.getConnecttion();
        String sql = "select * from customer";
        ArrayList<UserEntity> listUs = new ArrayList<>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                UserEntity user = new UserEntity();
                user.setUserId(rs.getInt("cus_id"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setFullname(rs.getString("fullname"));
                user.setEmail(rs.getString("email"));
                user.setAddress(rs.getString("address"));
                user.setMobile(rs.getString("mobile"));
                user.setLevel(rs.getInt("level"));
                listUs.add(user);
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(UserFunc.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listUs;
    }
    
    public ArrayList<UserEntity> getListUserByName(String name) {
        Connection con = DBConnect.getConnecttion();
        String sql = "select * from customer where username='"+name+"'";
        ArrayList<UserEntity> listUs = new ArrayList<>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                UserEntity user = new UserEntity();
                user.setUserId(rs.getInt("cus_id"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setFullname(rs.getString("fullname"));
                user.setEmail(rs.getString("email"));
                user.setAddress(rs.getString("address"));
                user.setMobile(rs.getString("mobile"));
                user.setLevel(rs.getInt("level"));
                listUs.add(user);
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(UserFunc.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listUs;
    }

    public boolean insert(UserEntity us) {
        Connection connection = DBConnect.getConnecttion();
        String sql = "insert into customer(username,password,fullname,email,address,mobile) values (?,?,?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setString(1, us.getUsername());
            ps.setString(2, us.getPassword());
            ps.setString(3, us.getFullname());
            ps.setString(4, us.getEmail());
            ps.setString(5, us.getAddress());
            ps.setString(6, us.getMobile());
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(UserFunc.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public boolean insertadmin(UserEntity us) {
        Connection connection = DBConnect.getConnecttion();
        String sql = "insert into customer(username,password,fullname,email,address,mobile,level) values (?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setString(1, us.getUsername());
            ps.setString(2, us.getPassword());
            ps.setString(3, us.getFullname());
            ps.setString(4, us.getEmail());
            ps.setString(5, us.getAddress());
            ps.setString(6, us.getMobile());
            ps.setInt(7, us.getLevel());
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(UserFunc.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean update(String username, String fullname, String email, String address, String mobile, int level, int cusid) {
        Connection connection = DBConnect.getConnecttion();
        String sql = "update customer set username='" + username + "',fullname='" + fullname + "',email='" + email + "'"
                + ",address='" + address + "',mobile='" + mobile + "',level='" + level + "' where cus_id='" + cusid + "'";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(UserFunc.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean update2(String fullname, String email, String address, String mobile, int cusid) {
        Connection connection = DBConnect.getConnecttion();
        String sql = "update customer set fullname='" + fullname + "',email='" + email + "'"
                + ",address='" + address + "',mobile='" + mobile + "' where cus_id='" + cusid + "'";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(UserFunc.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public boolean updatepass(String pass, int cusid) {
        Connection connection = DBConnect.getConnecttion();
        String sql = "update customer set password='" + pass + "' where cus_id='" + cusid + "'";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(UserFunc.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public boolean delete(int cusid) {
        Connection connection = DBConnect.getConnecttion();
        String sql = "delete from customer where cus_id='" + cusid + "'";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(UserFunc.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    // kiểm tra đăng nhập
    public UserEntity login(String user, String password) {
        Connection con = DBConnect.getConnecttion();
        String sql = "select * from customer where username='" + user + "' and password='" + password + "'";
        PreparedStatement ps;
        try {
            ps = (PreparedStatement) con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                UserEntity u = new UserEntity();
                u.setUserId(rs.getInt("cus_id"));
                u.setUsername(rs.getString("username"));
                u.setPassword(rs.getString("password"));
                u.setFullname(rs.getString("fullname"));
                u.setEmail(rs.getString("email"));
                u.setAddress(rs.getString("address"));
                u.setMobile(rs.getString("mobile"));
                u.setLevel(rs.getInt("level"));
                con.close();
                return u;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public int countUserByFeedback(int userID) throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT count(customer.cus_id) FROM customer join feedback on customer.cus_id=feedback.cus_id WHERE customer.cus_id = '" + userID + "'";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        int count = 0;
        while (rs.next()) {
            count = rs.getInt(1);
        }
        return count;
    }
    
    public int countUserByOrder(int userID) throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT count(customer.cus_id) FROM customer join bill on customer.cus_id=bill.cus_id WHERE customer.cus_id = '" + userID + "'";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        int count = 0;
        while (rs.next()) {
            count = rs.getInt(1);
        }
        return count;
    }
}
