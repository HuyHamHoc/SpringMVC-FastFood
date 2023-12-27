package com.fastfood.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fastfood.dao.ProductDAO;
import com.fastfood.entity.Product;
import com.fastfood.service.CookieService;

@Controller
public class ProductController {
	@Autowired
	ProductDAO pdao;
	
	@Autowired
	CookieService cookie;
	
	@RequestMapping("/product/list-by-category/{cid}")
	public String listByCategory(Model model,
			@PathVariable("cid") Integer categoryId) {
		List<Product> list = pdao.findByCategoryId(categoryId);
		model.addAttribute("list",list);
		return "product/list";
	}
	
	@RequestMapping("/product/list-by-keywords")
	public String listByKeywords(Model model,
			@RequestParam("keywords") String keywords) {
		List<Product> list = pdao.findByKeywords(keywords);
		model.addAttribute("list",list);
		return "product/list";
	}
	
	
	@RequestMapping("/product/detail/{id}")
	public String detail(Model model,@PathVariable("id") Integer id) {
		// mặt hàng xem chi tiết
		Product prod = pdao.findById(id);
		model.addAttribute("prod",prod);	
		
		// mặt hàng xem cùng loại
		List<Product> list=pdao.findByCategoryId(prod.getCategory().getId());	
		model.addAttribute("list",list);
		
		// mặt hàng xem yêu thích
		Cookie favo = cookie.read("favo");
		if(favo != null) {
			String ids = favo.getValue();
			List<Product> favo_list=pdao.findByIds(ids);	
			model.addAttribute("favo",favo_list);
		}
		
		Cookie viewed = cookie.read("viewed");
		String value = id.toString();
		if(viewed != null) {
			value = viewed.getValue();
			value +=","+id.toString();
		}
		cookie.create("viewed", value, 10);
		List<Product> view_list=pdao.findByIds(value);	
		model.addAttribute("viewed",view_list);
		return "product/detail";
	}
	
	@ResponseBody
	@RequestMapping("/product/add-to-favo/{id}")
	public boolean addToFavorite(Model model, @PathVariable("id") Integer id) {
	    Cookie favo = cookie.read("favo");
	    String value=id.toString();
	    if(favo!=null)
	    {
	    	 value = favo.getValue();
	    	if(!value.contains(id.toString())){
	    		value +=","+id.toString();
	    	}
	    	else {
	    		return false;
	    	}
	    }
	    cookie.create("favo", value, 30);
		return true;
	}
}
