package dao;

import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.web.client.RestTemplate;

import com.google.gson.Gson;

import defines.Defines;
import entities.LoaiSanPham;

public class LoaiSanPhamDao {
	private String url = Defines.url + "loaisanpham";

	public List<LoaiSanPham> getItems() {
		String uri = url;
		List<LoaiSanPham> list = new ArrayList<>();

		RestTemplate restTemplate = new RestTemplate();

		// Chuỗi json
		String result = restTemplate.getForObject(uri, String.class);

		try {
			// 1. Tạo ra một JSONParser
			JSONParser jsonParser = new JSONParser();

			// 2. Parser chuỗi JSON về một JSONArray
			JSONArray jsonArray;
			jsonArray = (JSONArray) jsonParser.parse(result);
			
			for (int i = 0; i < jsonArray.size(); i++) {
				JSONObject jsonObject = (JSONObject) jsonArray.get(i);
				
				// Tạo đối tượng Gson
			    Gson gson = new Gson();
//			    
			    // chuyển từ json sang đối tượng
			    LoaiSanPham loaiSanPham = gson.fromJson(jsonObject.toString(), LoaiSanPham.class);
			    
			    list.add(loaiSanPham);
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return list;
	}

	// get Item by id
	public LoaiSanPham getItem(int id) {
		String uri = url + "/" + id;
		RestTemplate restTemplate = new RestTemplate();
		
		LoaiSanPham loaiSanPham = null;
		
		// Chuỗi json
		String result = restTemplate.getForObject(uri, String.class);
		
		// Tạo đối tượng Gson
	    Gson gson = new Gson();
	    loaiSanPham = gson.fromJson(result, LoaiSanPham.class);
		
		return loaiSanPham;
	}

}
