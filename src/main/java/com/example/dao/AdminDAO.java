package com.example.dao;




import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import com.example.model.Admin;

public class AdminDAO {

    private SessionFactory factory;

    public AdminDAO() {
        factory = new Configuration()
                .configure("hibernate.cfg.xml")
                .addAnnotatedClass(Admin.class)
                .buildSessionFactory();
    }

    public boolean saveAdmin(Admin admin) {
        Session session = factory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.save(admin);
            tx.commit();
            return true;
        } catch(Exception e) {
            if(tx != null) tx.rollback();
            return false;
        } finally {
            session.close();
        }
    }

    public Admin validateAdmin(String username, String password) {
        Session session = factory.openSession();
        try {
            Query<Admin> query = session.createQuery(
                    "from Admin where username = :u and password = :p", Admin.class);
            query.setParameter("u", username);
            query.setParameter("p", password);
            return query.uniqueResult();
        } finally {
            session.close();
        }
    }
}
