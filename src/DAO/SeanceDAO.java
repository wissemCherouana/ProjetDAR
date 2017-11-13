package DAO;

import java.util.ArrayList;

import org.hibernate.Session;
import org.hibernate.query.Query;

import Beans.Seance;
import Utils.HibernateUtil;

public class SeanceDAO {
	
	public ArrayList<Seance>GetSeances()
	{
		Session session = HibernateUtil.getSessionFactory().getCurrentSession(); 
		session.beginTransaction();
		Query requete = session.createQuery("select c from Seance c"); 
		@SuppressWarnings("unchecked")
		ArrayList<Seance> seances = (ArrayList<Seance>) requete.list();
		session.getTransaction().commit();		
		return seances;
	}
	
	public Seance GetSeanceById(int id_seance)
	{
		Session session= HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction(); 
		Seance seance = session.get(Seance.class, id_seance); 
		session.getTransaction().commit();
		return seance; 
	}

}
