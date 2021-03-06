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
import entities.PhuKien;

public class PhuKienDao {

	private static String url = Defines.url + "phukien";
	
	public PhuKienDao() {
		
	}

	// get list
	public List<PhuKien> getItems() {
		String uri = url;
		RestTemplate restTemplate = new RestTemplate();
		
		List<PhuKien> list = new ArrayList<>();
		
		// Chuỗi json
		String result = restTemplate.getForObject(uri, String.class);
//		System.out.println(result);
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
//			    
			    // chuyển từ json sang đối tượng
			    PhuKien phuKien = gson.fromJson(jsonObject.toString(), PhuKien.class);
//			    
			    list.add(phuKien);
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return list;
	}

	public PhuKien getItem(int id) {
		String uri = url + "/" + id;
		RestTemplate restTemplate = new RestTemplate();
		String jsonString = restTemplate.getForObject(uri, String.class);
		
		PhuKien obj = null;
		
		Gson gson = new Gson();
		obj = gson.fromJson(jsonString, PhuKien.class);
		return obj;
	}

	public PhuKien addItem(PhuKien phuKien) {
		String uri = url + "/add";
		RestTemplate restTemplate = new RestTemplate();
		restTemplate = new RestTemplate();
		PhuKien result = restTemplate.postForObject(uri, phuKien, PhuKien.class);
		return result;
	}

	public int delItem(int id) {
		String uri = url + "/delete/" + id;
		RestTemplate restTemplate = new RestTemplate();
		restTemplate.delete(uri);
		return id;
	}

	// update
	public PhuKien editItem(PhuKien phuKien) {
		String uri = url + "/update";
		RestTemplate restTemplate = new RestTemplate();
		restTemplate.put(uri, phuKien);
		return phuKien;
	}
	
}
