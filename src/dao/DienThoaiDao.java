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
import entities.DienThoai;

public class DienThoaiDao {

	private static String url = Defines.url + "dienthoai";
	
	public DienThoaiDao() {
		
	}

	// get list
	public List<DienThoai> getItems() {
		String uri = url;
		RestTemplate restTemplate = new RestTemplate();
		
		List<DienThoai> list = new ArrayList<>();
		
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
				
//				Object objDT = jsonArray.get(i);
//				System.out.println(objDT.toString());
//			    JSONObject jsonObject = (JSONObject) objDT;
//			    
				// Tạo đối tượng Gson
			    Gson gson = new Gson();
//			    
			    // chuyển từ json sang đối tượng
			    DienThoai dienThoai = gson.fromJson(jsonObject.toString(), DienThoai.class);
//			    
			    list.add(dienThoai);
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return list;
	}

	public DienThoai getItem(int id) {
		String uri = url + "/" + id;
		RestTemplate restTemplate = new RestTemplate();
		String jsonString = restTemplate.getForObject(uri, String.class);
		
		DienThoai dienThoai = null;
		
		Gson gson = new Gson();
		dienThoai = gson.fromJson(jsonString, DienThoai.class);
		return dienThoai;
	}

	// add
	public DienThoai addItem(DienThoai dienThoai) {
		String uri = url + "/add";
		RestTemplate restTemplate = new RestTemplate();
		restTemplate = new RestTemplate();
		DienThoai result = restTemplate.postForObject(uri, dienThoai, DienThoai.class);
		return result;
	}

	// update
	public DienThoai editItem(DienThoai dienThoai) {
		String uri = url + "/update";
		RestTemplate restTemplate = new RestTemplate();
		restTemplate.put(uri, dienThoai);
		return dienThoai;
	}
		
	public int delItem(int id) {
		String uri = url + "/delete/" + id;
		RestTemplate restTemplate = new RestTemplate();
		restTemplate.delete(uri);
		return id;
	}

//	public int getTotal() {
//		url = "http://demo6916417.mockable.io/dien-thoai";
//		restTemplate = new RestTemplate();
//		
//		int total = 0;
//		// Chuỗi json
//		String result = restTemplate.getForObject(url, String.class);
//		System.out.println(result);
//		try {
//			// 1. Tạo ra một JSONParser
//			JSONParser jsonParser = new JSONParser();
//			
//			// 2. Parser chuỗi JSON về một JSONArray
//			JSONArray jsonArray = (JSONArray) jsonParser.parse(result);
//			total = jsonArray.size();
//		} catch (ParseException e) {
//			e.printStackTrace();
//		}
//		return total;
//	}

//	public List<DienThoai> getItemsPagination(int offset, int row_count) {
//		url = "http://demo6916417.mockable.io/dien-thoai";
//		restTemplate = new RestTemplate();
//		
//		int end = 0;
//		
//		List<DienThoai> list = new ArrayList<>();
//		
//		// Chuỗi json
//		String result = restTemplate.getForObject(url, String.class);
//		System.out.println(result);
//		
//		
//		try {
//			// 1. Tạo ra một JSONParser
//			JSONParser jsonParser = new JSONParser();
//			
//			// 2. Parser chuỗi JSON về một JSONArray
//			JSONArray jsonArray = (JSONArray) jsonParser.parse(result);
//			System.out.println(jsonArray.size());
//			
//			if ((offset + row_count) >= jsonArray.size()) {
//				end = jsonArray.size();
//			} else {
//				end = offset + row_count;
//			}
//			
//			for (int i = offset; i < end; i++) {
//				JSONObject jsonObject = (JSONObject) jsonArray.get(i);
//				
////				Object objDT = jsonArray.get(i);
////				System.out.println(objDT.toString());
////			    JSONObject jsonObject = (JSONObject) objDT;
////			    
//				// Tạo đối tượng Gson
//			    Gson gson = new Gson();
////			    
//			    // chuyển từ json sang đối tượng
//			    DienThoai dienThoai = gson.fromJson(jsonObject.toString(), DienThoai.class);
////			    
//			    list.add(dienThoai);
//			}
//		} catch (ParseException e) {
//			e.printStackTrace();
//		}
//		System.out.println(list.size());
//		return list;
//	}
}
