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
		

	/*	public List<ExpenseBean> getExpenseByUserId(Integer userId) {
			String selectQuery = "select e.expenseId, e.title,e.amount,e.date,e.description, c.categoryName, sc.subCategoryName, v.vendorName, a.accountTypeName, s.statusName from expense e, category c, subcategory sc, vendor v, accounttype a, status s where e.categoryId=c.categoryId and e.subCategoryId= sc.subCategoryId and e.vendorId= v.vendorId and e.accountTypeId= a.accountTypeId and e.statusId= s.statusId and userId=? order by expenseId desc; ";
			List<ExpenseBean> expenselist = stmt.query(selectQuery, new BeanPropertyRowMapper<ExpenseBean>(ExpenseBean.class),new Object[] {userId});
			return expenselist;
		}
		
		public ExpenseBean getExpenseById(Integer expenseId) {
			ExpenseBean expenseBean = null;
				
				try {
						expenseBean = stmt.queryForObject("select e.expenseId, e.title,e.amount,e.date,e.description, c.categoryName, sc.subCategoryName, v.vendorName, a.accountTypeName, s.statusName from expense e, category c, subcategory sc, vendor v, accounttype a, status s where e.categoryId=c.categoryId and e.subCategoryId= sc.subCategoryId and e.vendorId= v.vendorId and e.accountTypeId= a.accountTypeId and e.statusId= s.statusId and userId=? order by expenseId desc;",
								new BeanPropertyRowMapper<ExpenseBean>(ExpenseBean.class), new Object[] {expenseId });
					
				} catch (Exception e) {
						System.out.println("expenseDao :: getExpenseById()");
						System.out.println(e.getMessage());
				}
			return expenseBean;
		}


		public void updateExpense(ExpenseBean expenseBean) {
			String updateQuery = "update expense set title = ?, categoryId = ?, subCategoryId = ?, vendorId = ?, accountTypeId = ?, statusId = ?, amount = ?, date = ?, description = ? where expenseId = ?";
			stmt.update(updateQuery, expenseBean.getTitle(),expenseBean.getCategoryId(),expenseBean.getSubCategoryId(),expenseBean.getVendorId(),expenseBean.getAccountTypeId(),expenseBean.getStatusId(),expenseBean.getAmount(),expenseBean.getDate(),expenseBean.getDescription(),expenseBean.getExpenseId());
			
		}


		public void deleteExpense(ExpenseBean expenseBean) {
				stmt.update("delete from expense where expenseId = ?",expenseBean.getExpenseId());
				System.out.println("Expense Deleted");
			
		}


		public void addExpenseImg(ExpenseBean expenseBean) {
			stmt.update("update expense set imageUrl = ? where expenseId = ?", expenseBean.getImageUrl(),expenseBean.getExpenseId());
			System.out.println("Expense Photo updated");
			
		}
*/

		
}

