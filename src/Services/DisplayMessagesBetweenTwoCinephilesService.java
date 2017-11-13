package Services;

import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import Beans.Message;
import DAO.CinephileDAO;
import DAO.MessageDAO;


public class DisplayMessagesBetweenTwoCinephilesService {

	@SuppressWarnings("finally")
	public JSONObject DisplayMessages(int id_sender, int id_receiver) throws Exception
	 {
		CinephileDAO cinephile_dao = new CinephileDAO(); 
		MessageDAO message_dao = new MessageDAO(); 
		ArrayList<Message> messages_list= new ArrayList<Message>(); 
		ArrayList<Message> messages_list2= new ArrayList<Message>(); 
		JSONObject json_element_messages = new JSONObject();
		JSONArray array = new JSONArray();
		JSONArray array2 = new JSONArray();
		try 
		{
			messages_list = message_dao.GetMessagesSent(id_sender, id_receiver);  
			for(Message message : messages_list)
			{
				JSONObject messageJSON = new JSONObject();
				messageJSON.put("id", message.getId_message()) ;
				messageJSON.put("content", message.getContent_message()); 
				messageJSON.put("date", message.getDatetime_message()); 
				messageJSON.put("status", "sent"); 
				array.put(messageJSON);
			}
			messages_list2 = message_dao.GetMessagesReceived(id_sender, id_receiver); 
			for(Message message : messages_list2)
			{
				JSONObject messageJSON = new JSONObject();
				messageJSON.put("id", message.getId_message()) ;
				messageJSON.put("content", message.getContent_message()); 
				messageJSON.put("date", message.getDatetime_message()); 
				messageJSON.put("status", "received"); 
				array.put(messageJSON);
			}			
			json_element_messages = new JSONObject().put("messages", array); 
			json_element_messages.put("response", 200); 		
		}
		catch (JSONException e) 
		{
			e.printStackTrace();
		}
		finally
		{
			return json_element_messages; 
		}
	 }
	
	
}
