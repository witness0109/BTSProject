package com.bts.app.find;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;

import org.json.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.core.io.ClassPathResource;

public class JSONLoader {

	public JSONObject loadJSONFile(String jsonFile) {
		JSONParser parser = new JSONParser();
		Object obj = null;

		try {
			ClassPathResource resource = new ClassPathResource(jsonFile);
			List<String> tmp = Files.readAllLines(Paths.get(resource.getURI()));
			StringBuffer sb = new StringBuffer();
			for (String a : tmp) {
				sb.append(a);
			}
			// obj = parser.parse(sb.toString());
			return new JSONObject(sb.toString());
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return null;

	}
}
