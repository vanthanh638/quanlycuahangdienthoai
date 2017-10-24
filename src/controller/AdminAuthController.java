package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import dao.NguoiDungDao;
import defines.Defines;
import entities.NguoiDung;
import utils.SlugUtils;
import utils.StringUtils;

@Controller
public class AdminAuthController {
	
	@Autowired
	private Defines defines;
	
	@Autowired
	private SlugUtils slug;
	
	@ModelAttribute
	public void addCommon(ModelMap modelMap){
		modelMap.addAttribute("defines", defines);
		modelMap.addAttribute("slug", slug);
	}
	
	@RequestMapping("admin/login")
	public String login(){
		return "admin.auth.login";
	}
	
	@RequestMapping(value="admin/login", method=RequestMethod.POST)
	public String login(@RequestParam("username") String username, @RequestParam("password") String password, HttpSession session){
		System.out.println("ten dang nhap" + username);
		NguoiDungDao nguoiDungDao = new NguoiDungDao();
		
		StringUtils stringUtils = new StringUtils();
//		password = stringUtils.md5(password);
		NguoiDung nguoiDung = nguoiDungDao.getByUsername(username);
		if (nguoiDung != null) {
			if (nguoiDung.getMatkhau().equals(stringUtils.md5(password))) {
				System.out.println("username: " + nguoiDung.getTendangnhap());
				System.out.println("password: " + nguoiDung.getMatkhau());
				session.setAttribute("admin", nguoiDung);
				return "redirect:/admin/user";
			}
		}
		return "redirect:/admin/login?msg=err";
	}
	@RequestMapping("403")
	public String er403(){
		return "public.auth.er403";
	}
	
	@RequestMapping("admin/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("admin");
		return "redirect:/admin/login";
	}
}
