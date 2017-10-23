package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.DienThoaiDao;
import defines.Defines;
import utils.FormatNumber;
import utils.SlugUtils;

@Controller

public class PublicIndexController {
	@Autowired
	private Defines defines;
	
	@Autowired
	private SlugUtils slug;
	
	@Autowired
	private FormatNumber formatNumber;

	private DienThoaiDao dienThoaiDao;
	
	public PublicIndexController() {
		dienThoaiDao = new DienThoaiDao();
	}
	
	@ModelAttribute
	public void addCommon(ModelMap modelMap, HttpSession session){
		modelMap.addAttribute("defines", defines);
		modelMap.addAttribute("slug", slug);
		modelMap.addAttribute("formatNumber", formatNumber);
	}
	
	@RequestMapping(value="")
	public String index(ModelMap modelMap){
		modelMap.addAttribute("listDienThoai", dienThoaiDao.getItems());
		return "public.public.index";
	}
	
	
	@RequestMapping(value="gio-hang")
	public String cart(){
		return "public.public.cart";
	}
	
	@RequestMapping(value="account")
	public String addAccount(){
		return "public.public.create_account";
	}
	
	@RequestMapping(value="account/logout")
	public String userLogout(HttpSession session){
		session.removeAttribute("objUser");
		return "redirect:/";
	}
	
//	@RequestMapping(value="gioi-thieu")
//	public String about(ModelMap modelMap){
//		modelMap.addAttribute("about", aboutDAO.getItem());
//		return "public.public.about";
//	}
	
	@RequestMapping(value="lien-he")
	public String contact(){
		return "public.public.contact";
	}
	
	
}
