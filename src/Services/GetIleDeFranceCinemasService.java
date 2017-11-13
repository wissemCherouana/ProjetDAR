package Services;

import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import API.ThemoviedbApiAccess;
import Beans.Evenement;
import Beans.Seance;
import DAO.SeanceDAO;

public class GetIleDeFranceCinemasService {
	
	public JSONObject GetCinemas() throws Exception
	{
		StringBuffer response = ThemoviedbApiAccess.GetResponseFromAPI(ThemoviedbApiAccess.ILE_DE_FRANCE_CINEMAS); 
		
		SeanceDAO seance_dao = new SeanceDAO(); 
		ArrayList<Seance> seances = seance_dao.GetSeances(); 
		
		
		JSONArray array = new JSONArray();
		try 
		{
			for(Seance seance : seances)
			{
				JSONObject seance_json = new JSONObject();
				seance_json.put("id", seance.getId_seance());
				seance_json.put("movie", seance.getMovie());
				seance_json.put("affiche", seance.getAffiche()); 
				seance_json.put("place", seance.getPlace());
				seance_json.put("date", seance.getDatetime_seance());
				
				array.put(seance_json);
			}
					
		}
		catch (JSONException e) 
		{
			e.printStackTrace();
		}
		
		
		
		JSONObject json_cinemas = null; 
		try 
		{
			JSONObject j = new JSONObject(response.toString());
			if ( j.getJSONArray( "records" ).length() >0) 
			{
				JSONArray cinemas = j.getJSONArray("records");
				
				json_cinemas = new JSONObject(); 
				json_cinemas.put("cinemas", cinemas);
				json_cinemas.put("seances", array);
				json_cinemas.put("message", 1); 
				return json_cinemas; 
			}
		}
		catch (JSONException e) 
		{
			e.printStackTrace();
		}
		return json_cinemas;
		
	}

}
