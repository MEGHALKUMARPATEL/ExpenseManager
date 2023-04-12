package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.bean.StatusBean;
import com.bean.VendorBean;
import com.dao.VendorDao;

@Controller
public class VendorController {
	
	@Autowired
	VendorDao vendorDao;
	
	@GetMapping("/vendor")  //url browser
	public String newVendor() {
		return "Vendor";
	}
	
	@PostMapping("/savevendor")
	public String saveVendor(VendorBean vendorBean) {
		System.out.println();
		vendorDao.addVendor(vendorBean);
		return "redirect:/vendor";
	}
	
	@GetMapping("/listvendor")
	public String listVendor(Model model) {
		List<VendorBean> list = vendorDao.getAllVendor();
		System.out.println(vendorDao.getAllVendor());
		model.addAttribute("list",list);
		return "ListVendor";
	}
	
	@GetMapping("/deletevendor/{vendorId}")
	public String deleteVendor(@PathVariable("vendorId") Integer vendorId) {
		vendorDao.deleteVendor(vendorId);
		return "redirect:/listvendor";
	}

}
