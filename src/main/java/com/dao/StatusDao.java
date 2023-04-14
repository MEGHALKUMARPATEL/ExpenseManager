package com.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bean.CategoryBean;
import com.bean.StatusBean;

@Repository
public class StatusDao {

	@Autowired
	JdbcTemplate stmt;
	
	public void addStatus(StatusBean statusBean) {
		String insertQuery = "insert into status (statusName) values(?)";
		
		stmt.update(insertQuery, statusBean.getStatusName());//insert
	}
	
	public List<StatusBean> getAllStatus() {
		String selectQuery = "select * from status";
		List<StatusBean> list = stmt.query(selectQuery, new BeanPropertyRowMapper<StatusBean>(StatusBean.class));
		return list;
	}
	public void deleteStatus(Integer statusId) {

		stmt.update("delete from status where statusId = ?",statusId);
	}
}
