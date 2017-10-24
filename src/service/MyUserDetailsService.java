package service;

import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import dao.NguoiDungDao;
import entities.NguoiDung;

public class MyUserDetailsService implements UserDetailsService{

	private NguoiDungDao nguoiDungDao;
	
	public NguoiDungDao getNguoiDungDao() {
		return nguoiDungDao;
	}

	public void setNguoiDungDao(NguoiDungDao nguoiDungDao) {
		this.nguoiDungDao = nguoiDungDao;
	}

	@Override
	@SuppressWarnings("unchecked")
	public UserDetails loadUserByUsername(String tendangnhap) throws UsernameNotFoundException {
		NguoiDung nguoiDung =  nguoiDungDao.getByUsername(tendangnhap);
		List<GrantedAuthority> authoritys = (List<GrantedAuthority>) buildUserAuthority(nguoiDung.getVaitro().getRole());
		return buildUserForAuthentication(nguoiDung, authoritys);
	}

	private UserDetails buildUserForAuthentication(NguoiDung nguoiDung, List<GrantedAuthority> authoritys) {
		return new User(nguoiDung.getTendangnhap(), nguoiDung.getMatkhau(), true, true, true, true, authoritys);
	}

	private GrantedAuthority buildUserAuthority(String role) {
		GrantedAuthority authority = new SimpleGrantedAuthority("ROLE_" + role);
		return authority;
	}
}
