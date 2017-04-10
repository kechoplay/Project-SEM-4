/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author TungVoDoi
 */
public class CartEntity {

    private HashMap<Integer, ItemEntity> cartItem;

    public CartEntity() {
        cartItem = new HashMap<>();
    }

    public CartEntity(HashMap<Integer, ItemEntity> cartItem) {
        this.cartItem = cartItem;
    }

    /**
     * @return the cartItem
     */
    public HashMap<Integer, ItemEntity> getCartItem() {
        return cartItem;
    }

    /**
     * @param cartItem the cartItem to set
     */
    public void setCartItem(HashMap<Integer, ItemEntity> cartItem) {
        this.cartItem = cartItem;
    }

    public void plusToCart(Integer key, ItemEntity item) {
        boolean check = cartItem.containsKey(key);
        if (check) {
            int quantity_old = item.getQuantity();
            item.setQuantity(quantity_old + 1);
            cartItem.put(key, item);
        } else {
            cartItem.put(key, item);
        }
    }

    // sub to cart
    public void subToCart(Integer key, ItemEntity item, int sl) {
        boolean check = cartItem.containsKey(key);
        if (check) {
            int quantity_old = item.getQuantity();
            if ((sl == 0)) {
                cartItem.remove(key);
            } else if (sl > 0) {
                item.setQuantity(sl);
                cartItem.put(key, item);
            }
        }
    }

    // remove to cart
    public void removeToCart(Integer key) {
        boolean check = cartItem.containsKey(key);
        if (check) {
            cartItem.remove(key);
        }
    }

    // count item
    public int countItem() {
        return cartItem.size();
    }

    // sum total 
    public double totalCart() {
        double count = 0;
        // count = price * quantity
        for (Map.Entry<Integer, ItemEntity> list : cartItem.entrySet()) {
            count += list.getValue().getProduct().getPro_price() * list.getValue().getQuantity();
        }
        return count;
    }
}
