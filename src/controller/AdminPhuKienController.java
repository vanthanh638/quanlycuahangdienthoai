package controller;

import java.io.File;
import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

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

import dao.LoaiSanPhamDao;
import dao.PhuKienDao;
import defines.Defines;
import entities.LoaiSanPham;
import entities.PhuKien;
import entities.SanPham;
import utils.RenameFileUtils;
import utils.SlugUtils;

@Controller

@RequestMapping(value = "admin/phu-kien")
public class AdminPhuKienController {

	@Autowired
	private Defines defines;

	@Autowired
	private SlugUtils slug;

//	private PhuKienDao phuKienDao;
	private LoaiSanPhamDao loaiSanPhamDao;

	public AdminPhuKienController() {
		
		loaiSanPhamDao = new LoaiSanPhamDao();
	}

	@ModelAttribute
	public void addCommon(ModelMap modelMap, Principal principal) {
		modelMap.addAttribute("defines", defines);
		modelMap.addAttribute("slug", slug);
	}

	@RequestMapping(value = "")
	public String index(ModelMap modelMap, @RequestParam(value = "page", defaultValue = "1") int page) {
		PhuKienDao phuKienDao = new PhuKienDao();
		modelMap.addAttribute("listPK", phuKienDao.getItems());
		return "admin.phu_kien.index";
	}

	// show-edit
	@RequestMapping(value = "edit/{id}")
	public String edit(ModelMap modelMap, @PathVariable("id") int id) {
		PhuKienDao phuKienDao = new PhuKienDao();
		modelMap.addAttribute("objPK", phuKienDao.getItem(id));
		modelMap.addAttribute("listLSP", loaiSanPhamDao.getItems());
		return "admin.phu_kien.edit";
	}

	// xử lý edit
	@RequestMapping(value = "edit/{id}", method = RequestMethod.POST)
	public String edit(@ModelAttribute("phuKien") PhuKien phuKien, @ModelAttribute("sanpham") SanPham sanpham,
			BindingResult bindingResult, @RequestParam("hinhanh_add") CommonsMultipartFile cmf,
			HttpServletRequest request, @RequestParam("id_loaisp") int id_loaisp, @PathVariable("id") int id) {
		PhuKienDao phuKienDao = new PhuKienDao();
		LoaiSanPham loaiSanPham = loaiSanPhamDao.getItem(id_loaisp);
		PhuKien pk = phuKienDao.getItem(id);
		
		sanpham.setId(pk.getSanpham().getId());
		sanpham.setLoaiSanPham(loaiSanPham);
		sanpham.setSoluongdaban(pk.getSanpham().getSoluongdaban());
		sanpham.setLuotxem(pk.getSanpham().getLuotxem());
		
		phuKien.setDienthoailienquan("1,2,3");
		phuKien.setLoailienquan("ncncn");
		// if (bindingResult.hasErrors()){
		// return "admin.mobile.add";
		// }
		if (!"".equals(cmf.getOriginalFilename())) {
			// Xóa hình cũ
			if (!"".equals(pk.getSanpham().getHinhanh())) {
				String urlFile = request.getServletContext().getRealPath("files") + File.separator + pk.getSanpham().getHinhanh();
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
			sanpham.setHinhanh(pk.getSanpham().getHinhanh());
		}
		phuKien.setSanpham(sanpham);
		if (phuKienDao.editItem(phuKien) != null) {
			return "redirect:/admin/phu-kien?msg=editOK";
		}
		return "redirect:/admin/phu-kien?msg=editErr";
	}
	
	// show-add
	@RequestMapping(value = "add")
	public String add(ModelMap modelMap) {
		modelMap.addAttribute("listLSP", loaiSanPhamDao.getItems());
		return "admin.phu_kien.add";
	}
	
	// addItem
	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String add(@ModelAttribute("phuKien") PhuKien phuKien, @ModelAttribute("sanpham") SanPham sanpham,
			BindingResult bindingResult, @RequestParam("hinhanh_add") CommonsMultipartFile cmf,
			HttpServletRequest request, @RequestParam("id_loaisp") int id_loaisp) {
		PhuKienDao phuKienDao = new PhuKienDao();
		LoaiSanPham loaiSanPham = loaiSanPhamDao.getItem(id_loaisp);
		sanpham.setLoaiSanPham(loaiSanPham);
		sanpham.setSoluongdaban(0);
		sanpham.setLuotxem(0);
		
		phuKien.setDienthoailienquan("1,2,3");
		phuKien.setLoailienquan("ncncn");
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
		
		phuKien.setSanpham(sanpham);
		if (phuKienDao.addItem(phuKien) != null) {
			return "redirect:/admin/phu-kien?msg=addOK";
		}
		return "redirect:/admin/phu-kien?msg=addErr";
	}
	
	// xóa
	// delItem
	@RequestMapping(value="del/{id}")
	public String del(@PathVariable("id") int id, HttpServletRequest request){
		PhuKienDao phuKienDao = new PhuKienDao();
		PhuKien pk = phuKienDao.getItem(id);
		if (pk != null){
			if (phuKienDao.delItem(id) > 0){
				if (!"".equals(pk.getSanpham().getHinhanh())) {
					// xóa hình
					String urlFile = request.getServletContext().getRealPath("files") + File.separator + pk.getSanpham().getHinhanh();
					System.out.println(request.getServletContext().getRealPath("files"));
					File delFile = new File(urlFile);
					delFile.delete();
				}
				return "redirect:/admin/phu-kien?msg=delOK";
			} 
			return "redirect:/admin/phu-kien?msg=delErr";
		}
		
		return "redirect:/admin/phu-kien";
	}

}
