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
import entities.QuangCao;

public class QuangCaoDao {
	
	private String url = Defines.url + "quangcao";
	
	public QuangCaoDao() {

	}
	
	public List<QuangCao> getItems(){
		String uri = url;
		RestTemplate restTemplate = new RestTemplate();
		
		List<QuangCao> list = new ArrayList<>();
		
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
			    QuangCao quangCao = gson.fromJson(jsonObject.toString(), QuangCao.class);
			    
			    list.add(quangCao);
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return list;
	}

	public QuangCao addItem(QuangCao quangCao) {
		String uri = url + "/add";
		RestTemplate restTemplate = new RestTemplate();
		restTemplate = new RestTemplate();
		QuangCao result = restTemplate.postForObject(uri, quangCao, QuangCao.class);
		return result;
	}

	// get by id
	public QuangCao getItem(int id) {
		String uri = url + "/" + id;
		RestTemplate restTemplate = new RestTemplate();
		String jsonString = restTemplate.getForObject(uri, String.class);
		
		QuangCao quangCao = null;
		
		Gson gson = new Gson();
		quangCao = gson.fromJson(jsonString, QuangCao.class);
		return quangCao;
	}

	// delete
	public int delItem(int id) {
		String uri = url + "/delete/" + id;
		RestTemplate restTemplate = new RestTemplate();
		restTemplate.delete(uri);
		return id;
	}
	
	// update
	public QuangCao editItem(QuangCao quangCao) {
		String uri = url + "/update";
		RestTemplate restTemplate = new RestTemplate();
		restTemplate.put(uri, quangCao);
		return quangCao;
	}
}
