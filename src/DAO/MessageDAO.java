package DAO;

import java.util.ArrayList;

import org.hibernate.Session;

import Beans.Cinephile;
import Beans.Comment;
import Beans.Element;
import Beans.Message;
import Utils.HibernateUtil;

public class MessageDAO {

	
	
	public void AddMessage(Message message)
	{
		Session session = HibernateUtil.getSessionFactory().getCurrentSession(); 
		session.beginTransaction(); 
		try
		{
			session.save(message); 
		}
		catch(Exception e)
		{
			session.getTransaction().rollback();
			e.printStackTrace();
		}
		session.getTransaction().commit();	
		System.out.println("Message added \n");
	}
	
	public Message GetMessageById(int id_message)
	{
		Session session= HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction(); 
		Message message = session.get(Message.class,id_message); 
		session.getTransaction().commit();
		return message; 
	}
	
	
	@SuppressWarnings("unchecked")
	public ArrayList<Message> GetMessagesSent(int id_cinephile_sender, int id_cinephile_receiver)
	{
		Session session = null; 
		ArrayList<Message> messages_list = new ArrayList<Message>(); 
		try {	
			
		session= HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction(); 
		
		messages_list = (ArrayList<Message>) session.createQuery("from Message c where "
				+ "(c.cinephile_sender='"+id_cinephile_sender+"' and "
				+ "c.cinephile_receiver='"+id_cinephile_receiver+"') ").list(); 
		session.getTransaction().commit();
		} 
		catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return messages_list;	
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList<Message> GetMessagesReceived(int id_cinephile_sender, int id_cinephile_receiver)
	{
		Session session = null; 
		ArrayList<Message> messages_list = new ArrayList<Message>(); 
		try {	
			
		session= HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction(); 
		
		messages_list = (ArrayList<Message>) session.createQuery("from Message c where (c.cinephile_sender='"+id_cinephile_receiver+"' and " + 
				"c.cinephile_receiver='"+id_cinephile_sender+"')").list(); 
		session.getTransaction().commit();
		} 
		catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return messages_list;	
	}
	
	
	/**
	 * Get list of message sent by the user
	 * 
	 * @param id_cinephile
	 * @return message_sent
	 **/

	@SuppressWarnings("unchecked")
	public ArrayList<Message> GetListOfMessageSent(int id_cinephile) {
		Session session = null;
		ArrayList<Message> message_sent = new ArrayList<Message>();

		try {
			session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			message_sent = (ArrayList<Message>) session
					.createQuery("Select c.messages_sent from Cinephile c where c.cinephile_id='" + id_cinephile + "'")
					.list();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return message_sent;

	}

	/**
	 * Get list of message received by the user
	 * 
	 * @param id_cinephile
	 * @return message_received
	 **/

	@SuppressWarnings("unchecked")
	public ArrayList<Message> GetListOfMessageReceived(int id_cinephile) {
		Session session = null;
		ArrayList<Message> message_received = new ArrayList<Message>();

		try {
			session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			message_received = (ArrayList<Message>) session
					.createQuery(
							"Select c.messages_received from Cinephile c where c.cinephile_id='" + id_cinephile + "'")
					.list();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return message_received;

	}
	
	
	
	
}
