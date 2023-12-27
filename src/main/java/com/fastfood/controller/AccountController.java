package com.fastfood.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.fastfood.dao.CustomerDAO;
import com.fastfood.entity.Customer;
import com.fastfood.service.CookieService;

@Controller
public class AccountController {
	@Autowired
	private CustomerDAO dao;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private CookieService cookie;
	@Autowired
	ServletContext app;

	@GetMapping("/login")
	public String login(Model model) {
		Cookie ckid = cookie.read("userid");
		Cookie ckpw = cookie.read("pass");
		if(ckid!=null)
		{
		String uid =ckid.getValue();
		String pwd =ckpw.getValue();
		
		model.addAttribute("uid", uid);
		model.addAttribute("pwd", pwd);
		}
		return "login";
	}

	@PostMapping("/login")
	public String login(Model model, @RequestParam("email") String email, @RequestParam("pw") String password,
	        @RequestParam(value = "rm", defaultValue = "false") boolean rememberMe) {

	    Customer user = dao.findByEmail(email);
	    if (user == null) {
	        model.addAttribute("message", "Tên đăng nhập không hợp lệ!");
	        return "login"; // Trả về trang login
	    } else if (!password.equals(user.getPassword())) {
	        model.addAttribute("message", "Mật khẩu không hợp lệ!");
	        return "login"; // Trả về trang login
	    } else {
	        if (email.equals("admin@gmail.com") && user.getAdmin()) {
	            model.addAttribute("message", "Đăng nhập thành công với tài khoản admin!");
	            session.setAttribute("user", user);
	            return "admin/home/index"; // Chuyển hướng đến trang admin
	        } else {
	            model.addAttribute("message", "Đăng nhập thành công!");

	            session.setAttribute("user", user);

	            // Ghi nhớ tài khoản bằng cookie
	            if (rememberMe) {
	                cookie.create("mail", user.getEmail(), 30);
	                cookie.create("pass", user.getPassword(), 30);
	            } else {
	                cookie.delete("mail");
	                cookie.delete("pass");
	            }
	            
	           
	    }
	     return "home/index"; // Trả về trang home/index
	        }
	}
	
	@RequestMapping("/account/logout")
	public String logout(Model model)
	{
		session.removeAttribute("user");
		return "redirect:/login";
	}
	
	
	@GetMapping("/register")
	public String register(Model model)
	{
		Customer user = new Customer();
		model.addAttribute("form",user);
		return "register";
	}
	
	@PostMapping("/register")
	public String register(Model model, 
			@ModelAttribute("form") Customer user,
			@RequestParam("photo_file")MultipartFile file) throws IllegalStateException, IOException
	{
		if(file.isEmpty())
		{
			user.setImage("user.jpg");
		}
		else {
			String dir = app.getRealPath("/static/Images/User");
			File f = new File(dir,file.getOriginalFilename());
			file.transferTo(f);
			user.setImage(f.getName());
		
		}
		user.setAdmin(false);
		dao.create(user);
		model.addAttribute("message","Đăng ký thành công!");
		return "register";
	}
	@GetMapping("/account/change")
	public String change(Model model) {
		return "account/change";
	}
	@PostMapping("/account/change")
	public String change(Model model, @RequestParam("email") String email,
			@RequestParam("pw") String pw,
			@RequestParam("pw1") String pw1,
			@RequestParam("pw2") String pw2)
	{
		if(!pw1.equals(pw2)) {
			model.addAttribute("message","Mật khẩu không tương thích");
		}
		else {
			Customer user = dao.findByEmail(email);
		if(user==null) {
			model.addAttribute("message", "Email không hợp lệ");
			
		}else if(!pw.equals(user.getPassword())) {
			model.addAttribute("message", "Mật khẩu không hợp lệ");
		}else {
			user.setPassword(pw1);
			dao.update(user);
			model.addAttribute("message","Thay đổi mật khẩu thành công");
		}
		}
		
		return "redirect:/login";
	}
	
	
	@GetMapping("/account/edit")
	public String edit(Model model)
	{
		Customer user = (Customer) session.getAttribute("user");
		model.addAttribute("form",user);
		return "account/edit";
	}
	
	@PostMapping("/account/edit")
	public String edit(Model model, 
			@ModelAttribute("form") Customer user,
			@RequestParam("photo_file")MultipartFile file) throws IllegalStateException, IOException
	{
		if(!file.isEmpty())
		{
	
			String dir = app.getRealPath("/static/Images/User");
			File f = new File(dir,file.getOriginalFilename());
			file.transferTo(f);
			user.setImage(f.getName());
		
		}
	
		dao.update(user);
		session.setAttribute("user", user);
		model.addAttribute("message","Chỉnh sửa thông tin thành công!");
		return "account/edit";
	}
}