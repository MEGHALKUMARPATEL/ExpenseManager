package com.dao;

import java.time.LocalDate;
import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

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

		String today = "";
//		
		if(m<=9){
			today = y + "-0"+m + "-" +d;
		}else if(m>9){
			today = y + "-"+m + d; 
		}
		
		if(d <= 9){
			today = today + "-0" +d;
		}else if(d>10){
			today =today + "-" +d;
		}
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
	
	
	

}
