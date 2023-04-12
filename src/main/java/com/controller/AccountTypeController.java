package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.bean.AccountTypeBean;

import com.dao.AccountTypeDao;

@Controller
public class AccountTypeController {
	
	@Autowired
	AccountTypeDao accountTypeDao;
	
	@GetMapping("/accounttype")  //url browser
	public String newAccountType() {
		return "AccountType";
	}
	
	@PostMapping("/saveaccounttype")
	public String saveStatus(AccountTypeBean accountTypeBean) {
			System.out.println(accountTypeBean.getAccountTypeName());
			accountTypeDao.addAccountType(accountTypeBean);
			return "redirect:/listaccounttype";
	}
	
	@GetMapping("/listaccounttype")
	public String listAccountType(Model model) {
		List<AccountTypeBean> list = accountTypeDao.getAllAccountType();
		System.out.println(accountTypeDao.getAllAccountType());
		model.addAttribute("list",list);
		return "ListAccountType";
	}

	@GetMapping("/deleteaccounttype/{accountTypeId}")
	public String deleteAccountType(@PathVariable("accountTypeId") Integer accountTypeId) {
		//12 45 
		accountTypeDao.deleteAccountType(accountTypeId);
		return "redirect:/listaccounttype";//
	}
	
	

}
