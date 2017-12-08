package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dao.GioiThieuDao;
import defines.Defines;
import entities.GioiThieu;
import entities.NguoiDung;
import utils.SlugUtils;

@Controller
@RequestMapping(value="admin")
public class AdminIndexController {

	@Autowired
	private Defines defines;

	@Autowired
	private SlugUtils slug;

	@ModelAttribute
	public void addCommon(ModelMap modelMap, HttpSession session) {
		modelMap.addAttribute("defines", defines);
		modelMap.addAttribute("slug", slug);
		NguoiDung admin = (NguoiDung) session.getAttribute("admin");
		modelMap.addAttribute("userImfor", admin);
//		System.out.println("Session: "+session.getAttribute("admin"));
	}
	
	@RequestMapping(value="")
	public String index(ModelMap modelMap, HttpSession session){
		if (session.getAttribute("admin") == null) {
			return "redirect:/admin/login";
		}
		GioiThieuDao gioiThieuDao = new GioiThieuDao();
		modelMap.addAttribute("objAbout", gioiThieuDao.getItem());
		return "admin.about.index";
	}
	
	@RequestMapping(value="", method=RequestMethod.POST)
	public String index(@ModelAttribute("objAbout") GioiThieu objAbout, HttpSession session){
		
		if (session.getAttribute("admin") == null) {
			return "redirect:/admin/login";
		}
		
		GioiThieuDao gioiThieuDao = new GioiThieuDao();
		objAbout.setId(1);
		if (gioiThieuDao.editItem(objAbout) != null){
			return "redirect:/admin?msg=editOK";
		}
		return "redirect:/admin?msg=editErr";
	}
}
