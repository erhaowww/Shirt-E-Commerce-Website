/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author user
 */
public class RatingReviewChart {
    
    private Long totalRating;
    private String product_name;

    public RatingReviewChart(Long totalRating, String product_name) {
        this.totalRating = totalRating;
        this.product_name = product_name;
    }

    public Long getTotalRating() {
        return totalRating;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setTotalRating(Long totalRating) {
        this.totalRating = totalRating;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }
    
    
    
}
