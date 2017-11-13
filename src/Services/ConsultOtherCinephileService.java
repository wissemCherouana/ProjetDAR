package Services;

import org.json.JSONException;
import org.json.JSONObject;

import Beans.Cinephile;
import DAO.CinephileDAO;

public class ConsultOtherCinephileService {
	
	public JSONObject GetCinephileProfile(int id_cinephile) throws JSONException
	 {
		 CinephileDAO cinephile_dao = new CinephileDAO(); 
		 Cinephile cinephile = cinephile_dao.GetCinephileById(id_cinephile); 
		 if(cinephile!=null)
	        {
			 JSONObject cinephile_json = new JSONObject(); 
			 cinephile_json.put("username",cinephile.getUsername());
			 cinephile_json.put("email", cinephile.getEmail()); 
			 cinephile_json.put("firstname", cinephile.getFirstname()); 
			 cinephile_json.put("lastname", cinephile.getLastname()); 
			 cinephile_json.put("description", cinephile.getDescription()); 
			 cinephile_json.put("address", cinephile.getAdress()); 
			 cinephile_json.put("response", 200);
			 return cinephile_json; 
	        }
		 else return null; 
	 }
}
