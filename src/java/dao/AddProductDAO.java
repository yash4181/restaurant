package dao;

import java.util.List;
import model.AddProduct;

public interface AddProductDAO {

    void insert(AddProduct u);
    void update(AddProduct u);
    void delete(int uid);
    
    AddProduct getAddProduct(int uid);
    List<AddProduct> getAddProduct();
}
