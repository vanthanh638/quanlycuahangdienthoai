package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import entities.Contact;

@Repository
public class ContactDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public int addItem(Contact objContact) {
		String sql = "INSERT INTO contact(name, email, phone, message) VALUES(?, ?, ?, ?)";
		return jdbcTemplate.update(sql, new Object[]{objContact.getName(), objContact.getEmail(), objContact.getPhone(), objContact.getMessage()});
	}

	public int getTotal() {
		String sql = "SELECT COUNT(*) AS Total FROM contact";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}

	public List<Contact> getItemsPagination(int offset, int row_count) {
		String sql = "SELECT * FROM contact ORDER BY id LIMIT ?, ?";
		return jdbcTemplate.query(sql, new Object[]{offset, row_count}, new BeanPropertyRowMapper<Contact>(Contact.class));
	}

	public Contact getItem(int id) {
		String sql = "SELECT * FROM contact WHERE id = " + id;
		return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<Contact>(Contact.class));
	}

	public int delItem(int id) {
		String sql = "DELETE FROM contact WHERE id = ?";
		return jdbcTemplate.update(sql, new Object[]{id});
	}

}
