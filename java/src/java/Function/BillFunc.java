/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Function;

import Entity.BillDetailEntity;
import Entity.BillEntity;
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
public class BillFunc {

    PreparedStatement ps;
    ResultSet rs;

    public void insert(BillEntity bill) {
        Connection connection = DBConnect.getConnecttion();
        String sql = "insert into bill(cus_id,total,payment,address,date) values (?,?,?,?,?)";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, bill.getUserId());
            ps.setDouble(2, bill.getTotal());
            ps.setString(3, bill.getPayment());
            ps.setString(4, bill.getAddress());
            ps.setTimestamp(5, bill.getDate());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BillFunc.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<BillEntity> getLastId() {
        Connection connection = DBConnect.getConnecttion();
        String sql = "select * from bill order by bill_id desc limit 1";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            ArrayList<BillEntity> list = new ArrayList<>();
            while (rs.next()) {
                BillEntity bill = new BillEntity();
                bill.setBillId(rs.getInt("bill_id"));
                bill.setUserId(rs.getInt("cus_id"));
                bill.setTotal(rs.getDouble("total"));
                bill.setPayment(rs.getString("payment"));
                bill.setAddress(rs.getString("address"));
                bill.setDate(rs.getTimestamp("date"));
                list.add(bill);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(BillFunc.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<BillEntity> getListBill() {
        try {
            Connection connection = DBConnect.getConnecttion();
            String sql = "SELECT * FROM bill join customer on bill.cus_id=customer.cus_id";
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            ArrayList<BillEntity> list = new ArrayList<>();
            while (rs.next()) {
                BillEntity bill = new BillEntity();
                bill.setBillId(rs.getInt("bill_id"));
                bill.setUserId(rs.getInt("cus_id"));
                bill.setTotal(rs.getDouble("total"));
                bill.setPayment(rs.getString("payment"));
                bill.setAddress(rs.getString("address"));
                bill.setDate(rs.getTimestamp("date"));
                bill.setStatus(rs.getInt("status"));
                bill.setUsname(rs.getString("fullname"));
                bill.setMobile(rs.getString("mobile"));
                list.add(bill);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(BillFunc.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public boolean updatebill(int status, int billid) {
        Connection connection = DBConnect.getConnecttion();
        String sql = "update bill set status='" + status + "' where bill_id='" + billid + "'";
        try {
            ps = connection.prepareStatement(sql);
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(BillFunc.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean deleteBill(int billid) {
        Connection connection = DBConnect.getConnecttion();
        String sql = "delete from bill where bill_id=?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, billid);
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(BillFunc.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public ArrayList<BillEntity> getListBillbyID(int billid) {
        try {
            Connection connection = DBConnect.getConnecttion();
            String sql = "SELECT * FROM bill join customer on bill.cus_id=customer.cus_id where bill_id='" + billid + "'";
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            ArrayList<BillEntity> list = new ArrayList<>();
            while (rs.next()) {
                BillEntity bill = new BillEntity();
                bill.setBillId(rs.getInt("bill_id"));
                bill.setUserId(rs.getInt("cus_id"));
                bill.setTotal(rs.getDouble("total"));
                bill.setPayment(rs.getString("payment"));
                bill.setAddress(rs.getString("address"));
                bill.setDate(rs.getTimestamp("date"));
                bill.setStatus(rs.getInt("status"));
                bill.setUsname(rs.getString("fullname"));
                bill.setMobile(rs.getString("mobile"));
                list.add(bill);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(BillFunc.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public ArrayList<BillEntity> getListBillbyCusId(int cusid) {
        try {
            Connection connection = DBConnect.getConnecttion();
            String sql = "SELECT * FROM bill join customer on bill.cus_id=customer.cus_id where customer.cus_id='" + cusid + "'";
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            ArrayList<BillEntity> list = new ArrayList<>();
            while (rs.next()) {
                BillEntity bill = new BillEntity();
                bill.setBillId(rs.getInt("bill_id"));
                bill.setUserId(rs.getInt("cus_id"));
                bill.setTotal(rs.getDouble("total"));
                bill.setPayment(rs.getString("payment"));
                bill.setAddress(rs.getString("address"));
                bill.setDate(rs.getTimestamp("date"));
                bill.setStatus(rs.getInt("status"));
                bill.setUsname(rs.getString("fullname"));
                bill.setMobile(rs.getString("mobile"));
                list.add(bill);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(BillFunc.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
