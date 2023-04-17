 package com.controller;

import java.util.List;
import java.io.File;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.bean.ProfileBean;
import com.dao.AdminDao;

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
		/* List<IncomeChartBean> incomeChartData = adminDao.getIncomeStats(); */
		

		
//		Double yesterdayExpenseAmount = (Double.valueOf(adminDao.getYesterdayExpenseAmount()));
		
//		Integer a = 10;
//		Integer b = 20;
//		
//		Integer average = (a + b)/2;
//		System.out.println(average);
//		Integer difference = b-a; 
//		Integer change = ((difference * 100)/(average * 100))*100;
//		System.out.println(change);
		
//		Double average = (sumOfTodayExpenseAmount + yesterdayExpenseAmount) / 2;
//	    System.out.println(average);
		//	Integer changePercentage ;
//		Integer positiveChange=0 ;
//		Integer negativeChange=0;
//		Double difference = sumOfTodayExpenseAmount - yesterdayExpenseAmount;
//		System.out.println(difference);
//		if(difference > 0) {
//			positiveChange = (int) (((difference * 100)/(average * 100))*100);
//		} else if(difference < 0) {
//			negativeChange = (int) (((difference * 100)/(average * 100))*100);
		
		
//		System.out.println(positiveChange);
//		System.out.println(negativeChange);
		
//		System.out.println(changeInTodayExpenseAmount);
//		System.out.println(sumOfTodayExpenseAmount);
		

		System.out.println("Total monthly Expense"+totalMonthlyExpenseAmount);
		System.out.println("Sum of Today Expense"+sumOfTodayExpenseAmount);
		
		model.addAttribute("totalExpenseAmount",sumOfTodayExpenseAmount);
		model.addAttribute("totalExpense",totalMonthlyExpenseCount);
		model.addAttribute("totalExpenseAmountCurrentMonth", totalMonthlyExpenseAmount);
		model.addAttribute("totalMonthlyClientsCount", totalMonthlyClientsCount);
		model.addAttribute("chartData", chartData);
		/* model.addAttribute("incomeChartData",incomeChartData); */
		/* model.addAttribute("changeInTodayExpenseAmount",positiveChange); */
		//model.addAttribute("changeInTodayExpenseAmount",negativeChange);
		return "AdminDashboard";
	}
	
	@GetMapping("/myprofile")
	public String myprofile() {
		return "MyProfile";
	}

	@PostMapping("/saveprofilepic")
	public String saveProfilePic(ProfileBean profileBean) {
		System.out.println(profileBean.getUserId());
		System.out.println(profileBean.getProfileImg().getOriginalFilename());
		try {
			File userDir = new File(
					"C:\\Users\\admin\\Documents\\workspace-spring-tool-suite-4-4.17.2.RELEASE\\ExpenseManager\\src\\main\\resources\\static\\assets\\profiles",
					profileBean.getUserId() + "");
			System.out.println(profileBean.getUserId());
			if (userDir.exists() == false) {
				userDir.mkdir();
			}
			File file = new File(userDir, profileBean.getProfileImg().getOriginalFilename());
			FileUtils.writeByteArrayToFile(file, profileBean.getProfileImg().getBytes());
			profileBean.setImageUrl("assets/profiles/" + profileBean.getUserId() + "/"
					+ profileBean.getProfileImg().getOriginalFilename());
			
			adminDao.updateImageUrl(profileBean);
			
		} catch (Exception e) {
			e.printStackTrace();

		}
		return "redirect:/myprofile";
	}
	 
	
	
	
	
	
}