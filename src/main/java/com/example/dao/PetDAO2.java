package com.example.dao;

import com.example.model.Petentity;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import java.util.List;

public class PetDAO2 {

    private SessionFactory factory;

    public PetDAO2() {
        factory = new Configuration()
                    .configure("hibernate.cfg.xml")
                    .addAnnotatedClass(Petentity.class)
                    .buildSessionFactory();
    }

    // Fetch all available pets
    public List<Petentity> getAllPets() {
        Session session = factory.openSession();
        List<Petentity> petList = null;
        try {
            petList = session.createQuery("from Petentity", Petentity.class).list();
        } finally {
            session.close();
        }
        return petList;
    }

    // Fetch Petentity by ID
    public Petentity getPetById(int id) {
        Session session = factory.openSession();
        try {
            return session.get(Petentity.class, id);
        } finally {
            session.close();
        }
    }

    // Save new donation
    public void savePet(Petentity pet) {
        Session session = factory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.save(pet);
            tx.commit();
        } catch(Exception e) {
            if(tx != null) tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    // Update donation
    public void updatePet(Petentity pet) {
        Session session = factory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.update(pet);
            tx.commit();
        } catch(Exception e) {
            if(tx != null) tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    // Delete donation
    public void deletePet(int id) {
        Session session = factory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Petentity pet = session.get(Petentity.class, id);
            if(pet != null) session.delete(pet);
            tx.commit();
        } catch(Exception e) {
            if(tx != null) tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    // Toggle availability
    public void toggleAvailability(int id) {
        Session session = factory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Petentity pet = session.get(Petentity.class, id);
            if(pet != null) pet.setAvailable(!pet.isAvailable());
            session.update(pet);
            tx.commit();
        } catch(Exception e) {
            if(tx != null) tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
    }
 // Update only availability status
    public void updatePetAvailability(int id, boolean isAvailable) {
        Session session = factory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Petentity pet = session.get(Petentity.class, id);
            if (pet != null) {
                pet.setAvailable(isAvailable);
                session.update(pet);
            }
            tx.commit();
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    public void close() { factory.close(); }
}
