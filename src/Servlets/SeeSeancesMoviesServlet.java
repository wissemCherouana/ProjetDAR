package Servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import Services.SeeEventsService;
import Services.SeeSeancesMoviesService;

public class SeeSeancesMoviesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	SeeSeancesMoviesService see_seances_service; 
	
	@Override
	public void init() throws ServletException
	{
		see_seances_service = new SeeSeancesMoviesService();  
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		JSONObject json_seances = new JSONObject();	
		try
		{
			
			json_seances = see_seances_service.DisplaySeances() ;
			response.setCharacterEncoding("UTF-8");
	        response.setContentType("application/json;charset=utf-8");
			response.getWriter().print(json_seances);

		}
		catch (Exception e) 
		{
			e.printStackTrace(); //local debug
			request.setAttribute("error", e); //remote debug
			response.getWriter().print(e);
		}
		
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
