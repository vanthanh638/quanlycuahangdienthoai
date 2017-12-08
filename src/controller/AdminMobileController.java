package controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.portlet.ModelAndView;

import dao.DienThoaiDao;
import dao.LoaiSanPhamDao;
import defines.Defines;
import entities.DienThoai;
import entities.LoaiSanPham;
import entities.NguoiDung;
import entities.SanPham;
import utils.RenameFileUtils;
import utils.SlugUtils;

@Controller
@RequestMapping(value = "admin/mobile")
public class AdminMobileController {

	@Autowired
	private Defines defines;

	@Autowired
	private SlugUtils slug;

//	private DienThoaiDao dienThoaiDao;
	private LoaiSanPhamDao loaiSanPhamDao;

	public AdminMobileController() {
		
		loaiSanPhamDao = new LoaiSanPhamDao();
	}

	@ModelAttribute
	public void addCommon(ModelMap modelMap, HttpSession session) {
		modelMap.addAttribute("defines", defines);
		modelMap.addAttribute("slug", slug);
		NguoiDung admin = (NguoiDung) session.getAttribute("admin");
		modelMap.addAttribute("userImfor", admin);
//		System.out.println("Session: "+session.getAttribute("admin"));
	}

	@RequestMapping(value = "")
	public String index(ModelMap modelMap, @RequestParam(value = "page", defaultValue = "1") int page, HttpSession session) {
		if (session.getAttribute("admin") == null) {
			return "redirect:/admin/login";
		}
		DienThoaiDao dienThoaiDao = new DienThoaiDao();
		modelMap.addAttribute("listDienThoai", dienThoaiDao.getItems());
		return "admin.mobile.index";
	}

	// show-edit
	@RequestMapping(value = "edit/{id}")
	public String edit(ModelMap modelMap, @PathVariable("id") int id, HttpSession session) {
		// kiểm tra login
		if (session.getAttribute("admin") == null) {
			return "redirect:/admin/login";
		}
		DienThoaiDao dienThoaiDao = new DienThoaiDao();
		modelMap.addAttribute("dienthoai", dienThoaiDao.getItem(id));
		modelMap.addAttribute("listLSP", loaiSanPhamDao.getItems());
		return "admin.mobile.edit";
	}

	// xử lý edit
	@RequestMapping(value = "edit/{id}", method = RequestMethod.POST)
	public String edit(@Valid @ModelAttribute("dienThoai") DienThoai dienThoai,@Valid @ModelAttribute("sanpham") SanPham sanpham,
			BindingResult bindingResult, @RequestParam("hinhanh_add") CommonsMultipartFile cmf,
			HttpServletRequest request, @RequestParam("id_loaisp") int id_loaisp, @PathVariable("id") int id) {
		if (bindingResult.hasErrors()) {
			return "admin.mobile.edit";
		}
		DienThoaiDao dienThoaiDao = new DienThoaiDao();
		
		LoaiSanPham loaiSanPham = loaiSanPhamDao.getItem(id_loaisp);
		DienThoai dt = dienThoaiDao.getItem(id);
		
		sanpham.setId(dt.getSanpham().getId());
		sanpham.setLoaiSanPham(loaiSanPham);
		sanpham.setSoluongdaban(dt.getSanpham().getSoluongdaban());
		sanpham.setLuotxem(dt.getSanpham().getLuotxem());
		
		
		// if (bindingResult.hasErrors()){
		// return "admin.mobile.add";
		// }
		if (!"".equals(cmf.getOriginalFilename())) {
			// Xóa hình cũ
			if (!"".equals(dt.getSanpham().getHinhanh())) {
				String urlFile = request.getServletContext().getRealPath("files") + File.separator + dt.getSanpham().getHinhanh();
				System.out.println(request.getServletContext().getRealPath("files"));
				File delFile = new File(urlFile);
				delFile.delete();
			}
			
			// lưu hình mới
			String dirPath = request.getServletContext().getRealPath("files");
			System.out.println(dirPath);
			File dir = new File(dirPath);
			if (!dir.exists()) {
				dir.mkdir();
			}

			String fileName = cmf.getOriginalFilename();
			fileName = RenameFileUtils.renameFile(fileName);

			String filePath = dirPath + File.separator + fileName;
			try {
				cmf.transferTo(new File(filePath));
				sanpham.setHinhanh(fileName);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			sanpham.setHinhanh(dt.getSanpham().getHinhanh());
		}
		dienThoai.setSanpham(sanpham);
		if (dienThoaiDao.editItem(dienThoai) != null) {
			return "redirect:/admin/mobile?msg=editOK";
		}
		return "redirect:/admin/mobile?msg=editErr";
	}
	
	// show-add
	@RequestMapping(value = "add")
	public String add(ModelMap modelMap, HttpSession session) {
		// kiểm tra login
		if (session.getAttribute("admin") == null) {
			return "redirect:/admin/login";
		}
		modelMap.addAttribute("listLSP", loaiSanPhamDao.getItems());
		return "admin.mobile.add";
	}
	
	// addItem
	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String add(ModelMap modelMap,@Valid @ModelAttribute("dienThoai") DienThoai dienThoai,@Valid @ModelAttribute("sanpham") SanPham sanpham,
			BindingResult bindingResult, @RequestParam("hinhanh_add") CommonsMultipartFile cmf,
			HttpServletRequest request, @RequestParam("id_loaisp") int id_loaisp) {
		if(bindingResult.hasErrors()) {
			modelMap.addAttribute("listLSP", loaiSanPhamDao.getItems());
			modelMap.addAttribute("dienthoai", dienThoai);
			return "admin.mobile.add";
		}
		DienThoaiDao dienThoaiDao = new DienThoaiDao();
		
		LoaiSanPham loaiSanPham = loaiSanPhamDao.getItem(id_loaisp);
		sanpham.setLoaiSanPham(loaiSanPham);
		sanpham.setSoluongdaban(0);
		sanpham.setLuotxem(0);
		dienThoai.setSanpham(sanpham);
		// if (bindingResult.hasErrors()){
		// return "admin.mobile.add";
		// }
		if (!"".equals(cmf.getOriginalFilename())) {
			String dirPath = request.getServletContext().getRealPath("files");
			System.out.println(dirPath);
			File dir = new File(dirPath);
			if (!dir.exists()) {
				dir.mkdir();
			}

			String fileName = cmf.getOriginalFilename();
			fileName = RenameFileUtils.renameFile(fileName);

			String filePath = dirPath + File.separator + fileName;
			try {
				cmf.transferTo(new File(filePath));
				sanpham.setHinhanh(fileName);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if (dienThoaiDao.addItem(dienThoai) != null) {
			return "redirect:/admin/mobile?msg=addOK";
		}
		return "redirect:/admin/mobile?msg=addErr";
	}
	
	// xóa
	// delItem
	@RequestMapping(value="del/{id}")
	public String del(@PathVariable("id") int id, HttpServletRequest request, HttpSession session){
		
		// kiểm tra login
		if (session.getAttribute("admin") == null) {
			return "redirect:/admin/login";
		}
		
		DienThoaiDao dienThoaiDao = new DienThoaiDao();
		
		DienThoai dt = dienThoaiDao.getItem(id);
		if (dt != null){
			if (dienThoaiDao.delItem(id) > 0){
				if (!"".equals(dt.getSanpham().getHinhanh())) {
					// xóa hình
					String urlFile = request.getServletContext().getRealPath("files") + File.separator + dt.getSanpham().getHinhanh();
					System.out.println(request.getServletContext().getRealPath("files"));
					File delFile = new File(urlFile);
					delFile.delete();
				}
				return "redirect:/admin/mobile?msg=delOK";
			} 
			return "redirect:/admin/mobile?msg=delErr";
		}
		
		return "redirect:/admin/mobile";
	}

}
