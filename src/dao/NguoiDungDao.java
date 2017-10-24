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
import entities.NguoiDung;

public class NguoiDungDao {
	private String url = Defines.url + "nguoidung";

	public List<NguoiDung> getItems() {
		String uri = url;
		List<NguoiDung> list = new ArrayList<>();

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
			    NguoiDung nguoiDung = gson.fromJson(jsonObject.toString(), NguoiDung.class);
			    
			    list.add(nguoiDung);
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return list;
	}

	// get Item by id
	public NguoiDung getItem(int id) {
		System.out.println("ID: " + id);
		String uri = url + "/" + id;
		RestTemplate restTemplate = new RestTemplate();
		
		NguoiDung nguoiDung = null;
		
		// Chuỗi json
		String result = restTemplate.getForObject(uri, String.class);
		
		// Tạo đối tượng Gson
	    Gson gson = new Gson();
		nguoiDung = gson.fromJson(result, NguoiDung.class);
		
		return nguoiDung;
	}

	// add
	public NguoiDung addItem(NguoiDung nguoiDung) {
		String uri = url + "/add";
		RestTemplate restTemplate = new RestTemplate();
		NguoiDung result = restTemplate.postForObject(uri, nguoiDung, NguoiDung.class);
		return result;
	}

	// update
	public NguoiDung editItem(NguoiDung nguoiDung) {
		String uri = url + "/update";
		RestTemplate restTemplate = new RestTemplate();
		restTemplate.put(uri, nguoiDung);
		return nguoiDung;
	}

	public int delItem(int id) {
		String uri = url + "/delete/" + id;
		RestTemplate restTemplate = new RestTemplate();
		restTemplate.delete(uri);
		return id;
	}

	public NguoiDung getByUsername(String tendangnhap) {
		String uri = url + "/getbyusername/" + tendangnhap;
		System.out.println(uri);
		RestTemplate restTemplate = new RestTemplate();
		
		NguoiDung nguoiDung = null;
		
		// Chuỗi json
		String result = restTemplate.getForObject(uri, String.class);
		
		
		try {
			JSONParser jsonParser = new JSONParser();
			
			// 2. Parser chuỗi JSON về một JSONArray
			JSONArray jsonArray;
			jsonArray = (JSONArray) jsonParser.parse(result);
			
			JSONObject jsonObject = (JSONObject) jsonArray.get(0);
			
			Gson gson = new Gson();
			nguoiDung = gson.fromJson(jsonObject.toString(), NguoiDung.class);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return nguoiDung;
	}

}
