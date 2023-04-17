package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bean.CategoryBean;
import com.bean.SubCategoryBean;
import com.dao.CategoryDao;
import com.dao.SubCategoryDao;

@Controller
public class SubCategoryController {
	@Autowired
	CategoryDao categoryDao;
	@Autowired
	SubCategoryDao subCategoryDao;
	
	@GetMapping("/subcategories")
	public String subCategories(Model model) {
		List<CategoryBean> list = categoryDao.getAvailableCategory();
		System.out.println(categoryDao.getAllCategory());
		model.addAttribute("list",list);
		return "NewSubCategory";
	}
		
	
	@PostMapping("/savesubcategory")
	public String saveSubCategory(SubCategoryBean subCategoryBean) {
		//subCategoryDao.addSubCategory(subCategoryBean);
		System.out.println(subCategoryBean.getSubCategoryId());
		System.out.println(subCategoryBean.getSubCategoryName());
		System.out.println(subCategoryBean.getCategoryId());
		subCategoryDao.addSubCategory(subCategoryBean);
		
		return "redirect:/listsubcategories";
	}
	@GetMapping("/listsubcategories")
	public String listSubCategories(Model model) {
		//pull all category from db-table
		List<SubCategoryBean> list = subCategoryDao.getAllSubCagetgory();
		System.out.println(categoryDao.getAllCategory());
		model.addAttribute("list",list);
		return "ListSubCategory";
	}
	
	@GetMapping("/deletesubcategory/{subCategoryId}")
	public String deleteSubCategory(@PathVariable("subCategoryId") Integer subCategoryId) {
		//12 45 
		subCategoryDao.deleteSubCategory(subCategoryId);
		return "redirect:/listsubcategories";//
	}
	
	@GetMapping("/viewsubcategory/{subCategoryId}")
	public String viewSubCategory(@PathVariable("subCategoryId") Integer subCategoryId,Model model) {
		SubCategoryBean subCategoryBean = subCategoryDao.getSubCategoryById(subCategoryId);
		model.addAttribute("subCategoryBean",subCategoryBean);
		return "ViewSubCategory";
	
}
	

	@GetMapping("/editsubcategory")
	public String editSubCategory(@RequestParam("subCategoryId") Integer subCategoryId,Model model) {

		SubCategoryBean subCategory = subCategoryDao.getSubCategoryById(subCategoryId);
		model.addAttribute("subCategory",subCategory);
		model.addAttribute("list", categoryDao.getAllCategory());
		return "EditSubCategory";
	}

	@PostMapping("/updatesubcategory")
	public String updateSubCategory(SubCategoryBean subCategory) {
		subCategoryDao.updateSubCategory(subCategory);
		
		return "redirect:/listsubcategories";
	}
}