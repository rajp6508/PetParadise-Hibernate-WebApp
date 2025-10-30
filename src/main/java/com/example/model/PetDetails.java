package com.example.model;

import javax.persistence.*;

@Entity
@Table(name = "pet_details")
public class PetDetails {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private int height;
    private int weight;
    private int age;
    private String breed;
    private String atmosphere;
    @Column
    private double price;
    public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	@OneToOne(mappedBy = "pet", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private PetDetails petDetails;

    
    public PetDetails getPetDetails() {
		return petDetails;
	}

	public void setPetDetails(PetDetails petDetails) {
		this.petDetails = petDetails;
	}

	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "pet_id")
	private Pet pet;

   

    // Getters and Setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getHeight() {
        return height;
    }

    public void setHeight(int height) {
        this.height = height;
    }

    public int getWeight() {
        return weight;
    }

    public void setWeight(int weight) {
        this.weight = weight;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getBreed() {
        return breed;
    }

    public void setBreed(String breed) {
        this.breed = breed;
    }

    public String getAtmosphere() {
        return atmosphere;
    }

    public void setAtmosphere(String atmosphere) {
        this.atmosphere = atmosphere;
    }

    public Pet getPet() {
        return pet;
    }

    public void setPet(Pet pet) {
        this.pet = pet;
    }
}
