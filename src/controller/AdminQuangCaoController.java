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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import dao.QuangCaoDao;
import defines.Defines;
import entities.NguoiDung;
import entities.QuangCao;
import utils.RenameFileUtils;
import utils.SlugUtils;

@Controller
@RequestMapping("admin/quang-cao")
public class AdminQuangCaoController {

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
	}
	

	@RequestMapping(value = "")
	public String index(ModelMap modelMap, @RequestParam(value = "page", defaultValue = "1") int page, HttpSession session) {
		// kiểm tra login
		if (session.getAttribute("admin") == null) {
			return "redirect:/admin/login";
		}
				
		QuangCaoDao quangCaoDao = new QuangCaoDao();
		modelMap.addAttribute("listQC", quangCaoDao.getItems());
		return "admin.advs.index";
	}
	
	// addItem
	@RequestMapping(value="add")
	public String add(HttpSession session){
		// kiểm tra login
		if (session.getAttribute("admin") == null) {
			return "redirect:/admin/login";
		}
		return "admin.advs.add";
	}
	
	// addItem
	@RequestMapping(value="add", method=RequestMethod.POST)
	public String add(@Valid @ModelAttribute("quangCao") QuangCao quangCao, BindingResult bindingResult, @RequestParam("picture_add") CommonsMultipartFile cmf, HttpServletRequest request){
		
		QuangCaoDao quangCaoDao = new QuangCaoDao();
		if(bindingResult.hasErrors()){
			return "admin.advs.add";
		}
		if (!"".equals(cmf.getOriginalFilename())){
			String dirPath = request.getServletContext().getRealPath("files");
			System.out.println(dirPath);
			File dir = new File(dirPath);
			if (!dir.exists()){
				dir.mkdir();
			}
			
			String fileName = cmf.getOriginalFilename();
			fileName = RenameFileUtils.renameFile(fileName);
			
			String filePath = dirPath + File.separator + fileName;
			try {
				cmf.transferTo(new File(filePath));
				quangCao.setHinhanh(fileName);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if (quangCaoDao.addItem(quangCao) != null){
			return "redirect:/admin/quang-cao?msg=addOK";
		}
		return "redirect:/admin/quang-cao?msg=addErr";
	}
	
	// Xóa 
	@RequestMapping(value="del/{id}")
	public String del(@PathVariable("id") int id, HttpServletRequest request, HttpSession session){
		
		// kiểm tra login
		if (session.getAttribute("admin") == null) {
			return "redirect:/admin/login";
		}
		
		QuangCaoDao quangCaoDao = new QuangCaoDao();
		
		QuangCao qc = quangCaoDao.getItem(id);
		if (qc != null){
			if (quangCaoDao.delItem(id) > 0){
				if (!"".equals(qc.getHinhanh())) {
					String urlFile = request.getServletContext().getRealPath("files") + File.separator + qc.getHinhanh();
					System.out.println(request.getServletContext().getRealPath("files"));
					File delFile = new File(urlFile);
					delFile.delete();
				}
				return "redirect:/admin/quang-cao?msg=delOK";
			} 
			return "redirect:/admin/quang-cao?msg=delErr";
		}
		
		return "redirect:/admin/quang-cao";
	}
	
	// editItem
	@RequestMapping(value="edit/{id}")
	public String edit(ModelMap modelMap, @PathVariable("id") int id, HttpSession session){
		
		// kiểm tra login
		if (session.getAttribute("admin") == null) {
			return "redirect:/admin/login";
		}
		
		QuangCaoDao quangCaoDao = new QuangCaoDao();
		modelMap.addAttribute("objQC", quangCaoDao.getItem(id));
		return "admin.advs.edit";
	}
	
	@RequestMapping(value="edit/{id}", method=RequestMethod.POST)
	public String edit(@Valid @ModelAttribute("objQC") QuangCao objQC, BindingResult bindingResult, @PathVariable("id") int id, @RequestParam("picture_add") CommonsMultipartFile cmf, HttpServletRequest request, @RequestParam(value="page", defaultValue="1") int page){
		
		QuangCaoDao quangCaoDao = new QuangCaoDao();
		
		QuangCao qc = quangCaoDao.getItem(id);
		if(bindingResult.hasErrors()){
			return "admin.advs.edit";
		}
		if (!"".equals(cmf.getOriginalFilename())){
			if (!"".equals(qc.getHinhanh())) {
				String urlFile = request.getServletContext().getRealPath("files") + File.separator + qc.getHinhanh();
				System.out.println(request.getServletContext().getRealPath("files"));
				File delFile = new File(urlFile);
				delFile.delete();
			}
			String dirPath = request.getServletContext().getRealPath("files");
			System.out.println(dirPath);
			File dir = new File(dirPath);
			if (!dir.exists()){
				dir.mkdir();
			}
			
			String fileName = cmf.getOriginalFilename();
			fileName = RenameFileUtils.renameFile(fileName);
			
			String filePath = dirPath + File.separator + fileName;
			try {
				cmf.transferTo(new File(filePath));
				objQC.setHinhanh(fileName);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			objQC.setHinhanh(qc.getHinhanh());
		}
		if (quangCaoDao.editItem(objQC) != null){
			return "redirect:/admin/quang-cao?msg=editOK";
		}
		return "redirect:/admin/quang-cao?msg=editErr";
	}
	
	@RequestMapping(value="set-active", method=RequestMethod.POST)
	@ResponseBody
	public String setBC(@RequestParam("aid") int aid, @RequestParam("aactive") int active){
		
		QuangCaoDao quangCaoDao = new QuangCaoDao();
		QuangCao quangCao = quangCaoDao.getItem(aid);
		System.out.println("ID " + aid);
		System.out.println();
		if (active == 0){
			quangCao.setActive(1);
			active = 1;
		} else {
			quangCao.setActive(0);
			active = 0;
		}
		quangCaoDao.editItem(quangCao);
		String result = "<a href=\"javascript:void(0)\" onclick=\"return setActive("+ aid +", " + quangCao.getActive() + ")\" >";
		if (quangCao.getActive() == 1){
			result += "<img src=\"" + defines.getPublicUrl() +  "/img/tick-circle.gif\"/>";
		} else if (quangCao.getActive() == 0){
			result += "<img src=\"" + defines.getPublicUrl() +  "/img/minus-circle.gif\"/>";
		}
		result +=	"</a>";	
//		System.out.println(result);
		return result;
	}

}

