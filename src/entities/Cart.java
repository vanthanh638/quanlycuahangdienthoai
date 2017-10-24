package entities;

import java.util.ArrayList;
import java.util.List;

public class Cart {

	private List<ChiTietDonHang> cart;

	public Cart() {
		cart = new ArrayList<>();
	}

	public List<ChiTietDonHang> getCart() {
		return cart;
	}

	public void setCart(List<ChiTietDonHang> cart) {
		this.cart = cart;
	}

	public void addCart(ChiTietDonHang chiTietDonHang) {
		if (check(chiTietDonHang.getSanpham().getTensanpham())) {
			for (ChiTietDonHang obj : cart) {
				if (chiTietDonHang.getSanpham().getTensanpham().equalsIgnoreCase(obj.getSanpham().getTensanpham())) {
					obj.setSoluong(chiTietDonHang.getSoluong() + obj.getSoluong());
				}
			}
		} else {
			cart.add(chiTietDonHang);
		}
	}

	// Lấy 1 sản phẩm biết i
	public ChiTietDonHang getItem(int i) {
		if (i < 0 || i > cart.size() - 1) {
			return null;
		}
		return cart.get(i);
	}

	// Xóa sản phẩm
	public void delItem(int i) {
		for (int j = 0; j < cart.size(); j++) {
			if (i == j) {
				cart.remove(i);
			}
		}
	}

	// tổng sản phẩm
	public int total() {
		return cart.size();
	}

	public double tongTien() {
		double t = 0;
		for (ChiTietDonHang obj : cart) {
			t += obj.getSoluong() * obj.getGia();
		}
		return t;
	}

	public boolean check(String name) {
		for (ChiTietDonHang obj : cart) {
			if (name.equalsIgnoreCase(obj.getSanpham().getTensanpham())) {
				return true;
			}
		}
		return false;
	}

	public boolean updateSL(int[] array_sl) {
		for (int i = 0; i < cart.size(); i++) {
			ChiTietDonHang obj = cart.get(i);
			obj.setSoluong(array_sl[i]);
			cart.set(i, obj);
		}
		return true;
	}
}
