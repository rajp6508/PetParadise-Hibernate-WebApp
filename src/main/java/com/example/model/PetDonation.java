package com.example.model;



import javax.persistence.*;

@Entity
@Table(name = "pet_donations")
public class PetDonation {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "donor_name")
    private String donorName;

    @Column(name = "pet_name")
    private String petName;

    private int age;

    private String breed;

    private String description;

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getDonorName() { return donorName; }
    public void setDonorName(String donorName) { this.donorName = donorName; }

    public String getPetName() { return petName; }
    public void setPetName(String petName) { this.petName = petName; }

    public int getAge() { return age; }
    public void setAge(int age) { this.age = age; }

    public String getBreed() { return breed; }
    public void setBreed(String breed) { this.breed = breed; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
}
