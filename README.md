# 🐾 Pet Paradise – Online Pet Adoption & Shop (JSP | Servlet | Hibernate | MySQL | Razorpay)

An advanced **Dynamic Java Web Application** that allows users to **buy, adopt, and donate pets** with secure **OTP-based registration** and **Razorpay online payments**.  
Built using **JSP, Servlets, Hibernate ORM, and MySQL**, this project ensures both **data consistency** and **user authentication** with a real-world flow.

---

## 🚀 Features

### 🧑‍💻 User Side
- User Registration with **Email OTP verification**
- Login and Profile Management  
- Browse pets 
- **Add to cart** and make secure payments via **Razorpay**
- Donate or Sell pets online
 

### 🛠️ Admin Side
- Admin login with credentials stored in DB  
- Manage all users and their verification status  
- Add / Update / Delete pet details dynamically  
- View all orders and donations  
- Manage inventory and categories

---

## 🧱 Tech Stack

| Layer | Technology |
|-------|-------------|
| **Frontend** | HTML, CSS, JSP, Bootstrap |
| **Backend** | Java Servlet, JSP |
| **ORM & DB** | Hibernate + MySQL |
| **Security** | OTP via JavaMail API |
| **Payment Gateway** | Razorpay Integration |
| **Server** | Apache Tomcat |
| **IDE** | Eclipse IDE for Enterprise Java Developers |

---
## ⚙️ Setup Instructions

### 1️⃣ Clone the Repository

git clone https://github.com/rajp6508/PetParadise-Hibernate-WebApp.git

2️⃣ Import into Eclipse

Open Eclipse IDE

Go to File → Import → Existing Projects into Workspace

Browse and select the project folder

Click Finish

3️⃣ Configure Database

Create a database in MySQL (e.g., petparadise)

Import the SQL file:

SOURCE path_to_project/database/petparadise.sql;


Update database credentials in hibernate.cfg.xml

4️⃣ Configure Razorpay

Go to https://razorpay.com
 → Create an account

Get your API Key ID and Key Secret

Add them inside PaymentServlet.java or your config utility file.

5️⃣ Configure Email OTP

Enable "Less Secure Apps" or use an App Password for Gmail

Update credentials in your email utility (e.g., SendOTP.java)

6️⃣ Run the Project

Right-click the project → Run on Server

Choose Apache Tomcat

Open in browser:

http://localhost:8080/PetParadise/

💳 Test Flow

Register → receive OTP → verify → login

Add pets to cart → make payment via Razorpay

Admin login → view users, manage pets, and sales reports

🧑‍💻 Author

👋 Raj Puri
📧 Email: rajp66228@gmail.com

🌐 GitHub: @rajp6508

If you liked this project, please ⭐ the repo to support my work!

🏁 License

This project is open source and available under the MIT License.

