/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

/**
 *
 * @author TungVoDoi
 */
public class ProductEntity {
    private int pro_id;
    private int cat_id;
    private String pro_name;
    private double pro_price;
    private String pro_image;
    private String pro_descrip;
    private String pro_color;
    private int pro_yearsx;
    private String cat_name;

    public ProductEntity(int pro_id, int cat_id, String pro_name, double pro_price, String pro_image, String pro_descrip, String pro_color, int pro_yearsx) {
        this.pro_id = pro_id;
        this.cat_id = cat_id;
        this.pro_name = pro_name;
        this.pro_price = pro_price;
        this.pro_image = pro_image;
        this.pro_descrip = pro_descrip;
        this.pro_color = pro_color;
        this.pro_yearsx = pro_yearsx;
    }

    public ProductEntity( int cat_id, String pro_name, double pro_price, String pro_image, String pro_descrip, String pro_color, int pro_yearsx) {
        this.cat_id = cat_id;
        this.pro_name = pro_name;
        this.pro_price = pro_price;
        this.pro_image = pro_image;
        this.pro_descrip = pro_descrip;
        this.pro_color = pro_color;
        this.pro_yearsx = pro_yearsx;
    }

    public ProductEntity() {
    }

    /**
     * @return the pro_id
     */
    public int getPro_id() {
        return pro_id;
    }

    /**
     * @param pro_id the pro_id to set
     */
    public void setPro_id(int pro_id) {
        this.pro_id = pro_id;
    }

    /**
     * @return the cat_id
     */
    public int getCat_id() {
        return cat_id;
    }

    /**
     * @param cat_id the cat_id to set
     */
    public void setCat_id(int cat_id) {
        this.cat_id = cat_id;
    }

    /**
     * @return the pro_name
     */
    public String getPro_name() {
        return pro_name;
    }

    /**
     * @param pro_name the pro_name to set
     */
    public void setPro_name(String pro_name) {
        this.pro_name = pro_name;
    }

    /**
     * @return the pro_price
     */
    public double getPro_price() {
        return pro_price;
    }

    /**
     * @param pro_price the pro_price to set
     */
    public void setPro_price(double pro_price) {
        this.pro_price = pro_price;
    }

    /**
     * @return the pro_image
     */
    public String getPro_image() {
        return pro_image;
    }

    /**
     * @param pro_image the pro_image to set
     */
    public void setPro_image(String pro_image) {
        this.pro_image = pro_image;
    }

    /**
     * @return the pro_descrip
     */
    public String getPro_descrip() {
        return pro_descrip;
    }

    /**
     * @param pro_descrip the pro_descrip to set
     */
    public void setPro_descrip(String pro_descrip) {
        this.pro_descrip = pro_descrip;
    }

    /**
     * @return the pto_color
     */
    public String getPro_color() {
        return pro_color;
    }

    /**
     * @param pto_color the pto_color to set
     */
    public void setPro_color(String pro_color) {
        this.pro_color = pro_color;
    }

    /**
     * @return the pro_yearsx
     */
    public int getPro_yearsx() {
        return pro_yearsx;
    }

    /**
     * @param pro_yearsx the pro_yearsx to set
     */
    public void setPro_yearsx(int pro_yearsx) {
        this.pro_yearsx = pro_yearsx;
    }

    /**
     * @return the cat_name
     */
    public String getCat_name() {
        return cat_name;
    }

    /**
     * @param cat_name the cat_name to set
     */
    public void setCat_name(String cat_name) {
        this.cat_name = cat_name;
    }
}
