package com.dao;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bean.CategoryBean;
import com.bean.ExpenseBean;

@Repository
public class ExpenseDao {

	@Autowired
	JdbcTemplate stmt;
	
		public void insertExpense(ExpenseBean expenseBean, HttpServletRequest request) {
			
			int userId =-1;
			String firstName="";
			Cookie c[] = request.getCookies();
			for(Cookie x : c) {
				if (x.getName().equals("userId")) {
					userId = Integer.parseInt(x.getValue());
				}
				if(x.getName().equals("firstName")) {
					firstName = x.getValue();
				}
			}
			String insertQuery = "insert into expense(title,categoryId,subCategoryId,VendorId,accountTypeId,statusId,userId,amount,date,description) values(?,?,?,?,?,?,?,?,?,?)";
			stmt.update(insertQuery, expenseBean.getTitle(),expenseBean.getCategoryId(),expenseBean.getSubCategoryId(),expenseBean.getVendorId(),expenseBean.getAccountTypeId(),expenseBean.getStatusId(),expenseBean.getUserId(),expenseBean.getAmount(),expenseBean.getDate(),expenseBean.getDescription());
		}
		
		public List<ExpenseBean> getAllExpense(Integer userId) {
			String selectQuery = "select e.title,e.amount,e.date,e.description, c.categoryName, sc.subCategoryName, v.vendorName, a.accountTypeName, s.statusName from expense e, category c, subcategory sc, vendor v, accounttype a, status s where e.categoryId=c.categoryId and e.subCategoryId= sc.subCategoryId and e.vendorId= v.vendorId and e.accountTypeId= a.accountTypeId and e.statusId= s.statusId and userId=? ";
			List<ExpenseBean> expenselist = stmt.query(selectQuery, new BeanPropertyRowMapper<ExpenseBean>(ExpenseBean.class),new Object[] {userId});
			return expenselist;
		}
}
