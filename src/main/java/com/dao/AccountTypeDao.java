package com.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bean.AccountTypeBean;


@Repository
public class AccountTypeDao {

		@Autowired
		JdbcTemplate stmt;
		
		
		public void addAccountType(AccountTypeBean accountTypeBean) {
			String insertQuery = "insert into accounttype (accountTypeName,deleted) values(?,?)";
			
			stmt.update(insertQuery, accountTypeBean.getAccountTypeName(),false);//insert
		}
		
		public List<AccountTypeBean> getAllAccountType() {
			String selectQuery = "select * from accounttype";
			List<AccountTypeBean> list = stmt.query(selectQuery, new BeanPropertyRowMapper<AccountTypeBean>(AccountTypeBean.class));
			return list;
		}
		
		public List<AccountTypeBean> getAvailableAccountType() {
			String selectQuery = "select * from accounttype where deleted = false";
			List<AccountTypeBean> list = stmt.query(selectQuery, new BeanPropertyRowMapper<AccountTypeBean>(AccountTypeBean.class));;
			return list;
		}

		public void deleteAccountType(Integer accountTypeId,boolean currentStatus) {
			currentStatus = !currentStatus;
			String updateQuery = "update accounttype set deleted = ? where accountTypeId = ?";
			stmt.update(updateQuery, currentStatus,accountTypeId);
			
		}

		public AccountTypeBean getAccountTypeById(Integer accountTypeId) {
			AccountTypeBean accountTypeBean = null;
			try {
					accountTypeBean = stmt.queryForObject("select * from accounttype where accountTypeId = ?",
							new BeanPropertyRowMapper<AccountTypeBean>(AccountTypeBean.class),new Object[] {accountTypeId});
				
			} catch (Exception e) {
				System.out.println("accountTypeDao :: getAccountTypeById()");
				System.out.println(e.getMessage());
			}
			return accountTypeBean;
		}

		public void updateAccountType(AccountTypeBean accountTypeBean) {
			String updateQuery = "update accounttype set accountTypeName = ? where accountTypeId = ?";
			stmt.update(updateQuery,accountTypeBean.getAccountTypeName(),accountTypeBean.getAccountTypeId());
			
		}

}
