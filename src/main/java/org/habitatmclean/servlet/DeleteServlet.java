package org.habitatmclean.servlet;

import org.habitatmclean.dao.CreateUpdateDeleteDAO;
import org.habitatmclean.dao.PersonDAO;
import org.habitatmclean.dao.ReadDAO;
import org.habitatmclean.entity.Person;
import org.habitatmclean.hibernate.HibernateAdapter;
import org.habitatmclean.hibernate.HibernateUtil;
import org.hibernate.SessionFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DeleteServlet", value="/delete")
public class DeleteServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int pk = Integer.parseInt(request.getParameter("primary_k"));
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();

        switch(request.getParameter("data_type")) {
            case "person":
                sessionFactory.getCurrentSession().beginTransaction();
                ReadDAO reader = new PersonDAO(sessionFactory);
                Person toDelete = (Person) reader.findByPrimaryKey(new Long(pk));
                Person actual = HibernateUtil.initializeAndUnproxy(toDelete);
                sessionFactory.getCurrentSession().getTransaction().commit();
                CreateUpdateDeleteDAO deleter = new HibernateAdapter();
                deleter.delete(actual);
                break;
            default:

        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}