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
import com.bean.CategoryBean;
import com.bean.ExpenseBean;
import com.bean.StatusBean;
import com.bean.SubCategoryBean;
import com.bean.VendorBean;
import com.dao.AccountTypeDao;
import com.dao.CategoryDao;
import com.dao.ExpenseDao;
import com.dao.StatusDao;
import com.dao.SubCategoryDao;
import com.dao.VendorDao;

@Controller
public class ExpenseController {
	
	@Autowired
	CategoryDao categoryDao;
	@Autowired
	SubCategoryDao subCategoryDao;
	@Autowired
	VendorDao vendorDao;
	@Autowired
	AccountTypeDao accountTypeDao;
	@Autowired
	StatusDao statusDao;
	@Autowired
	ExpenseDao expenseDao;
	
	@GetMapping("/addexpensejsp")
	public String addExpense(Model model, HttpServletRequest request ) {
		
		
		
		List<CategoryBean> categoryList = categoryDao.getAllCategory();
		System.out.println(categoryDao.getAllCategory());
		model.addAttribute("categoryList",categoryList);
		
		List<SubCategoryBean> subCategoryList = subCategoryDao.getAllSubCagetgory();
		System.out.println(subCategoryDao.getAllSubCagetgory());
		model.addAttribute("subCategoryList",subCategoryList);
		
		
		List<VendorBean> vendorList = vendorDao.getAllVendor();
		System.out.println(vendorDao.getAllVendor());
		model.addAttribute("vendorList",vendorList);
		
		List<AccountTypeBean> accountTypeList = accountTypeDao.getAllAccountType();
		System.out.println(accountTypeDao.getAllAccountType());
		model.addAttribute("accountTypeList",accountTypeList);
		
		List<StatusBean> statusList = statusDao.getAllStatus();
		System.out.println(statusDao.getAllStatus());
		model.addAttribute("statusList",statusList);
		return "AddExpense";
	}
	
	@PostMapping("/saveexpense")
	public String saveExpense(ExpenseBean expenseBean, HttpServletRequest request) {
		
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
		
		System.out.println(expenseBean.getTitle());
		
		expenseBean.setUserId(userId);
		System.out.println(expenseBean.getUserId());
		expenseDao.insertExpense(expenseBean, request);
		return "redirect:/listexpense";
		
	}
	
	@GetMapping("/listexpense")
	public String listExpense(Model model, ExpenseBean expenseBean, HttpServletRequest request) {
		

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
		expenseBean.setUserId(userId);
		List<ExpenseBean> expenselist = expenseDao.getAllExpense(userId);
		System.out.println(expenselist);
		model.addAttribute("expenselist",expenselist);
		return "ListExpense";
	}

}
