package com.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.bean.AccountTypeBean;
import com.bean.ExpenseBean;
import com.bean.IncomeBean;
import com.bean.StatusBean;
import com.dao.AccountTypeDao;
import com.dao.IncomeDao;
import com.dao.StatusDao;

@Controller
public class IncomeController {
	
	@Autowired
	AccountTypeDao accountTypeDao;
	@Autowired
	StatusDao statusDao;
	
	@Autowired
	IncomeDao incomeDao;
	
		@GetMapping("/addincomejsp")
		public String addIncome(Model model) {
			
			List<AccountTypeBean> accountTypeList = accountTypeDao.getAllAccountType();
			System.out.println(accountTypeDao.getAllAccountType());
			model.addAttribute("accountTypeList",accountTypeList);
			
			List<StatusBean> statusList = statusDao.getAllStatus();
			System.out.println(statusDao.getAllStatus());
			model.addAttribute("statusList",statusList);

			return "AddIncome";
		}
		
		@PostMapping("/saveincome")
		public String saveIncome(IncomeBean incomeBean, HttpServletRequest request) {
			
			int userId =-1;
			String firstName="";
			Cookie c[] = request.getCookies();
			for(Cookie x : c) {
				if (x.getName().equals("userId")) {
					userId = Integer.parseInt(x.getValue());
				}
				if(x.getName().equals("firstName")) {
					firstName = x.getValue();
				}
			}
			
			System.out.println(incomeBean.getTitle());
			System.out.println(incomeBean.getStatusId());
			
			incomeBean.setUserId(userId);
			incomeDao.insertIncome(incomeBean);
			return "redirect:/listincome";
		}
		
		@GetMapping("/listincome")
		public String listIncome(Model model, IncomeBean incomeBean, HttpServletRequest request) {
			
//
			int userId =-1;
			String firstName="";
			Cookie c[] = request.getCookies();
			for(Cookie x : c) {
				if (x.getName().equals("userId")) {
					userId = Integer.parseInt(x.getValue());
				}
				if(x.getName().equals("firstName")) {
					firstName = x.getValue();
				}
			}
			//pull all expense from db-table
			incomeBean.setUserId(userId);
			List<IncomeBean> incomelist = incomeDao.getAllIncome(userId);
			System.out.println(incomelist);
			model.addAttribute("incomelist",incomelist);
			return "ListIncome";
		}
		
}
