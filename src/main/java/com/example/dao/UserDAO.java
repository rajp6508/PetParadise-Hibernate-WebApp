package com.example.dao;

import com.example.model.User;
import com.example.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.List;

public class UserDAO {

    // Save new user
    public void save(User user) {
        Transaction tx = null;
        try (Session session = HibernateUtil.getSession()) {
            tx = session.beginTransaction();
            session.save(user);
            tx.commit();
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
        }
    }

    // Fetch by username & password
    public User findByUsernameAndPassword(String username, String password) {
        try (Session session = HibernateUtil.getSession()) {
            String hql = "FROM User WHERE username = :u AND password = :p";
            Query<User> query = session.createQuery(hql, User.class);
            query.setParameter("u", username);
            query.setParameter("p", password);
            return query.uniqueResult();
        }
    }

    // Get all users
    public List<User> getAllUsers() {
        try (Session session = HibernateUtil.getSession()) {
            return session.createQuery("from User", User.class).list();
        }
    }

    // Get user by ID
    public User getUserById(int id) {
        try (Session session = HibernateUtil.getSession()) {
            return session.get(User.class, id);
        }
    }

    // Update user
    public void update(User u) {
        Transaction tx = null;
        try (Session session = HibernateUtil.getSession()) {
            tx = session.beginTransaction();
            session.update(u);
            tx.commit();
        } catch(Exception e) {
            if(tx != null) tx.rollback();
            e.printStackTrace();
        }
    }

    // Delete user
    public void deleteUser(int id) {
        Transaction tx = null;
        try (Session session = HibernateUtil.getSession()) {
            tx = session.beginTransaction();
            User u = session.get(User.class, id);
            if(u != null) session.delete(u);
            tx.commit();
        } catch(Exception e) {
            if(tx != null) tx.rollback();
            e.printStackTrace();
        }
    }
}
