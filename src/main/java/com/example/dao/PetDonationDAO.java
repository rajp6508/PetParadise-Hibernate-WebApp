package com.example.dao;

import com.example.model.PetDonation;
import com.example.util.HibernateUtil;
import org.hibernate.Session;
import java.util.List;

public class PetDonationDAO {

    public List<PetDonation> getAllDonatedPets() {
        try (Session session = HibernateUtil.getSession()) {
            return session.createQuery("from PetDonation", PetDonation.class).list();
        }
    }
}
