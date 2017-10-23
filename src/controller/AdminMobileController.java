package controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.DienThoaiDao;
import defines.Defines;
import utils.SlugUtils;

@Controller

@RequestMapping(value = "admin/mobile")
public class AdminMobileController {

	@Autowired
	private Defines defines;

	@Autowired
	private SlugUtils slug;

	private DienThoaiDao dienThoaiDao;

	public AdminMobileController() {
		dienThoaiDao = new DienThoaiDao();
	}

	@ModelAttribute
	public void addCommon(ModelMap modelMap, Principal principal) {
		modelMap.addAttribute("defines", defines);
		modelMap.addAttribute("slug", slug);
	}

	@RequestMapping(value = "")
	public String index(ModelMap modelMap, @RequestParam(value = "page", defaultValue = "1") int page) {
		modelMap.addAttribute("listDienThoai", dienThoaiDao.getItems());
		return "admin.mobile.index";
	}

	// show-add
	@RequestMapping(value = "add")
	public String add() {
		return "admin.mobile.add";
	}

}
