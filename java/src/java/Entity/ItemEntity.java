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
public class ItemEntity {
    private ProductEntity product;
    private int quantity;

    public ItemEntity() {
    }

    public ItemEntity(ProductEntity product, int quantity) {
        this.product = product;
        this.quantity = quantity;
    }

    /**
     * @return the product
     */
    public ProductEntity getProduct() {
        return product;
    }

    /**
     * @param product the product to set
     */
    public void setProduct(ProductEntity product) {
        this.product = product;
    }

    /**
     * @return the quantity
     */
    public int getQuantity() {
        return quantity;
    }

    /**
     * @param quantity the quantity to set
     */
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
}
