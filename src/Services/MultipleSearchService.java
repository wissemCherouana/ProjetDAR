package Services;

import org.json.JSONException;
import org.json.JSONObject;

import API.ThemoviedbApiAccess;

public class MultipleSearchService {
	
	public JSONObject GetResultsFromQuerySearch(String search_query) throws Exception
	 {
		StringBuffer response = ThemoviedbApiAccess.GetResponseFromAPI(ThemoviedbApiAccess.GetMultipleSearchResult(search_query)); 
		
		JSONObject json_search_response = null; 
		try 
		{
			json_search_response = new JSONObject(response.toString()); 
			json_search_response.put("response", 200); 
				
				return json_search_response; 
		}
		catch (JSONException e) 
		{
			e.printStackTrace();
		}
		return json_search_response;
	 }

}
