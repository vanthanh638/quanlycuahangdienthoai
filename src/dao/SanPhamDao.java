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
import entities.SanPham;

public class SanPhamDao {

	private static String url = Defines.url + "/sanpham";
	
	public List<SanPham> getItems(){
		String uri = url;
		RestTemplate restTemplate = new RestTemplate();
		
		List<SanPham> list = new ArrayList<>();
		
		// Chuỗi json
		String result = restTemplate.getForObject(uri, String.class);
		try {
			// 1. Tạo ra một JSONParser
			JSONParser jsonParser = new JSONParser();
			
			// 2. Parser chuỗi JSON về một JSONArray
			JSONArray jsonArray = (JSONArray) jsonParser.parse(result);
//			System.out.println(jsonArray.size());
			
			for (int i = 0; i < jsonArray.size(); i++) {
				JSONObject jsonObject = (JSONObject) jsonArray.get(i);
				
				// Tạo đối tượng Gson
			    Gson gson = new Gson();
			    
			    // chuyển từ json sang đối tượng
			    SanPham sanPham = gson.fromJson(jsonObject.toString(), SanPham.class);
			    
			    list.add(sanPham);
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return list;
	} 
	
	// get by id
	public SanPham getItem(int id) {
		String uri = url + "/" + id;
		RestTemplate restTemplate = new RestTemplate();
		String jsonString = restTemplate.getForObject(uri, String.class);
		
		SanPham sanPham = null;
		
		Gson gson = new Gson();
		sanPham = gson.fromJson(jsonString, SanPham.class);
		return sanPham;
	}
}
