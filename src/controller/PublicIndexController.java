package controller;


import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import dao.ChiTietDonHangDao;
import dao.DienThoaiDao;
import dao.DonHangDao;
import dao.GioiThieuDao;
import dao.NguoiDungDao;
import dao.PhuKienDao;
import dao.QuangCaoDao;
import dao.SanPhamDao;
import dao.SlideDao;
import dao.ThanhToanDao;
import dao.VaiTroDao;
import defines.Defines;
import entities.Cart;
import entities.ChiTietDonHang;
import entities.DonHang;
import entities.NguoiDung;
import entities.SanPham;
import entities.ThanhToan;
import entities.VaiTro;
import utils.FormatNumber;
import utils.SlugUtils;
import utils.StringUtils;

@Controller
public class PublicIndexController {
	@Autowired
	private Defines defines;
	
	@Autowired
	private SlugUtils slug;
	
	@Autowired
	private StringUtils stringUtils;
	
	@Autowired
	private FormatNumber formatNumber;

	private DienThoaiDao dienThoaiDao;
	private PhuKienDao phuKienDao;
	
	public PublicIndexController() {
		dienThoaiDao = new DienThoaiDao();
		phuKienDao = new PhuKienDao();
	}
	
	@ModelAttribute
	public void addCommon(ModelMap modelMap, HttpSession session){
		modelMap.addAttribute("defines", defines);
		modelMap.addAttribute("slug", slug);
		modelMap.addAttribute("formatNumber", formatNumber);
		QuangCaoDao quangCaoDao = new QuangCaoDao();
		modelMap.addAttribute("listQC", quangCaoDao.getItems());
		modelMap.addAttribute("objUser", session.getAttribute("objUser"));
	}
	
	@RequestMapping(value="")
	public String index(ModelMap modelMap){
		SlideDao slideDao = new SlideDao();
		modelMap.addAttribute("listDienThoai", dienThoaiDao.getItems());
		modelMap.addAttribute("listSlide", slideDao.getItems());
		modelMap.addAttribute("listPK", phuKienDao.getItems());
		return "public.public.index";
	}
	
	// giới thiệu
	@RequestMapping(value="/gioi-thieu")
	public String gioithieu(ModelMap modelMap){
		GioiThieuDao gioiThieuDao = new GioiThieuDao();
		modelMap.addAttribute("objAbout", gioiThieuDao.getItem());
		return "public.public.about";
	}
	
	// xem giỏ hàng
	@RequestMapping(value="gio-hang")
	public String cart(){
		return "public.public.cart";
	}
	
	@RequestMapping(value="account")
	public String addAccount(){
		return "public.public.create_account";
	}
	
	@RequestMapping(value="account/logout")
	public String userLogout(HttpSession session){
		session.removeAttribute("objUser");
		return "redirect:/";
	}
	
//	@RequestMapping(value="gioi-thieu")
//	public String about(ModelMap modelMap){
//		modelMap.addAttribute("about", aboutDAO.getItem());
//		return "public.public.about";
//	}
	
	@RequestMapping(value="lien-he")
	public String contact(){
		return "public.public.contact";
	}
	
	// thêm sản phẩm vào giỏ hàng
	@RequestMapping(value="addCart")
	public String addCart(@RequestParam("idsp") int idsp, @RequestParam("gia") int gia, @RequestParam("so_luong") int so_luong, HttpSession session){
		System.out.println(idsp);
		SanPhamDao sanPhamDao = new SanPhamDao();
		SanPham sanPham = sanPhamDao.getItem(idsp);
		System.out.println("So lượng" + so_luong);
		ChiTietDonHang chiTietDonHang = new ChiTietDonHang(0, sanPham, gia, so_luong);
		Cart nCart = (Cart) session.getAttribute("cart");
		if (nCart == null){
			nCart = new Cart();
		}
		nCart.addCart(chiTietDonHang);
		session.setAttribute("cart", nCart);
		return "public.addCart";
	}
	
	// cập nhật sô lượng trong giỏ hàng
	@RequestMapping(value="cart-cap-nhat/{array}")
	public String capNhapCart(@PathVariable("array") int[] array_sl, HttpSession session){
		Cart nCart = (Cart) session.getAttribute("cart");
		nCart.updateSL(array_sl);
		session.setAttribute("cart", nCart);
		return "redirect:/gio-hang";
	}
	
	@RequestMapping(value="thanh-toan")
	public String tt(HttpSession session, ModelMap modelMap){
		modelMap.addAttribute("rd", new Random().nextInt(10000));
		if (session.getAttribute("objUser") != null){
			NguoiDung obj = (entities.NguoiDung) session.getAttribute("objUser");
//			DonHang customer = new DonHang(0, obj.getTendaydu(), diachi, sodienthoai, ngaykhoitao, trangthai, chiTietDonHangs, nguoidung, thanhToan)
			session.setAttribute("objCustomer", obj);
			return "public.public.infor";
		}
		return "public.public.thanh-toan";
	}

	// dang nhap
	@RequestMapping(value="account", method=RequestMethod.POST)
	public String login(@RequestParam("username") String username, @RequestParam("password") String password, HttpSession session){
		System.out.println("ten dang nhap" + username);
		NguoiDungDao nguoiDungDao = new NguoiDungDao();
		
		StringUtils stringUtils = new StringUtils();
//		password = stringUtils.md5(password);
		NguoiDung nguoiDung = nguoiDungDao.getByUsername(username);
		if (nguoiDung != null) {
			if (nguoiDung.getMatkhau().equals(stringUtils.md5(password))) {
				session.setAttribute("objUser", nguoiDung);
				return "public.public.account";
			}
		}
		return "redirect:/account?msg=err";
	}
	
	// Xóa sản phẩm khỏi giỏ hàng
	@RequestMapping(value="cart/del/{id}")
	public String delProduct(@PathVariable("id") int i, HttpSession session){
		Cart nCart = (Cart) session.getAttribute("cart");
		nCart.delItem(i);
		session.setAttribute("cart", nCart);
		return "redirect:/gio-hang";
	}
	
	// đặt hàng
	@RequestMapping("/add-don-hang-ht{id}")
	public String addonHang(HttpSession session, @PathVariable("id") int id_ht_tt){
		NguoiDung nguoiDung = (NguoiDung) session.getAttribute("objUser");
		ThanhToan thanhToan = new ThanhToanDao().getItem(id_ht_tt);
		Cart objCart = (Cart) session.getAttribute("cart");
		List<ChiTietDonHang> chiTietDonHangs = objCart.getCart();
		for (ChiTietDonHang chiTietDonHang : chiTietDonHangs) {
			chiTietDonHang.setId(0);
		}
		DonHang objDonHang = new DonHang(0, nguoiDung.getTendaydu(), nguoiDung.getDiachi(), nguoiDung.getSodienthoai(), null, 0, chiTietDonHangs, nguoiDung, thanhToan);
		
		DonHangDao donHangDAO = new DonHangDao();
		if (donHangDAO.addItem(objDonHang) != null){
//			int id_donhang = donHangDAO.getItem().getId_don_hang();
//			for(int i = 0; i < objCart.total(); i++){
//				Product product = objCart.getItem(i);
//				product.setId_don_hang(id_donhang);
//				productDAO.addItem(product);
//			}
			session.removeAttribute("cart");
			return "redirect:/don-hang-c" + nguoiDung.getId();
		}
		return "public.ngan_luong";
	}
	
	// xem đơn hàng
	@RequestMapping("/don-hang-c{id}")
	public String don_hang(@PathVariable("id") int id, ModelMap modelMap, HttpSession session){
		NguoiDung objUser = (NguoiDung) session.getAttribute("objUser");
		DonHangDao donHangDao = new DonHangDao();
		modelMap.addAttribute("donHang", donHangDao.getItemsByIdNguoiDung(objUser.getId()));
		return "public.public.don_hang";
	}
	
	// Chi tiết đơn hàng
	@RequestMapping("/chi-tiet-don-hang/{id}")
	public String ctdon_hang(@PathVariable("id") int id, ModelMap modelMap, HttpSession session){
		modelMap.addAttribute("donhang", new DonHangDao().getItem(id));
		return "public.public.chi_tiet_don_hang";
	}
	
	@RequestMapping(value = "dang-ky", method = RequestMethod.POST)
	public String dangKy(@ModelAttribute("nguoiDung") NguoiDung nguoiDung) {
		VaiTroDao vaiTroDao = new VaiTroDao();
		VaiTro vaitro = vaiTroDao.getItem(3);
		nguoiDung.setVaitro(vaitro);
		
		String passMd5 = stringUtils.md5(nguoiDung.getMatkhau());
		nguoiDung.setMatkhau(passMd5);
		
		NguoiDungDao nguoiDungDao = new NguoiDungDao();
		if (nguoiDungDao.addItem(nguoiDung) != null) {
			return "redirect:/account?msg=creatOK"; 
		} 
		return "redirect:/account";
	}
	
	// cap nhat don hang
	@RequestMapping(value="cap-nhat-don-hang/{id}/{array}")
	public String capNhapDonHang(@PathVariable("array") int[] array_sl, HttpSession session, @PathVariable("id") int id){
		ChiTietDonHangDao chiTietDonHangDao = new ChiTietDonHangDao();
		DonHang donHang = new DonHangDao().getItem(id);
		
		List<ChiTietDonHang> list = donHang.getChiTietDonHangs();
		for (int i = 0; i < list.size(); i++) {
			ChiTietDonHang chiTietDonHang = list.get(i);
			chiTietDonHang.setSoluong(array_sl[i]);
			chiTietDonHangDao.udateItem(chiTietDonHang);
		}
		return "redirect:/chi-tiet-don-hang/"+id;
	}
}
