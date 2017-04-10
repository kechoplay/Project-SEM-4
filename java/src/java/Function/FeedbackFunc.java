/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Function;

import Entity.FeedbackEntity;
import Entity.ProductEntity;
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
public class FeedbackFunc {

    public static PreparedStatement ps;
    public static ResultSet rs;

    public ArrayList<FeedbackEntity> getListFeedbackById(int proid) throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "select * from feedback JOIN customer on feedback.cus_id=customer.cus_id JOIN "
                + "product on feedback.pro_id=product.pro_id where feedback.feed_status = 1 and product.pro_id='" + proid + "' order by feed_id desc";
        PreparedStatement ps = connection.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<FeedbackEntity> list = new ArrayList<>();
        while (rs.next()) {
            FeedbackEntity feed = new FeedbackEntity();
            feed.setCusid(rs.getInt("cus_id"));
            feed.setContent(rs.getString("feed_content"));
            feed.setDate(rs.getTimestamp("feed_date"));
            feed.setName(rs.getString("fullname"));
            list.add(feed);
        }
        return list;
    }

    public ArrayList<FeedbackEntity> getListFeedback() throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "select * from feedback JOIN customer on feedback.cus_id=customer.cus_id JOIN "
                + "product on feedback.pro_id=product.pro_id";
        PreparedStatement ps = connection.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<FeedbackEntity> list = new ArrayList<>();
        while (rs.next()) {
            FeedbackEntity feed = new FeedbackEntity();
            feed.setFeedid(rs.getInt("feed_id"));
            feed.setCusid(rs.getInt("cus_id"));
            feed.setProid(rs.getInt("pro_id"));
            feed.setContent(rs.getString("feed_content"));
            feed.setDate(rs.getTimestamp("feed_date"));
            feed.setStatus(rs.getInt("feed_status"));
            feed.setName(rs.getString("fullname"));
            feed.setProname(rs.getString("pro_name"));
            list.add(feed);
        }
        return list;
    }

    public boolean insertFeedback(FeedbackEntity f) throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "INSERT INTO feedback (cus_id,pro_id,feed_content) VALUES(?,?,?)";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, f.getCusid());
            ps.setInt(2, f.getProid());
            ps.setString(3, f.getContent());
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            throw new SQLException("Can not insert product");
        }
    }

    // cập nhật dữ liệu
    public boolean updateFeedback(int status, int feedid) throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "UPDATE feedback SET feed_status='" + status + "' where feed_id='" + feedid + "'";
        try {
            ps = connection.prepareStatement(sql);
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackFunc.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean deleteFeedback(int feedid) {
        Connection connection = DBConnect.getConnecttion();
        String sql = "delete from feedback where feed_id='" + feedid + "'";
        try {
            ps = connection.prepareStatement(sql);
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackFunc.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public boolean deleteFeedbackByProduct(int proid) {
        Connection connection = DBConnect.getConnecttion();
        String sql = "delete from feedback where pro_id='" + proid + "'";
        try {
            ps = connection.prepareStatement(sql);
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackFunc.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
}
