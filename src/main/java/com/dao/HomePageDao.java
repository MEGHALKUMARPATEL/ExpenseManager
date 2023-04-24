package com.dao;

import java.time.LocalDate;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bean.CategoryChartBean;
import com.bean.ExpenseChartBean;

@Repository
public class HomePageDao {
	@Autowired
	JdbcTemplate stmt;

	Calendar c = Calendar.getInstance();
	int d = c.get(c.DAY_OF_MONTH); // 07
	int m = c.get(c.MONTH) + 1;// 03
	int y = c.get(c.YEAR);
	
	
	LocalDate localDate = LocalDate.now();
	int day = localDate.getDayOfMonth();
	int month = localDate.getMonthValue();
	int year = localDate.getYear();
	String date ="";
//	System.out.println("day by local---" + day);
//	System.out.println("month by local---" + month);
//	System.out.println("year by local---" + year);

	public Integer getSumOfExpenseAmountForCurrentDate(int userId) {
//		System.out.println("userID => " + userId);
		String countQuery = "select sum(amount) from expense where userId = ? and date like ?";

//		String today = "";
//		
//		if(m<=9){
//			today = y + "-0"+m + "-" +d;
//		}else if(m>9){
//			today = y + "-"+m + d; 
//		}
//		
//		if(d <= 9){
//			today = today + "-0" +d;
//		}else if(d>10){
//			today =today + "-" +d;
//		}
		
		LocalDate today = LocalDate.now();
		System.out.println("today => " + today);
		Integer sumExpenseToday;

		// return stmt.queryForObject(countQuery, Integer.class, new Object[]{userId},
		// new Object[] {today});
		
		
			  try {
				  sumExpenseToday = stmt.queryForObject(countQuery, Integer.class, new Object[] { userId, today });
			  
			  } catch (Exception e) { 
				  return 0; 
			  }
			 
//		System.out.println("Date---" + today);
//		System.out.println("sumExp in dao " + sumExpenseToday);
		return sumExpenseToday;
	}

	public Integer getSumOfExpenseAmountForCurrentMonth(int userId) {
		String countQuery = "select sum(amount) from expense where userId = ? and date like ?";

		
		if(month<10) {
			date = year + "-0" + month + "-%";
		}else {
			date = year + "-" + month + "-%";
		}
		
		Integer sumExpenseMonthly=0;
		
//		System.out.println(date);
		
		try {
			sumExpenseMonthly = stmt.queryForObject(countQuery, Integer.class, new Object[] { userId, date });
		} catch (Exception e) {
			return 0;
		}
//		System.out.println(sumExpenseMonthly);
		return sumExpenseMonthly;
	}

	public Integer getSumOfIncomeAmountForCurrentMonth(int userId) {
		 String countQuery = "select sum(amount) from income where userId = ? and date like ?";
		 
		 if(month<10 ) {
			 date = year + "-0" + month + "-%";
		 }else  {
			 date = year + "-" + month + "-%";
		 }
		 
		 Integer sumIncomeMonthly;
		 try {
			 	sumIncomeMonthly = stmt.queryForObject(countQuery, Integer.class, new Object[] {userId, date});
			
		} catch (Exception e) {
			return 0;
		}
//		 System.out.println(sumIncomeMonthly);
		return sumIncomeMonthly;
	}

	 public Integer getSumOfExpenseAmountForCurrentYear(int userId) {
		String countQuery = "select sum(amount) from expense where userId = ? and date like ?";
		
		date = year + "%";
		Integer sumExpenseYearly;
		try {
				sumExpenseYearly = stmt.queryForObject(countQuery, Integer.class, new Object[] {userId, date});
		} catch (Exception e) {
			return 0;
		}
		return sumExpenseYearly;
	}
	 
	 public List<ExpenseChartBean> getExpenseStats(int userId) {
			String selectQuery = "select monthname(date) as month, sum(amount) as expenseAmount from expense where userId = ? and year(date) like ? group by monthname(date),month(date) order by month(date)";
			LocalDate today = LocalDate.now();
			Integer year = today.getYear();
			
			return stmt.query(selectQuery, new BeanPropertyRowMapper<ExpenseChartBean>(ExpenseChartBean.class), new Object[] {userId,year});
		}

		public List<CategoryChartBean> getCategoryStats(int userId) {
			String selectQuery = " SELECT c.categoryName, COUNT(*) AS categoryCount  FROM category c  JOIN expense e ON e.categoryId = c.categoryId where userId =? GROUP BY c.categoryName ORDER BY c.categoryName";
			return stmt.query(selectQuery, new BeanPropertyRowMapper<CategoryChartBean>(CategoryChartBean.class), new Object[] {userId});
		}

	

}
