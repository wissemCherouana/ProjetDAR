package Services;

import org.json.JSONObject;

import Beans.Cinephile;
import DAO.CinephileDAO;

public class LoginService {

	
	Cinephile cinephile = null;

	CinephileDAO cinephile_dao = new CinephileDAO(); 
	public JSONObject LoginCinephile(String email, String password) throws Exception {
		
		cinephile = cinephile_dao.getUserByUserEmail(email);
		String salt= cinephile.getUsername().substring(0, 1) + cinephile.getFirstname().substring(0,1)+cinephile.getLastname().substring(0,1); 
		System.out.println("salt = " + salt);
		String password_hashed = Utils.Security.byteArrayToHexString(Utils.Security.computeHash(password+salt));
		if (cinephile == null || !cinephile.getEmail().equals(email) || !cinephile.getPassword().equals(password_hashed)) {
			return new JSONObject().put("message", "Invalid email or password");
		}
		else {
			JSONObject jo = new JSONObject().put("id_user", CinephileDAO.getCinephileId(email));
			jo.put("message", 200);
			return jo;

		} 

	}

}
