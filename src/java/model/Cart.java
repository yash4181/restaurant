package model;


public class Cart {
 
    private int id;
    private String email;
    private int productId;
    private int qty;
    
    private String billingAddress;
    private String shippingAddress;

    public String getBillingAddress() {
        return billingAddress;
    }

    public void setBillingAddress(String billingAddress) {
        this.billingAddress = billingAddress;
    }

    public String getShippingAddress() {
        return shippingAddress;
    }

    public void setShippingAddress(String shippingAddress) {
        this.shippingAddress = shippingAddress;
    }
        
    private AddProduct product;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getQty() {
        return qty;
    }

    public void setQty(int qty) {
        this.qty = qty;
    }

    public AddProduct getProduct() {
        return product;
    }

    public void setProduct(AddProduct product) {
        this.product = product;
    }

    public Cart() {
    }

    @Override
    public String toString() {
        return "Cart{" + "id=" + id + ", email=" + email + ", productId=" + productId + ", qty=" + qty + ", billingAddress=" + billingAddress + ", shippingAddress=" + shippingAddress + ", product=" + product + '}';
    }

    
    



}
    
    
    
    

   