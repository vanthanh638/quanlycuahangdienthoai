package dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.web.client.RestTemplate;

import com.google.gson.Gson;

import defines.Defines;
import entities.DonHang;

public class DonHangDao {

	private static String url = Defines.url + "donhang";
	
	public List<DonHang> getItems() {
		String uri = url;
		RestTemplate restTemplate = new RestTemplate();
		
		List<DonHang> list = new ArrayList<>();
		
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
			    
//				String dateStr = jsonObject.get("ngaykhoitao").toString();
//				System.out.println("Date String: " + dateStr);
//				Date date = new Date();
//				date.setTime(Long.parseLong(dateStr));
//				jsonObject.put("ngaykhoitao", date);
//				
//				System.out.println("ngaykhoitao" + jsonObject.get("ngaykhoitao").toString());
				
				// Tạo đối tượng Gson
			    Gson gson = new Gson();
			    
			    // chuyển từ json sang đối tượng
			    DonHang donHang = gson.fromJson(jsonObject.toString(), DonHang.class);
			    
			    list.add(donHang);
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public DonHang getItem(int id) {
		String uri = url + "/" + id;
		RestTemplate restTemplate = new RestTemplate();
		String jsonString = restTemplate.getForObject(uri, String.class);
		
		DonHang donHang = null;
		
		Gson gson = new Gson();
		donHang = gson.fromJson(jsonString, DonHang.class);
		return donHang;
	}

	// add
	public DonHang addItem(DonHang donHang) {
		String uri = url + "/add";
		RestTemplate restTemplate = new RestTemplate();
		restTemplate = new RestTemplate();
		DonHang result = restTemplate.postForObject(uri, donHang, DonHang.class);
		return result;
	}

	// update
	public DonHang editItem(DonHang donHang) {
		String uri = url + "/update";
		RestTemplate restTemplate = new RestTemplate();
		restTemplate.put(uri, donHang);
		return donHang;
	}
		
	public int delItem(int id) {
		String uri = url + "/delete/" + id;
		RestTemplate restTemplate = new RestTemplate();
		restTemplate.delete(uri);
		return id;
	}
}
