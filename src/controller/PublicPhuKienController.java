package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.PhuKienDao;
import dao.QuangCaoDao;
import defines.Defines;
import entities.PhuKien;
import utils.FormatNumber;
import utils.SlugUtils;

@Controller
@RequestMapping("phu-kien")
public class PublicPhuKienController {
	
	@Autowired
	private Defines defines;
	
	@Autowired
	private SlugUtils slug;
	
	@Autowired
	private FormatNumber formatNumber;
	
	public PublicPhuKienController() {
	}
	@ModelAttribute
	public void addCommon(ModelMap modelMap, HttpSession session){
		modelMap.addAttribute("defines", defines);
		modelMap.addAttribute("slug", slug);
		modelMap.addAttribute("formatNumber", formatNumber);
		QuangCaoDao quangCaoDao = new QuangCaoDao();
		modelMap.addAttribute("listQC", quangCaoDao.getItems());
	}
	
	@RequestMapping(value="")
	public String dienthoai(ModelMap modelMap, @RequestParam(value="page", defaultValue="1") int page){
//		int row_count = 9;
//		int offset = (page - 1) * row_count;
//		int total = dienThoaiDao.getTotal();
//		System.out.println("Total = " + total);
//		int sumPage = (int) Math.ceil((float)total/row_count);
//		modelMap.addAttribute("page", page);
//		modelMap.addAttribute("sumPage", sumPage);
//		modelMap.addAttribute("listDienThoai", dienThoaiDao.getItemsPagination(offset, row_count));
		PhuKienDao phuKienDao = new PhuKienDao();
		modelMap.addAttribute("listPK", phuKienDao.getItems());
		return "public.public.cat_pk";
	}
	
//	@RequestMapping(value="{slug}/cm{id}")
//	public String mobile(ModelMap modelMap, @RequestParam(value="page", defaultValue="1") int page, @PathVariable("id") int id){
//		int row_count = 9;
//		int offset = (page - 1) * row_count;
//		int total = mobileDAO.getTotalByIDPro(id);
//		int sumPage = (int) Math.ceil((float)total/row_count);
//		modelMap.addAttribute("page", page);
//		modelMap.addAttribute("sumPage", sumPage);
//		modelMap.addAttribute("listMobile", mobileDAO.getItemsPaginationByIDPro(id, offset, row_count));
//		return "public.public.cat_mobile";
//	}
	
	@RequestMapping(value="{slug}-pk{id}")
	public String detail(ModelMap modelMap, @PathVariable("id") int id){
		PhuKienDao phuKienDao = new PhuKienDao();
		PhuKien phuKien = phuKienDao.getItem(id);
		phuKien.getSanpham().setLuotxem(phuKien.getSanpham().getLuotxem() + 1);
		phuKienDao.editItem(phuKien);
		modelMap.addAttribute("objPK", phuKien);
		return "public.public.detail_pk";
	}
	
}
