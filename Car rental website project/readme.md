# SYIOK Wheels Online Car Rental System

## Introduction
SYIOK Wheels is an online car rental system designed to streamline the process of renting and managing car rentals efficiently.

## Prerequisites
Before building and running the project, ensure you have the following installed:

- **Backend Requirements:**
  - Node.js (v16+)
  - Express.js
  - MongoDB or MySQL (depending on the database used)
  - Required dependencies listed in `package.json`

- **Frontend Requirements:**
  - React.js (or any frontend framework used)
  - npm or yarn package manager
  - Any additional UI libraries required

## Installation Steps

### 1. Clone the Repository
```sh
git clone https://github.com/yourusername/syiok-wheels.git
cd syiok-wheels
```

### 2. Install Dependencies
#### Backend:
```sh
cd backend
npm install
```
#### Frontend:
```sh
cd frontend
npm install
```

### 3. Configure the Environment
- Create a `.env` file in the `backend/` directory and add required environment variables:
  ```env
  PORT=5000
  DATABASE_URL=mongodb://localhost:27017/syiok_wheels
  JWT_SECRET=your_secret_key
  ```
- Update `frontend/.env` if needed for API URLs.

### 4. Run the Application
#### Start Backend Server:
```sh
cd backend
npm start
```
#### Start Frontend:
```sh
cd frontend
npm start
```

### 5. Access the Application
- Open your browser and go to `http://localhost:3000` for the frontend.
- Backend API runs on `http://localhost:5000`

## Deployment
- Deploy the backend using **Heroku, AWS, or DigitalOcean**.
- Deploy the frontend using **Vercel, Netlify, or Firebase Hosting**.

## Contributing
Feel free to fork the repository and submit pull requests for improvements.

## License
This project is licensed under the MIT License.

