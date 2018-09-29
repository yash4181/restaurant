package dao;

import java.util.List;
import model.Category;

public interface CategoryDAO {

    void insert(Category u);
    void update(Category u);
    void delete(int uid);
    
    Category getCategory(int uid);
    List<Category> getCategory();
}
