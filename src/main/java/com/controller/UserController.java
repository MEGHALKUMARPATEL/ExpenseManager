package com.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.dao.HomePageDao;

@Controller
public class UserController {
	
	@Autowired
	HomePageDao homePageDao;
	
	@GetMapping("/home")
		public String home(Model model, HttpServletRequest request) {
		
int userId = -1;
		
		Cookie c[] = request.getCookies();
		
			for(Cookie x : c) {
				if(x.getName().equals("userId")) {
					userId = Integer.parseInt(x.getValue());
				}
			}
			
//			System.out.println("userId---" + userId);
		
		Integer sumOfTodayExpense = homePageDao.getSumOfExpenseAmountForCurrentDate(userId);
		Integer sumOfMonthlyExpense = homePageDao.getSumOfExpenseAmountForCurrentMonth(userId);
		Integer sumOfMonthlyIncome = homePageDao.getSumOfIncomeAmountForCurrentMonth(userId);
			
				model.addAttribute("totalTodayExpensesAmount",sumOfTodayExpense);
				model.addAttribute("totalMonthlyExpenseAmount",sumOfMonthlyExpense);
				model.addAttribute("totalMonthlyIncomeAmount",sumOfMonthlyIncome);
			return "Home";
		}
	
}
