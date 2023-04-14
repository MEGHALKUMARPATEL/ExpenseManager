package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.bean.CategoryBean;
import com.bean.StatusBean;
import com.dao.StatusDao;

@Controller
public class StatusController {
	
	@Autowired
	StatusDao statusDao;
	
	@GetMapping("/status")  //url browser
	public String newStatus() {
		return "Status";
	}
	
	@PostMapping("/savestatus")
	public String saveStatus(StatusBean statusBean) {
			System.out.println(statusBean.getStatusName());
			statusDao.addStatus(statusBean);
			return "redirect:/status";
	}
	
	@GetMapping("/liststatus")
	public String listStatus(Model model) {
		List<StatusBean> list = statusDao.getAllStatus();
		System.out.println(statusDao.getAllStatus());
		model.addAttribute("list",list);
		return "ListStatus";
	}

	@GetMapping("/deletestatus/{statusId}")
	public String deleteStatus(@PathVariable("statusId") Integer statusId) {
		statusDao.deleteStatus(statusId);
		return "redirect:/liststatus";
	}

}
