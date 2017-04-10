/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Function;

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
public class ProductFunc {

    public static PreparedStatement ps;
    public static ResultSet rs;

    public ArrayList<ProductEntity> getListProduct() {
        Connection con = DBConnect.getConnecttion();
        String sql = "select * from product join category on product.cat_id=category.cat_id";
        ArrayList<ProductEntity> listPro = new ArrayList<>();
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                ProductEntity product = new ProductEntity();
                product.setPro_id(rs.getInt("pro_id"));
                product.setCat_id(rs.getInt("cat_id"));
                product.setPro_name(rs.getString("pro_name"));
                product.setPro_price(rs.getFloat("pro_price"));
                product.setPro_image(rs.getString("pro_image"));
                product.setPro_descrip(rs.getString("pro_descrip"));
                product.setPro_color(rs.getString("pro_color"));
                product.setPro_yearsx(rs.getInt("pro_yearsx"));
                product.setCat_name(rs.getString("cat_name"));
                listPro.add(product);
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(ProductFunc.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listPro;
    }

    // thêm mới dữ liệu
    public boolean insertProduct(ProductEntity p) throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "INSERT INTO product (cat_id,pro_name,pro_price,pro_image,pro_descrip,pro_color,pro_yearsx) VALUES(?,?,?,?,?,?,?)";
        try {
            ps = connection.prepareCall(sql);
            ps.setInt(1, p.getCat_id());
            ps.setString(2, p.getPro_name());
            ps.setDouble(3, p.getPro_price());
            ps.setString(4, p.getPro_image());
            ps.setString(5, p.getPro_descrip());
            ps.setString(6, p.getPro_color());
            ps.setInt(7, p.getPro_yearsx());
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            throw new SQLException("Can not insert product");
        }
    }

    // cập nhật dữ liệu
    public boolean updateProduct(int catid, String name, double price, String image, String descrip, String color, int yearsx, int proid) throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "UPDATE product SET cat_id='" + catid + "', pro_name = '" + name + "', pro_price='" + price + "', pro_image = '" + image + "', "
                + "pro_descrip='" + descrip + "',pro_color='" + color + "',pro_yearsx='" + yearsx + "' WHERE pro_id = '" + proid + "'";
        try {
            ps = connection.prepareCall(sql);
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(ProductFunc.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    // xóa dữ liệu
    public boolean deleteProduct(int product_id) throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "DELETE FROM product WHERE pro_id = ?";
        try {
            ps = connection.prepareCall(sql);
            ps.setInt(1, product_id);
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(ProductFunc.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public ArrayList<ProductEntity> getListProductByCategory(int category_id) throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT * FROM product WHERE cat_id = '" + category_id + "'";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<ProductEntity> list = new ArrayList<>();
        while (rs.next()) {
            ProductEntity product = new ProductEntity();
            product.setPro_id(rs.getInt("pro_id"));
            product.setCat_id(rs.getInt("cat_id"));
            product.setPro_name(rs.getString("pro_name"));
            product.setPro_price(rs.getFloat("pro_price"));
            product.setPro_image(rs.getString("pro_image"));
            product.setPro_descrip(rs.getString("pro_descrip"));
            product.setPro_color(rs.getString("pro_color"));
            product.setPro_yearsx(rs.getInt("pro_yearsx"));
            list.add(product);
        }
        return list;
    }

    public ArrayList<ProductEntity> getListProductByName(String proname) throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT * FROM product WHERE pro_name like '%" + proname + "%' ";
        PreparedStatement ps = connection.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<ProductEntity> list = new ArrayList<>();
        while (rs.next()) {
            ProductEntity product = new ProductEntity();
            product.setPro_id(rs.getInt("pro_id"));
            product.setCat_id(rs.getInt("cat_id"));
            product.setPro_name(rs.getString("pro_name"));
            product.setPro_price(rs.getFloat("pro_price"));
            product.setPro_image(rs.getString("pro_image"));
            product.setPro_descrip(rs.getString("pro_descrip"));
            product.setPro_color(rs.getString("pro_color"));
            product.setPro_yearsx(rs.getInt("pro_yearsx"));
            list.add(product);
        }
        return list;
    }
    // hiển thị chi tiết sản phẩm
    public ProductEntity getProduct(int productID) throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT * FROM product WHERE pro_id = '" + productID + "'";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ProductEntity product = new ProductEntity();
        while (rs.next()) {
            product.setPro_id(rs.getInt("pro_id"));
            product.setCat_id(rs.getInt("cat_id"));
            product.setPro_name(rs.getString("pro_name"));
            product.setPro_price(rs.getFloat("pro_price"));
            product.setPro_image(rs.getString("pro_image"));
            product.setPro_descrip(rs.getString("pro_descrip"));
            product.setPro_color(rs.getString("pro_color"));
            product.setPro_yearsx(rs.getInt("pro_yearsx"));
        }
        return product;
    }

    // lấy danh sách sản phẩm
    public ArrayList<ProductEntity> getListProductByNav(int categoryID, int firstResult, int maxResult) throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT * FROM product WHERE cat_id = '" + categoryID + "' limit ?,?";
        PreparedStatement ps = connection.prepareCall(sql);
        ps.setInt(1, firstResult);
        ps.setInt(2, maxResult);
        ResultSet rs = ps.executeQuery();
        ArrayList<ProductEntity> list = new ArrayList<>();
        while (rs.next()) {
            ProductEntity product = new ProductEntity();
            product.setPro_id(rs.getInt("pro_id"));
            product.setCat_id(rs.getInt("cat_id"));
            product.setPro_name(rs.getString("pro_name"));
            product.setPro_price(rs.getFloat("pro_price"));
            product.setPro_image(rs.getString("pro_image"));
            product.setPro_descrip(rs.getString("pro_descrip"));
            product.setPro_color(rs.getString("pro_color"));
            product.setPro_yearsx(rs.getInt("pro_yearsx"));
            list.add(product);
        }
        return list;
    }

    // tính tổng sản phẩm
    public int countProductByCategory(int categoryID) throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT count(pro_id) FROM product WHERE cat_id = '" + categoryID + "'";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        int count = 0;
        while (rs.next()) {
            count = rs.getInt(1);
        }
        return count;
    }
    
    public int countProductByBill(int proid) throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "select * from product join bill_detail on product.pro_id=bill_detail.pro_id join bill"
                + " on bill_detail.bill_id=bill.bill_id where product.pro_id= '" + proid + "'";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        int count = 0;
        while (rs.next()) {
            count = rs.getInt(1);
        }
        return count;
    }

//    public static void main(String[] args) throws SQLException {
//        ProductFunc dao = new ProductFunc();
////        for (ProductEntity p : dao.getListProductByCategory(23)) {
////            System.out.println(p.getPro_id() + " - " + p.getPro_name());
////        }
//        System.out.println(dao.countProductByCategory(1));
//    }
}
