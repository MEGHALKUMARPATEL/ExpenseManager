package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.bean.ExpenseChartBean;
import com.bean.UserBean;
import com.dao.AdminDao;

@Controller
public class AdminController {
	
	@Autowired
	AdminDao adminDao;
	
	@GetMapping("/listusers")
	public String listUsers(Model model) {
		//pull all category from db-table
		List<UserBean> list = adminDao.getAllUsers();
		System.out.println(adminDao.getAllUsers());
		model.addAttribute("list",list);
		return "ListUser";
	}
	

	@GetMapping("/admindashboard")
	public String adminDashboard(Model model) {
		System.out.println("InSide admindashboard--url-method--00000000000sd");
		
		 //total Expense amount count
		Integer sumOfTodayExpenseAmount = adminDao.getSumOfOrderAmountForCurrentDate();
		Integer totalMonthlyExpenseCount = adminDao.getTotalExpenseCountForCurrentMonth();
		Integer totalMonthlyExpenseAmount = adminDao.getTotalExpenseAmountCurrentMonth();
		Integer totalMonthlyClientsCount = adminDao.getTotalClientCountForCurrentMonth();
		List<ExpenseChartBean> chartData = adminDao.getExpenseStats();

		System.out.println("Total monthly Expense"+totalMonthlyExpenseAmount);
		System.out.println("Sum of Today Expense"+sumOfTodayExpenseAmount);
		
		model.addAttribute("totalExpenseAmount",sumOfTodayExpenseAmount);
		model.addAttribute("totalExpense",totalMonthlyExpenseCount);
		model.addAttribute("totalExpenseAmountCurrentMonth", totalMonthlyExpenseAmount);
		model.addAttribute("totalMonthlyClientsCount", totalMonthlyClientsCount);
		model.addAttribute("chartData", chartData);
		return "AdminDashboard";
	}
	
	
}