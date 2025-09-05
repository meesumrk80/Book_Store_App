# 📚 Book Store Management System

A full-stack **Book Store web application** built with **Ruby on Rails, PostgreSQL, and Tailwind CSS**.  
It allows users to browse, search, and manage books while providing role-based authentication for customers and admins.

---

## 🚀 Features
- 🔐 **Authentication & Authorization**  
  - Secure login and signup with [Devise](https://github.com/heartcombo/devise).  
  - Role management with [Pundit](https://github.com/varvet/pundit) (Admin & Customer).  

- 📖 **Book Management**  
  - Add, edit, delete books (Admin only).  
  - Upload book images with Active Storage.  
  - Assign categories to books.  

- 🔎 **Search & Filter**  
  - Search books by title.  
  - Filter by categories.  

- 🎨 **Modern UI**  
  - Responsive, mobile-friendly design using Tailwind CSS.  

---

## 🛠️ Tech Stack
- **Backend:** Ruby on Rails  
- **Frontend:** Tailwind CSS  
- **Database:** PostgreSQL  
- **Authentication:** Devise + Pundit  
- **File Uploads:** Active Storage  

---

## 📂 Project Structure
bookApp/
│-- app/
│ ├── controllers/ # Application controllers
│ ├── models/ # Database models
│ ├── views/ # UI views (ERB + Tailwind CSS)
│-- config/ # App configuration & routes
│-- db/ # Database migrations & schema
│-- public/ # Static assets
│-- Gemfile # Dependencies

yaml
Copy code

---

## ⚙️ Installation & Setup

1. **Clone the repository**
   ```bash
   git clone https://github.com/your-username/bookApp.git
   cd bookApp
Install dependencies

bash
Copy code
bundle install
Setup the database

bash
Copy code
rails db:create db:migrate db:seed
Run the server

bash
Copy code
bin/dev
Then open http://localhost:3000 in your browser.

👤 User Roles
Admin – Can add, edit, and delete books and categories.

Customer – Can browse, search, and view books.

