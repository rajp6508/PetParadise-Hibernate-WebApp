package com.example.dao;

import com.example.model.Pet;
import com.example.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class PetDAO {

    // Fetch all pets
    public List<Pet> getAllPets() {
        try (Session session = HibernateUtil.getSession()) {
            return session.createQuery("from Pet", Pet.class).list();
        }
    }

    // Fetch pet by ID (with PetDetails)
    public Pet getPetById(int id) {
        try (Session session = HibernateUtil.getSession()) {
            String hql = "SELECT p FROM Pet p LEFT JOIN FETCH p.petDetails WHERE p.id = :id";
            return session.createQuery(hql, Pet.class)
                          .setParameter("id", id)
                          .uniqueResult();
        }
    }

    // Save a new Pet
    public void savePet(Pet pet) {
        Transaction tx = null;
        try (Session session = HibernateUtil.getSession()) {
            tx = session.beginTransaction();
            session.save(pet);
            tx.commit();
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
        }
    }

    // Update existing Pet
    public void updatePet(Pet pet) {
        Transaction tx = null;
        try (Session session = HibernateUtil.getSession()) {
            tx = session.beginTransaction();
            session.update(pet);
            tx.commit();
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
        }
    }

    // Delete Pet by ID
    public void deletePet(int id) {
        Transaction tx = null;
        try (Session session = HibernateUtil.getSession()) {
            tx = session.beginTransaction();
            Pet pet = session.get(Pet.class, id);
            if (pet != null) {
                session.delete(pet);
            }
            tx.commit();
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
        }
    }
}
