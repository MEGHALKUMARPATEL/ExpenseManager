package com.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bean.CategoryBean;
import com.bean.SubCategoryBean;

@Repository
public class SubCategoryDao {
	@Autowired
	JdbcTemplate stmt;
	
	public void addSubCategory(SubCategoryBean subCategoryBean) {
		String insertQuery = "insert into subcategory (subcategoryName,categoryId,deleted) values(?,?,?)";
		
		stmt.update(insertQuery, subCategoryBean.getSubCategoryName(),subCategoryBean.getCategoryId(),false);
	}
	public List<SubCategoryBean> getAllSubCagetgory() {
		
		String joinQuery = "select c.categoryName , sc.categoryId,sc.subCategoryId,sc.subCategoryName,sc.deleted from category c , subcategory sc where c.categoryId = sc.categoryId and sc.deleted = false";
		return stmt.query(joinQuery,new BeanPropertyRowMapper<SubCategoryBean>(SubCategoryBean.class));
	}
	public void deleteSubCategory(Integer subCategoryId) {
		String updateQuery = "update subcategory set deleted = true where subCategoryId = ?";
		stmt.update(updateQuery,subCategoryId);
		
	}
	public SubCategoryBean getSubCategoryById(Integer subCategoryId) {
		SubCategoryBean subCategoryBean=new SubCategoryBean();
		
			try {
				
					subCategoryBean = stmt.queryForObject("select * from subcategory,category where subcategory.subcategoryId = ? and category.categoryId=subCategory.categoryId ",
							new BeanPropertyRowMapper<SubCategoryBean>(SubCategoryBean.class), new Object[] {subCategoryId });
				
			} catch (Exception e) {
				System.out.println("SubCategoryDao :: getSubCategoryById()");
				System.out.println(e.getMessage());
			}
			return subCategoryBean;
	}
}
