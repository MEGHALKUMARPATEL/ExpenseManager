package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
		List<AccountTypeBean> list = accountTypeDao.getAvailableAccountType();
		System.out.println(accountTypeDao.getAllAccountType());
		model.addAttribute("list",list);
		return "ListAccountType";
	}

	@GetMapping("/deleteaccounttype/{accountTypeId}")
	public String deleteAccountType(@PathVariable("accountTypeId") Integer accountTypeId) {
		//12 45 
		accountTypeDao.deleteAccountType(accountTypeId, false);
		return "redirect:/listaccounttype";//
	}
	
	@GetMapping("/editaccounttype")
	public String editAccountType(@RequestParam("accountTypeId") Integer accountTypeId, Model model) {
		AccountTypeBean accountTypeBean = accountTypeDao.getAccountTypeById(accountTypeId);
		model.addAttribute("accountTypeBean",accountTypeBean);
		return "EditAccountType";
	}
	
	@PostMapping("/updateaccounttype")
	public String updateAccountType(AccountTypeBean accountTypeBean) {
		accountTypeDao.updateAccountType(accountTypeBean);
		
		return "redirect:/listaccounttype";
	}
	
	
}
