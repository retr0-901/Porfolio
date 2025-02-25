# Bird Classification System in Malaysia using CNN

## 📌 Project Overview
This project is a **Bird Classification System** designed to identify bird species in Malaysia using **Convolutional Neural Networks (CNNs)**. The system processes images and classifies bird species based on features extracted using deep learning models.

## 🛠️ Technologies Used
- **Programming Language:** Python
- **Deep Learning Framework:** TensorFlow / Keras
- **Libraries:** NumPy, OpenCV, Matplotlib, Pandas
- **Web Framework for GUI:** Streamlit
- **Dataset Source:** Kaggle (450 bird species dataset)

## 🚀 Installation & Setup

### 1. Clone the Repository
```sh
git clone https://github.com/yourusername/bird-classification-cnn.git
cd bird-classification-cnn
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

## 📊 Training the CNN Model
1. Download and preprocess the dataset.
2. Train the model using EfficientNet or ResNet architectures.
3. Evaluate performance using accuracy and F1-score metrics.

Run the training script:
```sh
python train.py
```

## 🎮 Running the Bird Classification System
1. Ensure the trained model is available (`model.h5`).
2. Start the Streamlit web application:
```sh
streamlit run app.py
```
3. Upload a bird image and view classification results.

## 📌 Features
- Image-based bird species classification.
- Utilizes **EfficientNet and ResNet CNN architectures**.
- GUI built with **Streamlit** for easy image upload and predictions.
- High classification accuracy (above 90%).

## 📬 Contact
If you have any questions or contributions, feel free to reach out:
- **Email:** your_email@example.com
- **GitHub:** [yourgithubprofile](https://github.com/yourusername)

Let's build AI-powered wildlife conservation together! 🐦🚀
