package dao;

import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.web.client.RestTemplate;

import com.google.gson.Gson;

import entities.PhuKien;

public class PhuKienDao {
	private String url = "http://192.168.1.3:8082/phukien";
	private RestTemplate restTemplate;

	public List<PhuKien> getItems() {
		String uri = url;
		List<PhuKien> list = new ArrayList<>();

		restTemplate = new RestTemplate();

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
			    PhuKien phukien = gson.fromJson(jsonObject.toString(), PhuKien.class);
			    
			    list.add(phukien);
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return list;
	}

	// get Item by id
	public PhuKien getItem(int id) {
		String uri = url + "/" + id;
		restTemplate = new RestTemplate();
		
		PhuKien phukien = null;
		
		// Chuỗi json
		String result = restTemplate.getForObject(uri, String.class);
		
		// Tạo đối tượng Gson
	    Gson gson = new Gson();
	    phukien = gson.fromJson(result, PhuKien.class);
		return phukien;
	}
}
