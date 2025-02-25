# 📢 Telebot Uni - University Assistant Chatbot

## 📌 Project Overview
Telebot Uni is a **Telegram chatbot** designed to assist university students with various tasks, including **information retrieval, booking, reminders, and authentication**. The bot is powered by **Google Gemini AI** and utilizes a **SQLite database** for managing user interactions and bookings.

## 🛠️ Technologies Used
- **Programming Language:** Python
- **Frameworks & Libraries:**
  - `telebot` (Python Telegram Bot API)
  - `sqlite3` (Database Management)
  - `schedule` (Task Scheduling)
  - `google.generativeai` (AI-powered responses)
  - `cv2`, `pytesseract`, `fitz` (OCR & PDF Processing)
  - `scikit-learn` (Text Similarity Processing)

## 🚀 Installation & Setup

### 1. Clone the Repository
```sh
git clone https://github.com/yourusername/telebotuni.git
cd telebotuni
```

### 2. Create and Activate a Virtual Environment
```sh
python -m venv env  # Create virtual environment
source env/bin/activate  # Activate on Mac/Linux
env\Scripts\activate  # Activate on Windows
```

### 3. Install Dependencies
```sh
pip install -r requirements.txt
```

## 🔑 Setup API Keys & Database
1. **Telegram Bot Token:** Update your bot token in the script:
```python
bot = telebot.TeleBot("YOUR_TELEGRAM_BOT_TOKEN", parse_mode=None)
```
2. **Google Gemini AI Key:**
```python
genai.configure(api_key="YOUR_GOOGLE_GEMINI_API_KEY")
```
3. **Setup SQLite Database:** Ensure the database structure is initialized by running:
```sh
python db.py  # If using an external database script
```

## 🎮 Running the Bot
```sh
python telebotuni.py
```

## 🛠️ Features & Commands
### ✅ User Authentication
- `/auth <name> <password>` - Authenticate users with predefined credentials
- `/save <text>` - Save a message to the database

### 📅 Booking System
- `/book` - Book a class by specifying time and class ID
- `/history` - View user booking history

### ⏰ Reminders & Notifications
- `/remind <time> <message>` - Set a daily reminder
- `/blast <message>` - Send a broadcast message to all users (admin only)

### 📊 Admin & Database Commands
- `/insert <key> <value>` - Insert new data
- `/update <key> <value>` - Update existing data
- `/view_users` - Retrieve the list of all registered users

## 📬 Contact
For any questions or contributions:
- **GitHub:** [yourgithubprofile](https://github.com/yourusername)
- **Email:** your_email@example.com

🚀 Improve university management with AI-powered automation! 🤖🎓
