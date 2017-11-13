package DAO;

import java.util.ArrayList;  

import org.hibernate.query.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import Beans.Cinephile;
import Utils.HibernateUtil;

public class CinephileDAO {
	
	/** Add a new cinephile to the database **/
	
	public void AddCinephile(Cinephile cinephile)
	{
		Session session = HibernateUtil.getSessionFactory().getCurrentSession(); 
		session.beginTransaction(); 
		try
		{
			session.save(cinephile); 
		}
		catch(Exception e)
		{
			session.getTransaction().rollback();
			e.printStackTrace();
		}
		session.getTransaction().commit();	
		System.out.println("n Cinephile added \n");
	}
	
	/** Get all cinephiles **/
	
	public ArrayList<Cinephile>GetAllCinephiles()
	{
		Session session = HibernateUtil.getSessionFactory().getCurrentSession(); 
		session.beginTransaction();
		Query requete = session.createQuery("select c from Cinephile c"); 
		ArrayList<Cinephile> cinephiles = (ArrayList<Cinephile>) requete.list();
		session.getTransaction().commit();		
		return cinephiles;
	}
	
	
	/** Get a cinephile by id **/ 
	public Cinephile GetCinephileById(int id_cinephile)
	{
		Session session= HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction(); 
		Cinephile cinephile = session.get(Cinephile.class,id_cinephile); 
		session.getTransaction().commit();
		return cinephile; 
	}
	
	
	/** Update cinephile's information **/
	public void UpdateCinephile(Cinephile cinephile) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession(); 
		session.beginTransaction();
		session.update(cinephile);
		session.getTransaction().commit();		
	}
	
	
	/** get a user by his e-mail **/

	public  Cinephile getUserByUserEmail(String email) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction tx = null;
		Cinephile user = null;
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery("from Cinephile c where c.email='" + email + "'");
			user = (Cinephile) query.uniqueResult();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
		return user;

	}
	
	
	public  Cinephile getUserByUsername(String username) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction tx = null;
		Cinephile user = null;
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery("from Cinephile c where c.username='" + username + "'");
			user = (Cinephile) query.uniqueResult();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
		return user;

	}

	public static int getCinephileId(String email)

	{
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction tx = null;
		int id = 0;
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery("select user.id from Cinephile user where user.email='" + email + "'");
			id = (int) query.uniqueResult();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
		return id;
	}

}
