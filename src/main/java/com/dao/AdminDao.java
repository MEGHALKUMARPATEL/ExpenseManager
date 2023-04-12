package com.dao;

import java.time.LocalDate;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bean.ExpenseChartBean;
import com.bean.ExpenseChartBean;
import com.bean.UserBean;

@Repository
public class AdminDao {
	Calendar c = Calendar.getInstance(); 
	int d = c.get(c.DAY_OF_MONTH); //07 
	int m = c.get(c.MONTH)+1;//03
	int y = c.get(c.YEAR);
	
	public List<UserBean> getAllUsers() {
		String selectQuery = "select * from users where role = 2";
		List<UserBean> list = stmt.query(selectQuery, new BeanPropertyRowMapper<UserBean>(UserBean.class));
		return list;
	}
	
	
	@Autowired
	JdbcTemplate stmt;
	public Integer getSumOfOrderAmountForCurrentDate() {
		String countQuery = "select sum(amount) from expense where date like ?";
		
		
		Calendar c = Calendar.getInstance(); 
		int d = c.get(c.DAY_OF_MONTH); //07 
		int m = c.get(c.MONTH)+1;//03
		int y = c.get(c.YEAR);
		String today = "";
//		
		if(m<=9){
			today = y + "-0"+m;
		}else if(m>9){
			today = y + "-"+m; 
		}
		
		if(d <= 9){
			today = today + "-0" +d;
		}else if(d>10){
			today =today + "-" +d;
		}
		//2023 
		
		System.out.println(y+"-"+m+"-"+d);
		System.out.println("today date--"+today);
		
		
		return stmt.queryForObject(countQuery, Integer.class, new Object[] {today});
	}
	
	public Integer getTotalExpenseCountForCurrentMonth() {

		String countQuery = "select count(*) from expense where date like ?";

		// dd-mm-yyyy
		
		String currentMonth ="";
		
//		if(m<=9){
//			currentMonth = y + "-0"+m+ "-" +d; 
//		}else if(m>9){
//			currentMonth = y + "-"+m+ "-" +d; 
//		}
		
		if(m<=9){
			currentMonth = "%-" + "0"+m+ "-%"; 
		}else if(m>9){
			currentMonth = "%-" +m+ "-%"; 
		}

		/*
		 * String currentMonth = "%-" +m+ "-%";// 2023
		 */
		System.out.println(currentMonth);

		return stmt.queryForObject(countQuery, Integer.class, new Object[] {currentMonth});
	}

	public Integer getTotalClientCountForCurrentMonth() {
		
		String countQuery = "select count(*) from users where createdAt like ?";
		
		
		String currentMonth ="";
		
		if(m<=9){
			currentMonth = "%-" + "0"+m+ "-%"; 
		}else if(m>9){
			currentMonth = "%-" +m+ "-%"; 
		}
		
		return  stmt.queryForObject(countQuery, Integer.class, new Object[] {currentMonth}); 
	}
	
	public Integer getTotalExpenseAmountCurrentMonth() {
		
		String countQuery = "select sum(amount) from expense where date like ?";
		
		
		String currentMonth ="";
		
		if(m<=9){
			currentMonth = "%-" + "0"+m+ "-%"; 
		}else if(m>9){
			currentMonth = "%-" +m+ "-%"; 
		}
		System.out.println("currentmonth---"+currentMonth);
		
		return  stmt.queryForObject(countQuery, Integer.class, new Object[] {currentMonth});
	}

	public Double getYesterdayExpenseAmount() {
		String countChangeQuery = "select sum(amount) from expense where date like ?";
		
		
		LocalDate today = LocalDate.now();
		System.out.println(today);
		LocalDate yesterday = today.minusDays(1);
		int year = today.getYear();
		System.out.println(yesterday);
		//String yesterday = "";
	Double	yesterdayExp =  stmt.queryForObject(countChangeQuery, Double.class, new Object[] {yesterday});
		System.out.println("yesterdayExp---" +yesterdayExp);
		
		return yesterdayExp;
}

//	public List<ExpenseChartBean> getExpenseStats() {
//		String selectQuery = "select monthname(date) as month, sum(amount) as expenseAmount from expense where year(date) like ? group by monthname(date) order by month(date)";
//		LocalDate today = LocalDate.now();
//		Integer year = today.getYear();
//		System.out.println("year by local ----"+year);
//		
//	return stmt.query(selectQuery, new BeanPropertyRowMapper<ExpenseChartBean>(ExpenseChartBean.class), new Object[] {year});
//}
//
//	public List<IncomeChartBean> getIncomeStats() {
//		String selectQuery = "select monthname(date) as month, avg(amount) as incomeAmount from income where year(date) like ? group by monthname(date) order by month(date)";
//		LocalDate today = LocalDate.now();
//		Integer year = today.getYear();
//		return stmt.query(selectQuery, new BeanPropertyRowMapper<IncomeChartBean>(IncomeChartBean.class), new Object[] {year});
//	}
	
public List<ExpenseChartBean> getExpenseStats() {
		
		String selectQ = "select monthname(date) as month , sum(amount) as expenseAmount from expense where year(date) like ? group by monthname(date),month(date) order by month(date)";
		
		LocalDate today = LocalDate.now();
		Integer year = today.getYear();
		System.out.println("year by local ----" +year);
		return stmt.query(selectQ, new BeanPropertyRowMapper<ExpenseChartBean>(ExpenseChartBean.class), new Object[] {year});

	}
}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
