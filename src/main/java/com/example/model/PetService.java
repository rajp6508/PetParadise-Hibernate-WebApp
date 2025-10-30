package com.example.model;

import com.example.model.Pet;
import com.example.util.HibernateUtil;
import org.hibernate.Session;

public class PetService {

    public Pet getPetWithDetails(int id) {
        Session session = HibernateUtil.getSession();
        Pet pet = session.get(Pet.class, id);
        session.close();
        return pet;
    }
}
