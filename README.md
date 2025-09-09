# 📚 Book Store App

A Ruby on Rails web application for managing and exploring books with user authentication, categories, reviews, and search functionality.  
This project demonstrates CRUD operations, authentication & authorization, and modern UI design using **Tailwind CSS**.

---

## 🚀 Features

- **User Authentication** (via [Devise](https://github.com/heartcombo/devise))
  - Sign up, login, logout
  - Role-based access with [Pundit](https://github.com/varvet/pundit) (e.g., Admin vs. User)

- **Books Management**
  - Add, edit, delete books (Admin only)
  - Upload book cover images (ActiveStorage)

- **Categories**
  - Organize books into multiple categories

- **Reviews**
  - Users can write reviews and give ratings
  - Reviews linked to both **User** and **Book**

- **Search & Filtering**
  - Search books by title
  - Filter by categories

- **Responsive UI**
  - Styled with **Tailwind CSS**
  - Mobile-friendly design

---

## 🛠️ Tech Stack

- **Backend:** Ruby on Rails 8
- **Frontend:** ERB + Tailwind CSS
- **Database:** PostgreSQL / SQLite (development)
- **Authentication:** Devise
- **Authorization:** Pundit
- **Image Uploads:** ActiveStorage
- **Testing:** Minitest / RSpec (optional)

---

## 📂 Project Structure

bookApp/
├── app/
│ ├── controllers/ # Controllers for books, reviews, users
│ ├── models/ # ActiveRecord models
│ ├── views/ # ERB templates with Tailwind
│ └── policies/ # Pundit authorization policies
├── db/ # Migrations & seeds
├── config/ # Routes, environments
└── README.md

yaml
Copy code

---

## ⚡ Getting Started

Follow these steps to run the project locally:

### 1. Clone the repository
```bash
git clone https://github.com/meesumrk80/Book_Store_App.git
cd Book_Store_App
2. Install dependencies
bash
Copy code
bundle install
3. Set up the database
bash
Copy code
rails db:create
rails db:migrate
rails db:seed   # Optional: to load sample data
4. Start the server
bash
Copy code
bin/dev
Now visit: http://localhost:3000

🔑 Usage
Register an account or login.

Browse books and categories.

Admin users can add/edit/delete books.

Users can add reviews and ratings.

Use search bar to find books by title.

🧑‍💻 Future Improvements
Add cart & checkout system (turn into e-commerce).

Book recommendations based on reviews.

API endpoints for mobile integration.

Dark mode toggle.

📸 Screenshots
(Add screenshots of your app UI here for better presentation)

🤝 Contributing
Pull requests are welcome! For major changes, please open an issue first
to discuss what you’d like to change.

📜 License
This project is licensed under the MIT License.

👤 Author
Meesum Raza Kazmi
📍 Lahore, Pakistan
💻 Aspiring Software Engineer | Computer Science Student @ UCP
🌐 LinkedIn | GitHub