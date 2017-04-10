/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Function;

import Entity.CategoryEntity;
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
public class CategoryFunc {

    public static PreparedStatement ps;
    public static ResultSet rs;

    public ArrayList<CategoryEntity> getListCategory() {
        Connection con = DBConnect.getConnecttion();
        String sql = "select * from category";
        ArrayList<CategoryEntity> cate = new ArrayList<>();
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                CategoryEntity cateen = new CategoryEntity();
                cateen.setCategory_id(rs.getInt("cat_id"));
                cateen.setCategory_name(rs.getString("cat_name"));
                cateen.setCategory_image(rs.getString("cat_image"));
                cate.add(cateen);
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(CategoryFunc.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cate;
    }

    public ArrayList<CategoryEntity> getListCategoryByCategory(int category_id) throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT * FROM category WHERE cat_id = '" + category_id + "'";
        ArrayList<CategoryEntity> cate = new ArrayList<>();
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                CategoryEntity cateen = new CategoryEntity();
                cateen.setCategory_id(rs.getInt("cat_id"));
                cateen.setCategory_name(rs.getString("cat_name"));
                cateen.setCategory_image(rs.getString("cat_image"));
                cate.add(cateen);
            }
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(CategoryFunc.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cate;
    }

    public ArrayList<CategoryEntity> getListCategoryByName(String name) {
        Connection con = DBConnect.getConnecttion();
        String sql = "select * from category where cat_name='"+name+"'";
        ArrayList<CategoryEntity> cate = new ArrayList<>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                CategoryEntity cateen = new CategoryEntity();
                cateen.setCategory_id(rs.getInt("cat_id"));
                cateen.setCategory_name(rs.getString("cat_name"));
                cateen.setCategory_image(rs.getString("cat_image"));
                cate.add(cateen);
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(UserFunc.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cate;
    }
    
    // thêm mới dữ liệu
    public boolean insertCategory(CategoryEntity c) throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "INSERT INTO category(cat_name,cat_image) VALUES(?,?)";
        try {
            ps = connection.prepareCall(sql);
            ps.setString(1, c.getCategory_name());
            ps.setString(2, c.getCategory_image());
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(CategoryFunc.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    // cập nhật dữ liệu
    public boolean updateCategory(String name, String image, int id) throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "UPDATE category SET cat_name = '" + name + "', cat_image = '" + image + "' WHERE cat_id = '" + id + "'";
        try {
            ps = connection.prepareCall(sql);
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(CategoryFunc.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    // xóa dữ liệu
    public boolean deleteCategory(int category_id) throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "DELETE FROM category WHERE cat_id = ?";
        try {
            ps = connection.prepareCall(sql);
            ps.setInt(1, category_id);
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(CategoryFunc.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

//    public static void main(String[] args) throws SQLException {
//        CategoryFunc dao = new CategoryFunc();
////        for (int i = 1; i < 10; i++) {
//            System.out.println(dao.insertCategory("tung","dasd"));
////        }
////        System.out.println(dao.updateCategory("tundg", "Tùng Dương", "2"));
////        System.out.println(dao.deleteCategory(1));
//    }
}
