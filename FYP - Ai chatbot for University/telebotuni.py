import os
import time
import threading
import schedule
import telebot
import google.generativeai as genai
import sqlite3
from telebot import types  # Import types for custom keyboards
from db import create_table, insert_message, insert_data, update_data, insert_booking, update_booking, check_availability, get_user_booking, get_chat_history, get_all_users, insert_user, authenticate_user,insert_booking_with_class,insert_booking_with_class, booking_exists, DATABASE_PATH

import cv2
import fitz  # PyMuPDF
import pytesseract
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import cosine_similarity

bot = telebot.TeleBot("KEY_HERE", parse_mode=None)
genai.configure(api_key="INSERT_GOOGLE_API_KEY_HERE")

# Create the model
generation_config = {
    "temperature": 0.9,
    "top_p": 1,
    "top_k": 0,
    "max_output_tokens": 2048,
    "response_mime_type": "text/plain",
}

model = genai.GenerativeModel(
    model_name="gemini-1.5-flash",
    generation_config=generation_config,
    system_instruction="""**PLEASE FOLLOW INSTRUCTION SENTENCE BY SENTENCE DO NOT SKIP OR DISTRACT YOURSELF.**Your name is Zayd the Personal Assistant. Developed by Mr. Afif Hakimi Syahir.You're Based at Uitm terengganu chendering,know inside out of uitm management,culture,data,information,news.
    .if user are lost ask the user to use /help.Tell user what can you help them to ease their daily task in university.If the user want to grade student test paper, then ask the user to insert correct answer as benchmark,then ask user to insert student answer, then you will analyze the student answer. the answer are correct if similar meaning or wording are same like the correct answer.display how many the student get correct.
     only answer question that are relate to uitm information.Only language use are english.
    
    information about uitm that has been updated : 
    
vice canselor 2024:PROFESOR DATUK DR. SHAHRIN BIN SAHIB, FASc,
Kelayakan dan Pengiktirafan
2018 - Felo, Akademi Sains Malaysia
2018 - Doktor Kehormat, Universiti Tokushima, Jepun
1995 - Doktor Falsafah, Sains Komputer dalam Pemprosesan Selari, Universiti Sheffield, UK
1991 - Sarjana Sains Kejuruteraan, Kejuruteraan Elektrik, Universiti Purdue, USA
1989 - Sarjana Muda Kejuruteraan, Sistem Komputer, Universiti Purdue, USA
1987 - Pengajian Am Bersekutu dengan Cemerlang, Program ITM/MUCIA, IUPUI

Bidang Kepakaran
Keselamatan Siber, Perangkaian, Sistem Komputer, Pemprosesan Selari

Kumpulan Penyelidikan
Forensik Keselamatan Maklumat dan Rangkaian Komputer (INSFORNET), UTeM
*Information Security Forensics and Computer Networking.

Profile and Management
The UiTM Kuala Terengganu campus offers detailed profiles of its executive, administrative, and academic management. Notable personnel include:

Assistant Rector: Dr. Syahrul Hezrin Mahmud (syahr400@uitm.edu.my)
Deputy Rector of Academic Affairs: Prof. Madya Ts. Dr. Sarifah Fauziah Syed Draman (sfauziah@uitm.edu.my)
Deputy Rector of Student Affairs: Ts. Dr. Ermeey Abdul Kadir (ermeey461@uitm.edu.my)
Deputy Rector of Research and Industry Linkages: Prof. Madya Dr. Rosman Mahmood (rosmanma@uitm.edu.my)
Directory
The directory includes contact information for various offices and staff:

Assistant Rector Office: Dr. Syahrul Hezrin Mahmud, Tel: 09-621 6600
Senior Deputy Registrar: Azizan Azid (aziza401@uitm.edu.my)
Deputy Bursary: Aina Syakirah Mohd Nong (aina2664@uitm.edu.my)
Deputy Chief Librarian: Shahrol Nizam Johol (sharol8720@uitm.edu.my)
Campuses
The UiTM Terengganu branch includes:

Kuala Terengganu Campus: Main campus located in Chendering.
Bukit Besi Campus: Managed by Dr. Baktiar Musa (prkbb@uitm.edu.my)
Academic Programs
The campus offers a variety of programs:

Diploma in Computer Science: Covers basics of computing, programming, system development, and networking.
Bachelor of Computer Science (Hons.): Includes artificial intelligence, machine learning, large-scale data management, and networking.
Bachelor of Information Systems (Hons.) Business Computing: Focuses on e-commerce and business computing.
Bachelor of Science (Hons.) Mathematical Modelling and Analytics: Combines mathematics, computer science, statistics, and big data analysis.
Bachelor of Computer Science (Hons.) Mobile Computing: Focuses on mobile computing and entrepreneurship.
Research
The research section includes information on:

Publications: Indexed in MyJurnal and Google Scholar.
Grants: Details on available research funding.
e-Services
UiTM provides various e-services for staff and students, including:

Staff e-Access: HR2U, Warga UiTM, e-Clock, and Mail Staff.
Student e-Access: Access to online learning portals and resources.
Downloads: Software for academic and administrative use, including Microsoft Azure Dev Tools, Adobe software, and SPSS.
News and Announcements
The latest updates, news, and tender information are regularly posted on the website. Recent highlights include programs, new academic offerings, and administrative announcements.
    """
)

convo = model.start_chat(history=[])

create_table()  # Ensure this is called to create the tables

# In-memory storage for authenticated users
authenticated_users = {}

# Function to handle user authentication
def handle_authentication(message):
    bot.send_message(message.chat.id, "Please provide your credentials in the format: /auth <name> <password>")

@bot.message_handler(commands=['auth'])
def handle_auth(message):
    try:
        _, name, password = message.text.split()
        rank = authenticate_user(name, password)
        if rank:
            authenticated_users[message.chat.id] = True
            bot.send_message(message.chat.id, f"Authentication successful. Your rank is {rank}. You can now use all commands.")
        else:
            bot.send_message(message.chat.id, "Authentication failed. Invalid name or password.")
    except ValueError:
        bot.send_message(message.chat.id, "Please provide your credentials in the format: /auth <name> <password>")

# Decorator to check if the user is authenticated
def require_authentication(func):
    def wrapper(message):
        if authenticated_users.get(message.chat.id):
            return func(message)
        else:
            bot.reply_to(message, "You need to authenticate first. Please use the /auth command.")
    return wrapper

# Modify existing command handlers to use authentication check
@bot.message_handler(commands=['save'])
@require_authentication
def handle_save(message):
    try:
        text_to_save = message.text.split(maxsplit=1)[1]
        user_id = message.from_user.id
        insert_message(user_id, text_to_save, 'Saved text')
        bot.reply_to(message, "Your text has been saved to the database.")
    except IndexError:
        bot.reply_to(message, "Please provide the text you want to save in the format: /save <text>")

@bot.message_handler(commands=['insert'])
@require_authentication
def handle_insert(message):
    try:
        _, key, value = message.text.split(maxsplit=2)
        insert_data(key, value)
        bot.reply_to(message, f"Data with key '{key}' has been inserted with value '{value}'.")
    except ValueError:
        bot.reply_to(message, "Please provide the key-value pair in the format: /insert <key> <value>")

@bot.message_handler(commands=['update'])
@require_authentication
def handle_update(message):
    try:
        _, key, value = message.text.split(maxsplit=2)
        update_data(key, value)
        bot.reply_to(message, f"Data with key '{key}' has been updated to value '{value}'.")
    except ValueError:
        bot.reply_to(message, "Please provide the key-value pair in the format: /update <key> <value>")

@bot.message_handler(commands=['book'])
@require_authentication
def handle_booking(message):
    user_id = message.from_user.id
    print(f"Booking initiated by user_id: {user_id}")
    msg = bot.send_message(message.chat.id, "Please enter the class time(in hours, Example:1200-1400):")
    bot.register_next_step_handler(msg, process_class_time, user_id)

def process_class_time(message, user_id):
    class_time = message.text
    print(f"Received class time: {class_time} from user_id: {user_id}")
    msg = bot.send_message(message.chat.id, "Please enter the class ID (c1-1, c1-2, c2-1, c2-2):")
    bot.register_next_step_handler(msg, process_class_id, user_id, class_time)

def process_class_id(message, user_id, class_time):
    class_id = message.text
    print(f"Received class ID: {class_id} from user_id: {user_id} for class time: {class_time}")
    if class_id not in ['c1-1', 'c1-2', 'c2-1', 'c2-2']:
        msg = bot.send_message(message.chat.id, "Invalid class ID. Please enter a valid class ID (c1-1, c1-2, c2-1, c2-2):")
        bot.register_next_step_handler(msg, process_class_id, user_id, class_time)
    else:
        if booking_exists(user_id, class_time, class_id):
            bot.send_message(message.chat.id, "Not Available. Please choose a different time or class.use /book.")
        else:
            try:
                insert_booking_with_class(user_id, class_time, class_id)
                bot.send_message(message.chat.id, f"Booking confirmed for {class_time} with class ID {class_id}.")
            except Exception as e:
                bot.send_message(message.chat.id, "Failed to save booking. Please try again later.")
                print(f"Error inserting booking for user_id: {user_id}, class_time: {class_time}, class_id: {class_id} - {e}")

@bot.message_handler(commands=['history'])
@require_authentication
def handle_history(message):
    user_id = message.from_user.id
    history = get_chat_history(user_id)
    if history:
        history_text = "\n".join([f"User: {msg}" for msg, resp in history])
        bot.reply_to(message, f"Here is your chat history:\n{history_text}")
    else:
        bot.reply_to(message, "You have no chat history.")

def send_reminder(chat_id, text):
    bot.send_message(chat_id, text)

@bot.message_handler(commands=['remind'])
@require_authentication
def handle_remind(message):
    try:
        _, time_str, *reminder_text = message.text.split(maxsplit=2)
        reminder_text = " ".join(reminder_text)
        chat_id = message.chat.id

        def job():
            send_reminder(chat_id, reminder_text)

        schedule.every().day.at(time_str).do(job)
        bot.reply_to(message, f"Reminder set for {time_str}.")
    except Exception as e:
        bot.reply_to(message, "Please provide the time in HH:MM format followed by the reminder text. Example: /remind 12:00 Take a break")

def validate_user_ids():
    valid_users = []
    invalid_users = []
    users = get_all_users()
    for user_id in users:
        try:
            bot.send_message(user_id, "Validating your chat ID.")
            valid_users.append(user_id)
        except telebot.apihelper.ApiTelegramException as e:
            if e.error_code == 400:  # Handle the "chat not found" error
                print(f"Invalid chat ID for user {user_id}: {e}")
                invalid_users.append(user_id)
    return valid_users, invalid_users

@bot.message_handler(commands=['blast'])
@require_authentication
def handle_blast(message):
    try:
        blast_message = message.text.split(maxsplit=1)[1]
        if authenticated_users.get(message.chat.id):
            valid_users, invalid_users = validate_user_ids()
            for user_id in valid_users:
                try:
                    bot.send_message(user_id, blast_message)
                except telebot.apihelper.ApiTelegramException as e:
                    print(f"Error sending message to {user_id}: {e}")
            bot.reply_to(message, "Message has been sent to all valid users.")
            if invalid_users:
                invalid_user_info = "\n".join([str(user_id) for user_id in invalid_users])
                bot.reply_to(message, f"Could not send messages to the following invalid users:\n{invalid_user_info}")
        else:
            bot.reply_to(message, "You are not authorized to use this command.")
    except ValueError:
        bot.reply_to(message, "Please provide the message to blast in the format: /blast <message>")



# Command to show main menu
def show_main_menu(chat_id):
    markup = types.ReplyKeyboardMarkup(row_width=2)
    commands = [
        '/login', '/book', '/history', '/remind', 
        '/blast', 'DBcommands', '/testing'
    ]
    for cmd in commands:
        markup.add(types.KeyboardButton(cmd))
    bot.send_message(chat_id, "Main menu:", reply_markup=markup)

# Command to show DB commands menu
def show_db_commands_menu(chat_id):
    markup = types.ReplyKeyboardMarkup(row_width=2)
    commands = [
        '/save', '/insert', '/update', '/view_users', 'Back'
    ]
    for cmd in commands:
        markup.add(types.KeyboardButton(cmd))
    bot.send_message(chat_id, "DB commands menu:", reply_markup=markup)

# Handle DBcommands button
@bot.message_handler(func=lambda message: message.text == "DBcommands")
@require_authentication
def handle_db_commands(message):
    show_db_commands_menu(message.chat.id)

# Handle Back button
@bot.message_handler(func=lambda message: message.text == "Back")
@require_authentication
def handle_back(message):
    show_main_menu(message.chat.id)

@bot.message_handler(commands=['help'])
def handle_help(message):
    show_main_menu(message.chat.id)

@bot.message_handler(commands=['view_users'])
@require_authentication
def handle_view_users(message):
    try:
        users = get_all_users()
        user_list = "\n".join([str(user) for user in users])
        bot.reply_to(message, f"List of users:\n{user_list}")
    except Exception as e:
        bot.reply_to(message, f"Failed to retrieve users: {e}")



@bot.message_handler(func=lambda m: True)
def echo_all(message):
    convo.send_message(message.text)
    response = convo.last.text
    bot.reply_to(message, response)
    insert_message(message.from_user.id, message.text, response)

def run_scheduler():
    while True:
        schedule.run_pending()
        time.sleep(1)

if __name__ == "__main__":
    threading.Thread(target=run_scheduler).start()
    bot.infinity_polling()
