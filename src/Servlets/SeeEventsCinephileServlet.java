package Servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import Services.SeeEventsCinephileService;

public class SeeEventsCinephileServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private SeeEventsCinephileService see_events_cinephile_service; 
	
	@Override
	public void init() throws ServletException
	{
		see_events_cinephile_service = new SeeEventsCinephileService(); 
	}
	
	@Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");
		
		JSONObject json_events = new JSONObject();	
		HttpSession session = req.getSession();
		try
		{
			if(session.getAttribute("id_cinephile")!=null && !session.getAttribute("id_cinephile").equals("") )
			{  
				json_events = see_events_cinephile_service.DisplayEventsCinephiles(Integer.valueOf(session.getAttribute("id_cinephile").toString()));
			} else {
				json_events=null;
			}
			resp.getWriter().print(json_events);

		}
		catch (Exception e) 
		{
			e.printStackTrace(); //local debug
			req.setAttribute("error", e); //remote debug
			resp.getWriter().print(e);
		}
    }

	@Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {    	

    	
	}

    	
    	
    	


}
