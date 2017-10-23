package dao;

import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.web.client.RestTemplate;

import com.google.gson.Gson;

import entities.Slide;
import entities.VaiTro;

public class SlideDao {
	private String url = "http://192.168.1.108:8082/slide";
	private RestTemplate restTemplate;

	public List<Slide> getItems() {
		String uri = url;
		List<Slide> list = new ArrayList<>();

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
			    Slide slide = gson.fromJson(jsonObject.toString(), Slide.class);
			    
			    list.add(slide);
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return list;
	}

	// get Item by id
	public Slide getItem(int id) {
		String uri = url + "/" + id;
		restTemplate = new RestTemplate();
		
		Slide slide = null;
		
		// Chuỗi json
		String result = restTemplate.getForObject(uri, String.class);
		
		// Tạo đối tượng Gson
	    Gson gson = new Gson();
	    slide = gson.fromJson(result, Slide.class);
		
		return slide;
	}

}
