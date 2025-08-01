# 📋 Job Tracker

A cross-platform job tracking app built with **Flutter** and **Riverpod**, designed to help users search, apply, and keep track of job applications. The app features intuitive UI, real-time interaction, and an offline-first experience using local state and storage.

---

## 📱 Features

- 🏠 **Dashboard Overview** – Personalized greeting, recent job postings, job categories.
- 🔍 **Search & Filter** – Find jobs by title, company, or category with instant results.
- 🔖 **Bookmarks** – Save jobs you're interested in to review later.
- 📈 **Activity Tracker** – Monitor applied, bookmarked, or completed job actions.
- ⚙️ **Preferences Page** – Toggle app settings, theme mode (dark/light), and more.
- 📩 **Notifications** – Built-in notification service for reminders and updates.
- 📊 **Company Pages** – Explore job listings by companies and view detailed job descriptions.
- 🔄 **Persistent Theme Mode** – Theme preferences are saved locally with `SharedPreferences`.

---

## 🧰 Tech Stack

| Category        | Tech                        |
|----------------|-----------------------------|
| **Framework**   | Flutter                     |
| **State Mgmt**  | Riverpod (`flutter_riverpod`) |
| **Local Storage** | SharedPreferences         |
| **Design System** | Custom `DesignConfig` pattern |
| **Navigation**  | Flutter Navigator / Bottom NavBar |
| **Notifications** | Local notifications with service wrapper |
| **Data**        | Local SQLite (planned/integrated) |

---

## 📱 Screenshots

### 🌞 Light Design

<p align="center">
  <img src="assets/screenshots/light/home.png" width="22%" />
  <img src="assets/screenshots/light/categories.png" width="22%" />
  <img src="assets/screenshots/light/one_category.png" width="22%" />
  <img src="assets/screenshots/light/recent.png" width="22%" />
</p>

<p align="center">
  <img src="assets/screenshots/light/search.png" width="22%" />
  <img src="assets/screenshots/light/companies.png" width="22%" />
  <img src="assets/screenshots/light/company_about.png" width="22%" />
  <img src="assets/screenshots/light/company_jobs.png" width="22%" />
</p>

<p align="center">
  <img src="assets/screenshots/light/one_job.png" width="22%" />
  <img src="assets/screenshots/light/apply.png" width="22%" />
  <img src="assets/screenshots/light/url.png" width="22%" />
  <img src="assets/screenshots/light/profile.png" width="22%" />
</p>

---

### 🌚 Dark Design

<p align="center">
  <img src="assets/screenshots/dark/home.png" width="22%" />
  <img src="assets/screenshots/dark/category.png" width="22%" />
  <img src="assets/screenshots/dark/one_category.png" width="22%" />
  <img src="assets/screenshots/dark/recent.png" width="22%" />
</p>

<p align="center">
  <img src="assets/screenshots/dark/search.png" width="22%" />
  <img src="assets/screenshots/dark/companies.png" width="22%" />
  <img src="assets/screenshots/dark/company_about.png" width="22%" />
  <img src="assets/screenshots/dark/company_jobs.png" width="22%" />
</p>

<p align="center">
  <img src="assets/screenshots/dark/one_job.png" width="22%" />
  <img src="assets/screenshots/dark/apply.png" width="22%" />
  <img src="assets/screenshots/dark/url.png" width="22%" />
  <img src="assets/screenshots/dark/profile.png" width="22%" />
</p>
  
---

## ⚙️ How to Run

1. **Clone the repo**  
   ```bash
   git clone https://github.com/golnooshA/job-tracker.git
   cd job-tracker

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Run the app**

   ```bash
   flutter run
   ```


