/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author star
 */
@Entity
@Table(name = "PRODUCTS")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Products.findAll", query = "SELECT p FROM Products p"),
    
    @NamedQuery(name = "Products.findAllOrderByNameAsc", query = "SELECT p FROM Products p ORDER BY p.productTitle ASC"),
    @NamedQuery(name = "Products.findAllOrderByNameDesc", query = "SELECT p FROM Products p ORDER BY p.productTitle DESC"),
    @NamedQuery(name = "Products.findAllOrderByPriceAsc", query = "SELECT p FROM Products p ORDER BY p.productAmount ASC"),
    @NamedQuery(name = "Products.findAllOrderByPriceDesc", query = "SELECT p FROM Products p ORDER BY p.productAmount DESC"),
    
    
    @NamedQuery(name = "Products.findByProductId", query = "SELECT p FROM Products p WHERE p.productId = :productId"),
    @NamedQuery(name = "Products.findByProductTitle", query = "SELECT p FROM Products p WHERE lower(p.productTitle) LIKE :productTitle"),
    
    @NamedQuery(name = "Products.findByProductTitleOrderByNameAsc", query = "SELECT p FROM Products p WHERE lower(p.productTitle) LIKE :productTitle ORDER BY p.productTitle ASC"),
    @NamedQuery(name = "Products.findByProductTitleOrderByNameDesc", query = "SELECT p FROM Products p WHERE lower(p.productTitle) LIKE :productTitle ORDER BY p.productTitle DESC"),
    @NamedQuery(name = "Products.findByProductTitleOrderByPriceAsc", query = "SELECT p FROM Products p WHERE lower(p.productTitle) LIKE :productTitle ORDER BY p.productAmount ASC"),
    @NamedQuery(name = "Products.findByProductTitleOrderByPriceDesc", query = "SELECT p FROM Products p WHERE lower(p.productTitle) LIKE :productTitle ORDER BY p.productAmount DESC"),
    
    @NamedQuery(name = "Products.findByProductDateStart", query = "SELECT p FROM Products p WHERE p.productDateStart = :productDateStart"),
    @NamedQuery(name = "Products.findByProductImage", query = "SELECT p FROM Products p WHERE p.productImage = :productImage"),
    @NamedQuery(name = "Products.findByProductStock", query = "SELECT p FROM Products p WHERE p.productStock = :productStock"),
    @NamedQuery(name = "Products.findByProductAmount", query = "SELECT p FROM Products p WHERE p.productAmount = :productAmount"),
    @NamedQuery(name = "Products.findByProductSize", query = "SELECT p FROM Products p WHERE p.productSize = :productSize"),
    @NamedQuery(name = "Products.findByProductCategories", query = "SELECT p FROM Products p WHERE p.productCategories = :productCategories"),})
public class Products implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "PRODUCT_ID")
    private Integer productId;
    @Size(max = 100)
    @Column(name = "PRODUCT_TITLE")
    private String productTitle;
    @Size(max = 100)
    @Column(name = "PRODUCT_DATE_START")
    private String productDateStart;
    @Size(max = 100)
    @Column(name = "PRODUCT_IMAGE")
    private String productImage;
    @Column(name = "PRODUCT_STOCK")
    private Integer productStock;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "PRODUCT_AMOUNT")
    private double productAmount;
    @Size(max = 100)
    @Column(name = "PRODUCT_SIZE")
    private String productSize;
    @Size(max = 100)
    @Column(name = "PRODUCT_CATEGORIES")
    private String productCategories;

    public Products() {
    }

    public Products(Integer productId) {
        this.productId = productId;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public String getProductTitle() {
        return productTitle;
    }

    public void setProductTitle(String productTitle) {
        this.productTitle = productTitle;
    }

    public String getProductDateStart() {
        return productDateStart;
    }

    public void setProductDateStart(String productDateStart) {
        this.productDateStart = productDateStart;
    }

    public String getProductImage() {
        return productImage;
    }

    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }

    public Integer getProductStock() {
        return productStock;
    }

    public void setProductStock(Integer productStock) {
        this.productStock = productStock;
    }

    public double getProductAmount() {
        return productAmount;
    }

    public void setProductAmount(double productAmount) {
        this.productAmount = productAmount;
    }

    public String getProductSize() {
        return productSize;
    }

    public void setProductSize(String productSize) {
        this.productSize = productSize;
    }

    public String getProductCategories() {
        return productCategories;
    }

    public void setProductCategories(String productCategories) {
        this.productCategories = productCategories;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (productId != null ? productId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Products)) {
            return false;
        }
        Products other = (Products) object;
        if ((this.productId == null && other.productId != null) || (this.productId != null && !this.productId.equals(other.productId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Products[ productId=" + productId + " ]";
    }

    public Products(int productId, String productTitle, String productDateStart, String productImage, int productStock, double productAmount, String productSize, String productCategories) {
        this.productId = productId;
        this.productTitle = productTitle;
        this.productImage = productImage;
        this.productDateStart = productDateStart;
        this.productStock = productStock;
        this.productAmount = productAmount;
        this.productSize = productSize;
        this.productCategories = productCategories;
    }

    public Products(int productId, String productTitle, String productDateStart, int productStock, double productAmount, String productSize, String productCategories) {
        this.productId = productId;
        this.productTitle = productTitle;
        this.productDateStart = productDateStart;
        this.productStock = productStock;
        this.productAmount = productAmount;
        this.productSize = productSize;
        this.productCategories = productCategories;
    }

    public Products(String productTitle, String productDateStart, String productImage, int productStock, double productAmount, String productSize, String productCategories) {
        this.productTitle = productTitle;
        this.productImage = productImage;
        this.productDateStart = productDateStart;
        this.productStock = productStock;
        this.productAmount = productAmount;
        this.productSize = productSize;
        this.productCategories = productCategories;
    }

}
