package com.example.model;

import javax.persistence.*;

@Entity
@Table(name = "pet_donations")
public class Petentity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private int age;
    private String breed;
    private String description;

    @Column(name = "donor_name")
    private String donorName;

    @Column(name = "pet_name")
    private String petName;

    @Column(name = "is_available")
    private boolean isAvailable; // use primitive boolean

    private double price;
    private double weight;
    private double height;
    private String atmosphere;

    // Constructors
    public Petentity() {}

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getAge() { return age; }
    public void setAge(int age) { this.age = age; }

    public String getBreed() { return breed; }
    public void setBreed(String breed) { this.breed = breed; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public String getDonorName() { return donorName; }
    public void setDonorName(String donorName) { this.donorName = donorName; }

    public String getPetName() { return petName; }
    public void setPetName(String petName) { this.petName = petName; }

    public boolean isAvailable() { return isAvailable; }
    public void setAvailable(boolean available) { this.isAvailable = available; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }

    public double getWeight() { return weight; }
    public void setWeight(double weight) { this.weight = weight; }

    public double getHeight() { return height; }
    public void setHeight(double height) { this.height = height; }

    public String getAtmosphere() { return atmosphere; }
    public void setAtmosphere(String atmosphere) { this.atmosphere = atmosphere; }
}
