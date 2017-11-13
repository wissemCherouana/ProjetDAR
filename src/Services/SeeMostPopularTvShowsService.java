package Services;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import API.ThemoviedbApiAccess;

public class SeeMostPopularTvShowsService {
	
	public JSONObject GetMostPopularMovies() throws Exception
	{
		StringBuffer response = ThemoviedbApiAccess.GetResponseFromAPI(ThemoviedbApiAccess.MOST_POPULAR_TVSHOWS); 
		
		JSONObject json_most_popular_movies = null; 
		try 
		{
			JSONObject j = new JSONObject(response.toString());
			if ( j.getJSONArray( "results" ).length() >0) 
			{
				JSONArray popular_movies = j.getJSONArray("results");
				
				json_most_popular_movies = new JSONObject(); 
				json_most_popular_movies.put("popular_tvshows", popular_movies);
				json_most_popular_movies.put("response", 200); 
				return json_most_popular_movies; 
			}
			
		}
		catch (JSONException e) 
		{
			e.printStackTrace();
		}
		return json_most_popular_movies;
		
	}

	

}
