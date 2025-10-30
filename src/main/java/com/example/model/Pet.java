package com.example.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "pets")
public class Pet {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String name;
    private String type;
    private String description;
    private String imagePath;
    @Column(name = "status")
    private String status;

    public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

	@OneToOne(mappedBy = "pet", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private PetDetails petDetails;
 
    

    // Getters and Setters

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getType() { return type; }
    public void setType(String type) { this.type = type; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public String getImagePath() { return imagePath; }
    public void setImagePath(String imagePath) { this.imagePath = imagePath; }

    public PetDetails getPetDetails() {
        return petDetails;
    }

    public void setPetDetails(PetDetails petDetails) {
        this.petDetails = petDetails;
    }
}
