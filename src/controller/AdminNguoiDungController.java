package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import dao.NguoiDungDao;
import dao.VaiTroDao;
import defines.Defines;
import entities.NguoiDung;
import entities.VaiTro;
import utils.SlugUtils;
import utils.StringUtils;

@Controller
@RequestMapping(value = "admin/user")
public class AdminNguoiDungController {

	@Autowired
	private Defines defines;

	@Autowired
	private SlugUtils slug;
	
	@Autowired
	private StringUtils stringUtils;

	private NguoiDungDao nguoiDungDao;
	private VaiTroDao vaiTroDao;

	public AdminNguoiDungController() {
		nguoiDungDao = new NguoiDungDao();
		vaiTroDao = new VaiTroDao();
	}

	@ModelAttribute
	public void addCommon(ModelMap modelMap, HttpSession session) {
		modelMap.addAttribute("defines", defines);
		modelMap.addAttribute("slug", slug);
		NguoiDung admin = (NguoiDung) session.getAttribute("admin");
		modelMap.addAttribute("userImfor", admin);
	}

	@RequestMapping(value = "")
	public String index(ModelMap modelMap, @RequestParam(value = "page", defaultValue = "1") int page, HttpSession session) {
		// kiểm tra login
		if (session.getAttribute("admin") == null) {
			return "redirect:/admin/login";
		}
		modelMap.addAttribute("listNguoiDung", nguoiDungDao.getItems());
		System.out.println();
		return "admin.user.index";
	}

	// show-add
	@RequestMapping(value = "add")
	public String add(ModelMap modelMap, HttpSession session) {
		// kiểm tra login
		if (session.getAttribute("admin") == null) {
			return "redirect:/admin/login";
		}
		modelMap.addAttribute("listVaiTro", vaiTroDao.getItems());
		return "admin.user.add";
	}
	
	// xử lý add
	@RequestMapping(value="add", method=RequestMethod.POST)
	public String add(@ModelAttribute("nguoiDung") NguoiDung nguoiDung, @RequestParam("id_vaitro") int id_vaitro) {
		System.out.println("id vai tro: " + id_vaitro);
		VaiTro vaiTro = vaiTroDao.getItem(id_vaitro);
		nguoiDung.setVaitro(vaiTro);
		
		// mã hóa password
		String passMd5 = stringUtils.md5(nguoiDung.getMatkhau());
		nguoiDung.setMatkhau(passMd5);
		
		System.out.println("Ten Vai tro: "+nguoiDung.getVaitro().getTenvaitro());
		if (nguoiDungDao.addItem(nguoiDung) != null) {
			return "redirect:/admin/user?msg=addOK"; 
		} 
		return "redirect:/admin/user?msg=addErr";
//		return "redirect:/admin/user?msg=addOK";
	}
	
	// show-edit
	@RequestMapping(value="edit/{id}")
	public String edit(ModelMap modelMap, @PathVariable("id") int id, HttpSession session){
		
		// kiểm tra login
		if (session.getAttribute("admin") == null) {
			return "redirect:/admin/login";
		}
		
		modelMap.addAttribute("listVaiTro", vaiTroDao.getItems());
		modelMap.addAttribute("nguoidung", nguoiDungDao.getItem(id));
		return "admin.user.edit";
	}
	
	// xử lý edit
	@RequestMapping(value="edit/{id}", method=RequestMethod.POST)
	public String edit(@ModelAttribute("nguoiDung") NguoiDung nguoiDung, @RequestParam("id_vaitro") int id_vaitro, @PathVariable("id") int id) {
		VaiTro vaiTro = vaiTroDao.getItem(id_vaitro);
		
		NguoiDung nd = nguoiDungDao.getItem(id);
		
		nguoiDung.setTendangnhap(nd.getTendangnhap());
		nguoiDung.setId(id);
		nguoiDung.setVaitro(vaiTro);
		
		if ("".equals(nguoiDung.getMatkhau())) {
			nguoiDung.setMatkhau(nd.getMatkhau());
		} else {
			String passMd5 = stringUtils.md5(nguoiDung.getMatkhau());
			nguoiDung.setMatkhau(passMd5);
		}
		if (nguoiDungDao.editItem(nguoiDung) != null) {
			return "redirect:/admin/user?msg=addOK"; 
		} 
		return "redirect:/admin/user?msg=addErr";
	}
	
	// delete
	@RequestMapping(value="del/{id}")
	public String delete(@PathVariable("id") int id, HttpSession session) {
		
		// kiểm tra login
		if (session.getAttribute("admin") == null) {
			return "redirect:/admin/login";
		}
		
		NguoiDung nd = nguoiDungDao.getItem(id);
		if (nd == null) {
			return "redirect:/admin/user?msg=delErr";
		}
		if (!"admin".equalsIgnoreCase(nd.getTendangnhap())){
			if (nguoiDungDao.delItem(id) > 0){
				return "redirect:/admin/user?msg=delOK";
			}
			else {
				return "redirect:/admin/user?msg=delErr";
			}
		}
		return "redirect:/admin/user";
	}

}
