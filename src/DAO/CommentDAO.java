package DAO;

import java.util.ArrayList;

import org.hibernate.Session;

import Beans.Comment;
import Utils.HibernateUtil;

public class CommentDAO {

	public void AddComment(Comment comment)
	{
		Session session = HibernateUtil.getSessionFactory().getCurrentSession(); 
		session.beginTransaction(); 
		try
		{
			session.save(comment); 
		}
		catch(Exception e)
		{
			session.getTransaction().rollback();
			e.printStackTrace();
		}
		session.getTransaction().commit();	
		System.out.println("Comment added \n");
	}
	
	/** Get list of comments by id_element **/ 
	@SuppressWarnings("unchecked")
	public ArrayList<Comment> GetListOfCommentsElement(int id_element)
	{
		Session session = null; 
		ArrayList<Comment> comments_list = new ArrayList<Comment>(); 
		
		try {	
		session= HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction(); 
		comments_list = (ArrayList<Comment>) session.createQuery("from Comment c where c.element.element_id='"+id_element+"'").list(); 
		session.getTransaction().commit();
		} 
		catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return comments_list;								
		
	}
	
	
}
