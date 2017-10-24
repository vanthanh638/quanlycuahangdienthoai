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

import dao.SlideDao;
import defines.Defines;
import entities.NguoiDung;
import entities.Slide;
import utils.RenameFileUtils;
import utils.SlugUtils;

@Controller
@RequestMapping("admin/slide")
public class AdminSlideController {

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
				
		SlideDao slideDao = new SlideDao();
		modelMap.addAttribute("listSlide", slideDao.getItems());
		return "admin.slide.index";
	}
	
	// addItem
	@RequestMapping(value="add")
	public String add(HttpSession session){
		// kiểm tra login
		if (session.getAttribute("admin") == null) {
			return "redirect:/admin/login";
		}
		return "admin.slide.add";
	}
	
	// addItem
	@RequestMapping(value="add", method=RequestMethod.POST)
	public String add(@Valid @ModelAttribute("slide") Slide slide, BindingResult bindingResult, @RequestParam("picture_add") CommonsMultipartFile cmf, HttpServletRequest request){
		
		SlideDao slideDao = new SlideDao();
		if(bindingResult.hasErrors()){
			return "admin.slide.add";
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
				slide.setHinhanh(fileName);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if (slideDao.addItem(slide) != null){
			return "redirect:/admin/slide?msg=addOK";
		}
		return "redirect:/admin/slide?msg=addErr";
	}
	
	// Xóa 
	@RequestMapping(value="del/{id}")
	public String del(@PathVariable("id") int id, HttpServletRequest request, HttpSession session){
		
		// kiểm tra login
		if (session.getAttribute("admin") == null) {
			return "redirect:/admin/login";
		}
		
		SlideDao slideDao = new SlideDao();
		
		Slide slide = slideDao.getItem(id);
		if (slide != null){
			if (slideDao.delItem(id) > 0){
				if (!"".equals(slide.getHinhanh())) {
					String urlFile = request.getServletContext().getRealPath("files") + File.separator + slide.getHinhanh();
					System.out.println(request.getServletContext().getRealPath("files"));
					File delFile = new File(urlFile);
					delFile.delete();
				}
				return "redirect:/admin/slide?msg=delOK";
			} 
			return "redirect:/admin/slide?msg=delErr";
		}
		
		return "redirect:/admin/slide";
	}
	
	// editItem
	@RequestMapping(value="edit/{id}")
	public String edit(ModelMap modelMap, @PathVariable("id") int id, HttpSession session){
		
		// kiểm tra login
		if (session.getAttribute("admin") == null) {
			return "redirect:/admin/login";
		}
		
		SlideDao slideDao = new SlideDao();
		modelMap.addAttribute("objSlide", slideDao.getItem(id));
		return "admin.slide.edit";
	}
	
	@RequestMapping(value="edit/{id}", method=RequestMethod.POST)
	public String edit(@Valid @ModelAttribute("objSlide") Slide objSlide, BindingResult bindingResult, @PathVariable("id") int id, @RequestParam("picture_add") CommonsMultipartFile cmf, HttpServletRequest request, @RequestParam(value="page", defaultValue="1") int page){
		
		SlideDao slideDao = new SlideDao();
		
		Slide slide = slideDao.getItem(id);
		if(bindingResult.hasErrors()){
			return "admin.slide.edit";
		}
		if (!"".equals(cmf.getOriginalFilename())){
			if (!"".equals(slide.getHinhanh())) {
				String urlFile = request.getServletContext().getRealPath("files") + File.separator + slide.getHinhanh();
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
				objSlide.setHinhanh(fileName);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			objSlide.setHinhanh(slide.getHinhanh());
		}
		if (slideDao.editItem(objSlide) != null){
			return "redirect:/admin/slide?msg=editOK";
		}
		return "redirect:/admin/slide?msg=editErr";
	}
	
	@RequestMapping(value="set-active", method=RequestMethod.POST)
	@ResponseBody
	public String setBC(@RequestParam("sid") int sid, @RequestParam("sactive") int sactive){
		
		SlideDao slideDao = new SlideDao();
		Slide slide = slideDao.getItem(sid);
		if (sactive == 0){
			slide.setActive(1);
			sactive = 1;
		} else {
			slide.setActive(1);
			sactive = 0;
		}
		slideDao.editItem(slide);
		String result = "<a href=\"javascript:void(0)\" onclick=\"return setActive("+ sid +", " + sactive + ")\" >";
		if (sactive == 1){
			result += "<img src=\"" + defines.getPublicUrl() +  "/img/tick-circle.gif\"/>";
		} else if (sactive == 0){
			result += "<img src=\"" + defines.getPublicUrl() +  "/img/minus-circle.gif\"/>";
		}
		result +=	"</a>";	
//		System.out.println(result);
		return result;
	}

}

