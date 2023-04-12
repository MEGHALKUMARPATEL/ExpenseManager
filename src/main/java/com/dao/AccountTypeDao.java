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
			String selectQuery = "select * from accounttype where deleted=false";
			List<AccountTypeBean> list = stmt.query(selectQuery, new BeanPropertyRowMapper<AccountTypeBean>(AccountTypeBean.class));
			return list;
		}

		public void deleteAccountType(Integer accountTypeId) {
			String updateQuery = "update accounttype set deleted = true where accountTypeId = ?";
			stmt.update(updateQuery,accountTypeId);
		}
}
