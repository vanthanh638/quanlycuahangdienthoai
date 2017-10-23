package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.DienThoaiDao;
import defines.Defines;
import utils.FormatNumber;
import utils.SlugUtils;

@Controller
@RequestMapping("dien-thoai")
public class PublicDienThoaiController {
	private DienThoaiDao dienThoaiDao;
	
	@Autowired
	private Defines defines;
	
	@Autowired
	private SlugUtils slug;
	
	@Autowired
	private FormatNumber formatNumber;
	
	public PublicDienThoaiController() {
		dienThoaiDao = new DienThoaiDao();
	}
	@ModelAttribute
	public void addCommon(ModelMap modelMap, HttpSession session){
		modelMap.addAttribute("defines", defines);
		modelMap.addAttribute("slug", slug);
//		modelMap.addAttribute("listPro", producerDAO.getItems());
//		modelMap.addAttribute("listLoaiPK", loaiPKDAO.getItems());
		modelMap.addAttribute("formatNumber", formatNumber);
//		modelMap.addAttribute("listAdvs", advsDAO.getItemsPagination(0, 3));
//		modelMap.addAttribute("listBC", mobileDAO.getItemsBC());
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
		modelMap.addAttribute("listDienThoai", dienThoaiDao.getItems());
		return "public.public.cat_mobile";
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
//	
//	@RequestMapping(value="{slug}-m{id}")
//	public String detail(ModelMap modelMap, @PathVariable("id") int id){
//		mobileDAO.addRead(id);
//		modelMap.addAttribute("objMobile", mobileDAO.getItem(id));
//		return "public.public.detail_mobile";
//	}
	
}
