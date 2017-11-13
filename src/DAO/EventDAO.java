package DAO;

import java.util.ArrayList;

import org.hibernate.Session;
import org.hibernate.query.Query;

import Beans.Cinephile;
import Beans.Element;
import Beans.Evenement;
import Beans.Message;
import Utils.HibernateUtil;

public class EventDAO {

	public void AddEvent(Evenement event)
	{
		Session session = HibernateUtil.getSessionFactory().getCurrentSession(); 
		session.beginTransaction(); 
		try
		{
			session.save(event); 
		}
		catch(Exception e)
		{
			session.getTransaction().rollback();
			e.printStackTrace();
		}
		session.getTransaction().commit();	
		System.out.println("Event added \n");
	}
	
	public ArrayList<Evenement>GetAllEvents()
	{
		Session session = HibernateUtil.getSessionFactory().getCurrentSession(); 
		session.beginTransaction();
		Query requete = session.createQuery("select c from Evenement c"); 
		@SuppressWarnings("unchecked")
		ArrayList<Evenement> events = (ArrayList<Evenement>) requete.list();
		session.getTransaction().commit();		
		return events;
	}
	
	
	public Evenement GetEventById(int id_event)
	{
		Session session = null;
		Evenement event = new Evenement(); 
		try 
		{
			session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction(); 
			event = session.get(Evenement.class,id_event); 
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
	
		return event; 
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList<Evenement> GetEventsOrganizedByCinephile(int id_cinephile)
	{
		Session session = null;
		ArrayList<Evenement> events = new ArrayList<Evenement>();

		try {
			session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			events = (ArrayList<Evenement>) session
					.createQuery("Select c.cinephile_events from Cinephile c where c.cinephile_id='" + id_cinephile + "'")
					.list();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return events;
	}
	
	
	@SuppressWarnings("unchecked")
	public ArrayList<Evenement> GetEventsJoinedByCinephile(int id_cinephile)
	{
		Session session = null;
		ArrayList<Evenement> events = new ArrayList<Evenement>();

		try {
			session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			events = (ArrayList<Evenement>) session
					.createQuery("Select c.joined_events from Cinephile c where c.cinephile_id='" + id_cinephile + "'")
					.list();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return events;
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList<Cinephile> GetEventParticipants(int id_event)
	{
		Session session = null;
		ArrayList<Cinephile> cinephiles = new ArrayList<Cinephile>();

		try {
			session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			cinephiles = (ArrayList<Cinephile>) session
					.createQuery("Select c.joined_events from Evenement c where c.event_id='" + id_event + "'")
					.list();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return cinephiles;
	}
	
	
	@SuppressWarnings("unchecked")
	public void ParticipateEvent(int id_cinephile, int id_event)
	{
		Session session = null;
		try {
			session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			@SuppressWarnings("deprecation")
			Query query = session.createSQLQuery("Insert INTO EVENT_CINEPHILE(CINEPHILE_ID, EVENT_ID) VALUES (:value1, :value2)");
			query.setParameter("value1", id_cinephile);
			query.setParameter("value2", id_event);
			query.executeUpdate();				
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		
	}
	
}
