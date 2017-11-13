package DAO;

import org.hibernate.Session;

import Beans.Cinephile;
import Beans.Element;
import Utils.HibernateUtil;

public class ElementDAO {
	
	
	public void AddElement(Element element)
	{
		Session session = HibernateUtil.getSessionFactory().getCurrentSession(); 
		session.beginTransaction(); 
		try
		{
			session.save(element); 
		}
		catch(Exception e)
		{
			session.getTransaction().rollback();
			e.printStackTrace();
		}
		session.getTransaction().commit();	
		System.out.println("Element added \n");
	}
	
	public Element GetElementById(int id_element)
	{
		Session session= HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction(); 
		Element element = session.get(Element.class,id_element); 
		session.getTransaction().commit();
		return element; 
	}
	
	

}
