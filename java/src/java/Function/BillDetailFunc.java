/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Function;

import Entity.BillDetailEntity;
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
public class BillDetailFunc {

    PreparedStatement ps;
    ResultSet rs;

    public void insertBillDetail(BillDetailEntity bd) {
        Connection connection = DBConnect.getConnecttion();
        String sql = "INSERT INTO bill_detail(bill_id,pro_id,price,quantity) VALUES(?,?,?,?)";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, bd.getBillId());
            ps.setInt(2, bd.getProductId());
            ps.setDouble(3, bd.getPrice());
            ps.setInt(4, bd.getQuantity());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BillDetailFunc.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public boolean deleteBill(int billid) {
        Connection connection = DBConnect.getConnecttion();
        String sql = "delete from bill_detail where bill_id=?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, billid);
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(BillFunc.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public ArrayList<BillDetailEntity> getBillDetail(int billid) {
        Connection connection = DBConnect.getConnecttion();
        String sql = "select * from bill_detail join bill on bill_detail.bill_id=bill.bill_id join product "
                + "on bill_detail.pro_id=product.pro_id where bill_detail.bill_id='" + billid + "'";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            ArrayList<BillDetailEntity> list = new ArrayList<>();
            while (rs.next()) {
                BillDetailEntity bill = new BillDetailEntity();
                bill.setProname(rs.getString("pro_name"));
                bill.setQuantity(rs.getInt("quantity"));
                bill.setPrice(rs.getDouble("price"));
                list.add(bill);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(BillDetailFunc.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
}
