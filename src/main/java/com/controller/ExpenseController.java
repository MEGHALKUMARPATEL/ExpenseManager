package com.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
		List<ExpenseBean> expenselist = expenseDao.getExpenseByUserId(userId);
		System.out.println(expenselist);
		model.addAttribute("expenselist",expenselist);
		return "ListExpense";
	}
	
	@GetMapping("/viewexpense")
	public String viewExpense(@RequestParam("expenseId") Integer expenseId, Model model) {
		System.out.println("ExpenseId by controller"+expenseId);
		ExpenseBean expenseBean = expenseDao.getExpenseById(expenseId);
		model.addAttribute("expenseBean",expenseBean);
		System.out.println("ExpenseId by controller"+expenseId);
//		System.out.println(expenseBean.getExpenseImg().getOriginalFilename());
//		System.out.println(expenseBean.getImageUrl());
		return "ViewExpense";
	}
	
	@GetMapping("/listexpenseadmin")
	public String listExpensesAdmin(Model model) {
		List<ExpenseBean> expenselist = expenseDao.getAllExpense();
		model.addAttribute("expenselist",expenselist);
		
		return "ListExpensesAdmin";
	}
	
	@GetMapping("/addexpenseimg")
	public String addExpenseImg(@RequestParam("expenseId") Integer expenseId, Model model) {
		ExpenseBean expenseBean = expenseDao.getExpenseById(expenseId);
		model.addAttribute("expenseBean",expenseBean);
		return "ExpenseAddImage";
	}
	
	@PostMapping("/addexpenseimg")
		public String addExpenseImg(ExpenseBean expenseBean) {
		System.out.println(expenseBean.getExpenseId());
		System.out.println(expenseBean.getExpenseImg().getOriginalFilename());
		try {
			File userDir = new File("C:\\Users\\Hp\\Documents\\workspace-spring-tool-suite-4-4.17.2.RELEASE\\ExpenseManager\\src\\main\\resources\\static\\assets\\expenseimg",expenseBean.getExpenseId() + "");
			if(userDir.exists() == false) {
				userDir.mkdir();
			}
			File file = new File(userDir, expenseBean.getExpenseImg().getOriginalFilename());
			FileUtils.writeByteArrayToFile(file, expenseBean.getExpenseImg().getBytes());
			expenseBean.setImageUrl("assets/expenseimg/" + expenseBean.getExpenseId() + "/" + expenseBean.getExpenseImg().getOriginalFilename());
			
			expenseDao.addExpenseImg(expenseBean);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/viewexpense";
		
	}
//	
	@GetMapping("/editexpense")
	public String editExpense(@RequestParam("expenseId") Integer expenseId, Model model) {
		ExpenseBean expenseBean = expenseDao.getExpenseById(expenseId);
		List<CategoryBean> categoryList = categoryDao.getAllCategory();
		List<SubCategoryBean> subCategoryList = subCategoryDao.getAllSubCagetgory();
		List<AccountTypeBean> accountTypeList = accountTypeDao.getAllAccountType();
		List<VendorBean> vendorList = vendorDao.getAllVendor();
		List<StatusBean> statusList = statusDao.getAllStatus();
		System.out.println(expenseBean.getExpenseId());
		System.out.println(expenseBean.getTitle());
		model.addAttribute("expenseBean",expenseBean);
		model.addAttribute("categoryList",categoryList);
		model.addAttribute("subCategoryList",subCategoryList);
		model.addAttribute("vendorList",vendorList);
		model.addAttribute("accountTypeList",accountTypeList);
		model.addAttribute("statusList",statusList);
		
		return "EditExpense";
	}
	
	@PostMapping("/updateexpense")
	public String updateExpense(ExpenseBean expenseBean) {
		expenseDao.updateExpense(expenseBean);
		
		return "redirect:/listexpense";
	}
	
//	@GetMapping("/addexpenseimg") public String
//	  addExpenseImg(@RequestParam("expenseId") Integer expenseId, Model model) {
//	  ExpenseBean expenseBean = expenseDao.getExpenseById(expenseId);
//	  model.addAttribute("expenseBean",expenseBean); return "ExpenseAddImage"; }
//	  
//	  @PostMapping("/addexpenseimg") public String addExpenseImg(ExpenseBean
//	  expenseBean) { System.out.println(expenseBean.getExpenseId());
//	 System.out.println(expenseBean.getExpenseImg().getOriginalFilename()); try {
//	  File userDir = new File(
//	  "C:\\Users\\Hp\\Documents\\workspace-spring-tool-suite-4-4.17.2.RELEASE\\ExpenseManager\\src\\main\\resources\\static\\assets\\expenseimg"
//	 ,expenseBean.getExpenseId() + ""); if(userDir.exists() == false) {
//	  userDir.mkdir(); } File file = new File(userDir,
//	  expenseBean.getExpenseImg().getOriginalFilename());
//	 FileUtils.writeByteArrayToFile(file, expenseBean.getExpenseImg().getBytes());
//	  expenseBean.setImageUrl("assets/expenseimg/" + expenseBean.getExpenseId() +
//	 "/" + expenseBean.getExpenseImg().getOriginalFilename());
//	  
// expenseDao.addExpenseImg(expenseBean);
//	  
//	 } catch (Exception e) { e.printStackTrace(); }
//	  
//	 return "redirect:/viewexpense";
//	 
//	  }
	
	/*
	 * @GetMapping("/listexpensesadmin") public String listExpensesAdmin(Model
	 * model) { List<ExpenseBean> expenselist = expenseDao.getAllExpense();
	 * model.addAttribute("expenselist",expenselist);
	 * 
	 * return "ListExpensesAdmin"; }
	 * 
	 * @GetMapping("/viewexpense") public String
	 * viewExpense(@RequestParam("expenseId") Integer expenseId, Model model) {
	 * ExpenseBean expenseBean = expenseDao.getExpenseById(expenseId);
	 * model.addAttribute("expenseBean",expenseBean); //
	 * System.out.println(expenseBean.getExpenseImg().getOriginalFilename());
	 * System.out.println(expenseBean.getImageUrl()); return "ViewExpense"; }
	 * 
	 * @GetMapping("/viewexpenses") public String
	 * viewExpenses(@RequestParam("expenseId") Integer expenseId, Model model) {
	 * ExpenseBean expenseBean = expenseDao.getExpenseById(expenseId);
	 * model.addAttribute("expenseBean",expenseBean); //
	 * System.out.println(expenseBean.getExpenseImg().getOriginalFilename());
	 * System.out.println(expenseBean.getImageUrl()); return "ViewExpensesAdmin"; }
	 * 
	 * @GetMapping("/editexpense") public String
	 * editExpense(@RequestParam("expenseId") Integer expenseId, Model model) {
	 * ExpenseBean expenseBean = expenseDao.getExpenseById(expenseId);
	 * List<CategoryBean> categoryList = categoryDao.getAllCategory();
	 * List<SubCategoryBean> subCategoryList = subCategoryDao.getAllSubCategory();
	 * List<AccountTypeBean> accountTypeList = accountTypeDao.getAllAccountType();
	 * List<VendorBean> vendorList = vendorDao.getAllVendor(); List<StatusBean>
	 * statusList = statusDao.getAllStatus();
	 * System.out.println(expenseBean.getExpenseId());
	 * System.out.println(expenseBean.getTitle());
	 * model.addAttribute("expenseBean",expenseBean);
	 * model.addAttribute("categoryList",categoryList);
	 * model.addAttribute("subCategoryList",subCategoryList);
	 * model.addAttribute("vendorList",vendorList);
	 * model.addAttribute("accountTypeList",accountTypeList);
	 * model.addAttribute("statusList",statusList);
	 * 
	 * return "EditExpense"; }
	 * 
	 * @PostMapping("/updateexpense") public String updateExpense(ExpenseBean
	 * expenseBean) { expenseDao.updateExpense(expenseBean);
	 * 
	 * return "redirect:/listexpense"; }
	 * 
	 * @PostMapping("/deleteexpense") public String deleteExpense(ExpenseBean
	 * expenseBean) { expenseDao.deleteExpense(expenseBean); return
	 * "redirect:/listexpense"; }
	 * 
	 * @GetMapping("/addexpenseimg") public String
	 * addExpenseImg(@RequestParam("expenseId") Integer expenseId, Model model) {
	 * ExpenseBean expenseBean = expenseDao.getExpenseById(expenseId);
	 * model.addAttribute("expenseBean",expenseBean); return "ExpenseAddImage"; }
	 * 
	 * @PostMapping("/addexpenseimg") public String addExpenseImg(ExpenseBean
	 * expenseBean) { System.out.println(expenseBean.getExpenseId());
	 * System.out.println(expenseBean.getExpenseImg().getOriginalFilename()); try {
	 * File userDir = new File(
	 * "C:\\Users\\Hp\\Documents\\workspace-spring-tool-suite-4-4.17.2.RELEASE\\ExpenseManager\\src\\main\\resources\\static\\assets\\expenseimg"
	 * ,expenseBean.getExpenseId() + ""); if(userDir.exists() == false) {
	 * userDir.mkdir(); } File file = new File(userDir,
	 * expenseBean.getExpenseImg().getOriginalFilename());
	 * FileUtils.writeByteArrayToFile(file, expenseBean.getExpenseImg().getBytes());
	 * expenseBean.setImageUrl("assets/expenseimg/" + expenseBean.getExpenseId() +
	 * "/" + expenseBean.getExpenseImg().getOriginalFilename());
	 * 
	 * expenseDao.addExpenseImg(expenseBean);
	 * 
	 * } catch (Exception e) { e.printStackTrace(); }
	 * 
	 * return "redirect:/viewexpense";
	 * 
	 * }
	 */
}



