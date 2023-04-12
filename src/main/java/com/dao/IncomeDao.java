package com.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bean.ExpenseBean;
import com.bean.IncomeBean;

@Repository
public class IncomeDao {

		@Autowired
		JdbcTemplate stmt;

		public void insertIncome(IncomeBean incomeBean) {
			String insertQuery = "insert into income(title,date,userId,accountTypeId,statusId,description,amount) values(?,?,?,?,?,?,?)";
			stmt.update(insertQuery, incomeBean.getTitle(),incomeBean.getDate(),incomeBean.getUserId(),incomeBean.getAccountTypeId(),incomeBean.getStatusId(),incomeBean.getDescription(),incomeBean.getAmount());
		}
		
		/*
		 * public List<IncomeBean> getAllIncome(Integer userId) { String selectQuery =
		 * "select * from income where userId = ? "; List<IncomeBean> incomelist =
		 * stmt.query(selectQuery, new
		 * BeanPropertyRowMapper<IncomeBean>(IncomeBean.class),new Object[] {userId});
		 * return incomelist; }
		 */
		public List<IncomeBean> getAllIncome(Integer userId) {
			String selectQuery = "select i.title, i.amount,i.date,i.description, a.accountTypeName, s.statusName from income i, accounttype a, status s where i.accountTypeId=a.accountTypeId and s.statusId= i.statusId and userId = ?";
			List<IncomeBean> incomelist = stmt.query(selectQuery, new BeanPropertyRowMapper<IncomeBean>(IncomeBean.class),new Object[] {userId});
			return incomelist;
		}
}
