import sqlite3
import os
import time

DATABASE_PATH = os.path.abspath(os.path.join(os.path.dirname(__file__), 'chat_app.db'))
print(f"Database path: {DATABASE_PATH}")

def create_table():
    retries = 5
    while retries > 0:
        try:
            conn = sqlite3.connect(DATABASE_PATH, timeout=10)
            c = conn.cursor()
            c.execute('''CREATE TABLE IF NOT EXISTS messages (id INTEGER PRIMARY KEY, user_id INTEGER, message TEXT, response TEXT)''')
            c.execute('''CREATE TABLE IF NOT EXISTS data (key TEXT PRIMARY KEY, value TEXT)''')
            c.execute('''CREATE TABLE IF NOT EXISTS bookings (id INTEGER PRIMARY KEY, user_id INTEGER, class_date TEXT, class_time TEXT)''')
            c.execute('''CREATE TABLE IF NOT EXISTS users (user_id INTEGER PRIMARY KEY, name TEXT, password TEXT, rank TEXT)''')
            c.execute('''CREATE TABLE IF NOT EXISTS bookings (id INTEGER PRIMARY KEY AUTOINCREMENT, user_id TEXT NOT NULL,class_time TEXT NOT NULL,class_id TEXT NOT NULL
    )
    ''')
            conn.commit()
            print("Tables created successfully.")
            break
        except sqlite3.OperationalError as e:
            print(f"Error creating tables: {e}")
            retries -= 1
            time.sleep(1)
        finally:
            conn.close()

def authenticate_user(name, password):
    try:
        conn = sqlite3.connect(DATABASE_PATH, timeout=10)
        c = conn.cursor()
        c.execute('SELECT rank FROM users WHERE name = ? AND password = ?', (name, password))
        user = c.fetchone()
        return user[0] if user else None
    except sqlite3.OperationalError as e:
        print(f"Error during authentication: {e}")
        return None
    finally:
        conn.close()


def retry_db_operation(operation, *args, retries=5, delay=1):
    while retries > 0:
        try:
            return operation(*args)
        except sqlite3.OperationalError as e:
            if 'locked' in str(e):
                print(f"Database is locked. Retrying in {delay} seconds...")
                time.sleep(delay)
                retries -= 1
            else:
                raise
    raise Exception("Max retries reached")

def insert_message(user_id, message, response):
    def _insert_message(user_id, message, response):
        conn = sqlite3.connect(DATABASE_PATH, timeout=10)
        try:
            print(f"Inserting message: user_id={user_id}, message={message}, response={response}")
            c = conn.cursor()
            c.execute('INSERT INTO messages (user_id, message, response) VALUES (?, ?, ?)', (user_id, message, response))
            c.execute('INSERT OR IGNORE INTO users (user_id) VALUES (?)', (user_id,))
            conn.commit()
            print("Message inserted successfully.")
        finally:
            conn.close()
    
    retry_db_operation(_insert_message, user_id, message, response)

def insert_data(key, value):
    def _insert_data(key, value):
        conn = sqlite3.connect(DATABASE_PATH, timeout=10)
        try:
            print(f"Inserting data: key={key}, value={value}")
            c = conn.cursor()
            c.execute('INSERT INTO data (key, value) VALUES (?, ?)', (key, value))
            conn.commit()
            print("Data inserted successfully.")
        finally:
            conn.close()
    
    retry_db_operation(_insert_data, key, value)

def update_data(key, value):
    def _update_data(key, value):
        conn = sqlite3.connect(DATABASE_PATH, timeout=10)
        try:
            print(f"Updating data: key={key}, value={value}")
            c = conn.cursor()
            c.execute('UPDATE data SET value = ? WHERE key = ?', (value, key))
            conn.commit()
            print("Data updated successfully.")
        finally:
            conn.close()
    
    retry_db_operation(_update_data, key, value)

def insert_booking(user_id, class_time, class_id):
    conn = sqlite3.connect(DATABASE_PATH)
    c = conn.cursor()
    c.execute('''
    INSERT INTO bookings (user_id, class_time, class_id),
    VALUES (?, ?, ?),''', (user_id, class_time, class_id))
    conn.commit()
    conn.close()
    
    retry_db_operation(insert_booking, user_id, class_time,class_id)
def insert_booking_with_class(user_id, class_time, class_id):
    try:
        conn = sqlite3.connect(DATABASE_PATH, timeout=10)
        c = conn.cursor()
        c.execute('''
            INSERT INTO bookings (user_id, class_time, class_id) 
            VALUES (?, ?, ?)
        ''', (user_id, class_time, class_id))
        conn.commit()
        print("Booking inserted successfully.")
    except sqlite3.OperationalError as e:
        print(f"Error inserting booking: {e}")
    finally:
        conn.close()
def update_booking(user_id, class_date, class_time):
    def _update_booking(user_id, class_date, class_time):
        conn = sqlite3.connect(DATABASE_PATH, timeout=10)
        try:
            print(f"Updating booking: user_id={user_id}, class_date={class_date}, class_time={class_time}")
            c = conn.cursor()
            c.execute('UPDATE bookings SET class_date = ?, class_time = ? WHERE user_id = ?', (class_date, class_time, user_id))
            conn.commit()
            print("Booking updated successfully.")
        finally:
            conn.close()
    
    retry_db_operation(_update_booking, user_id, class_date, class_time)

def check_availability(class_date, class_time):
    def _check_availability(class_date, class_time):
        conn = sqlite3.connect(DATABASE_PATH, timeout=10)
        try:
            c = conn.cursor()
            c.execute('SELECT * FROM bookings WHERE class_date = ? AND class_time = ?', (class_date, class_time))
            booking = c.fetchone()
            print(f"Checked availability for {class_date} at {class_time}: {'Available' if booking is None else 'Unavailable'}")
            return booking is None
        finally:
            conn.close()
    
    return retry_db_operation(_check_availability, class_date, class_time)
def add_class_id_column():
    try:
        conn = sqlite3.connect(DATABASE_PATH, timeout=10)
        c = conn.cursor()
        c.execute('ALTER TABLE bookings ADD COLUMN class_id TEXT')
        conn.commit()
        print("class_id column added successfully.")
    except sqlite3.OperationalError as e:
        if 'duplicate column name' in str(e):
            print("class_id column already exists.")
        else:
            print(f"Error adding class_id column: {e}")
    finally:
        conn.close()

def insert_booking_with_class(user_id, class_time, class_id):
    try:
        conn = sqlite3.connect(DATABASE_PATH, timeout=10)
        c = conn.cursor()
        c.execute('''
            INSERT INTO bookings (user_id, class_time, class_id) 
            VALUES (?, ?, ?)
        ''', (user_id, class_time, class_id))
        conn.commit()
        print("Booking inserted successfully.")
    except sqlite3.OperationalError as e:
        print(f"Error inserting booking: {e}")
    finally:
        conn.close()

def booking_exists(user_id, class_time, class_id):
    try:
        conn = sqlite3.connect(DATABASE_PATH, timeout=10)
        c = conn.cursor()
        c.execute('''
            SELECT 1 FROM bookings 
            WHERE user_id = ? AND class_time = ? AND class_id = ?
        ''', (user_id, class_time, class_id))
        exists = c.fetchone() is not None
        return exists
    except sqlite3.OperationalError as e:
        print(f"Error checking booking existence: {e}")
        return False
    finally:
        conn.close()
def get_user_booking(user_id):
    def _get_user_booking(user_id):
        conn = sqlite3.connect(DATABASE_PATH, timeout=10)
        try:
            c = conn.cursor()
            c.execute('SELECT * FROM bookings WHERE user_id = ?', (user_id,))
            booking = c.fetchone()
            print(f"User booking for user_id={user_id}: {booking}")
            return booking
        finally:
            conn.close()
    
    return retry_db_operation(_get_user_booking, user_id)

def get_chat_history(user_id):
    def _get_chat_history(user_id):
        conn = sqlite3.connect(DATABASE_PATH, timeout=10)
        try:
            c = conn.cursor()
            c.execute('SELECT message, response FROM messages WHERE user_id = ? ORDER BY id', (user_id,))
            history = c.fetchall()
            print(f"Chat history for user_id={user_id}: {history}")
            return history
        finally:
            conn.close()
    
    return retry_db_operation(_get_chat_history, user_id)

def get_all_users():
    def _get_all_users():
        conn = sqlite3.connect(DATABASE_PATH, timeout=10)
        try:
            c = conn.cursor()
            c.execute('SELECT user_id FROM users')
            users = c.fetchall()
            print(f"All users: {users}")
            return [user[0] for user in users]
        finally:
            conn.close()
    
    return retry_db_operation(_get_all_users)

def insert_user(user_id, name, password, rank):
    def _insert_user(user_id, name, password, rank):
        conn = sqlite3.connect(DATABASE_PATH, timeout=10)
        try:
            print(f"Inserting user: user_id={user_id}, name={name}, password={password}, rank={rank}")
            c = conn.cursor()
            # Check if the user already exists
            c.execute('SELECT user_id FROM users WHERE user_id = ?', (user_id,))
            if c.fetchone() is None:
                c.execute('INSERT INTO users (user_id, name, password, rank) VALUES (?, ?, ?, ?)', (user_id, name, password, rank))
                conn.commit()
                print("User inserted successfully.")
            else:
                print(f"User with user_id={user_id} already exists.")
        finally:
            conn.close()
    
    retry_db_operation(_insert_user, user_id, name, password, rank)

def add_user_class_column():
    conn = sqlite3.connect(DATABASE_PATH, timeout=10)
    try:
        c = conn.cursor()
        c.execute('ALTER TABLE book ADD COLUMN user_class TEXT')
        conn.commit()
        print("Column 'user_class' added successfully.")
    except sqlite3.OperationalError as e:
        print(f"An error occurred: {e}")
    finally:
        conn.close()

# Initialize the database
create_table()
add_user_class_column()

# Insert initial user data
insert_user(1, 'afif', '123', 'lecturer')
insert_user(2, 'abu', '555', 'student')
insert_user(3, 'kamal', '123', 'lecturer')
