package controller;

import java.security.Principal;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.DonHangDao;
import defines.Defines;
import utils.SlugUtils;

@Controller
@RequestMapping("admin/don-hang")
public class AdminDonHangController {

	@Autowired
	private Defines defines;

	@Autowired
	private SlugUtils slug;
	
	@ModelAttribute
	public void addCommon(ModelMap modelMap, Principal principal) {
		modelMap.addAttribute("defines", defines);
		modelMap.addAttribute("slug", slug);
	}
	

	@RequestMapping(value = "")
	public String index(ModelMap modelMap, @RequestParam(value = "page", defaultValue = "1") int page) {
		DonHangDao donHangDao = new DonHangDao();
		modelMap.addAttribute("listDonHang", donHangDao.getItems());
		return "admin.don_hang.index";
	}
	
	// Chi tiết đơn hàng
	@RequestMapping("/chi-tiet-don-hang/{id}")
	public String ctdon_hang(@PathVariable("id") int id, ModelMap modelMap, HttpSession session){
		DonHangDao donHangDao = new DonHangDao();
		modelMap.addAttribute("id_dh", id);
		modelMap.addAttribute("donhang", donHangDao.getItem(id));
		return "admin.don_hang.detail";
	}
}
