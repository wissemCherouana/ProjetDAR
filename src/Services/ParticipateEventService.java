package Services;

import java.util.ArrayList;

import org.json.JSONException;
import org.json.JSONObject;

import Beans.Cinephile;
import Beans.Evenement;
import DAO.CinephileDAO;
import DAO.EventDAO;

public class ParticipateEventService {

	
	public JSONObject ParticipateEvent(int id_cinephile, int id_event)
    	    throws JSONException
    {
		CinephileDAO cinephile_dao = new CinephileDAO(); 
		Cinephile cinephile = cinephile_dao.GetCinephileById(id_cinephile); 
		EventDAO event_dao = new EventDAO(); 
		Evenement event = event_dao.GetEventById(id_event);
        
		ArrayList<Cinephile> participants = event_dao.GetEventParticipants(id_event); 
	 	
		if (event!=null && cinephile!=null )
		{
			if ((participants.size()+1)<=event.getLimit())
				event_dao.ParticipateEvent(id_cinephile, id_event);
			JSONObject event_json = new JSONObject();
        	event_json.put("response", 200);
            return event_json;
		}
        else return null;   
    }
	
}
