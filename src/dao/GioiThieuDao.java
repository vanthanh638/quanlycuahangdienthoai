package dao;

import org.springframework.web.client.RestTemplate;

import com.google.gson.Gson;

import defines.Defines;
import entities.GioiThieu;

public class GioiThieuDao {

	private static String url = Defines.url + "gioithieu";
	
	public GioiThieu getItem() {
		String uri = url;
		RestTemplate restTemplate = new RestTemplate();
		String jsonString = restTemplate.getForObject(uri, String.class);
		
		GioiThieu gioiThieu = null;
		
		Gson gson = new Gson();
		gioiThieu = gson.fromJson(jsonString, GioiThieu.class);
		return gioiThieu;
	}

	public GioiThieu editItem(GioiThieu objAbout) {
		String uri = url + "/edit";
		System.out.println(uri);
		RestTemplate restTemplate = new RestTemplate();
		restTemplate.put(uri, objAbout);
		return objAbout;
	}
}
