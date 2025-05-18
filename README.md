# CI/CD Flask App Deployment using GitHub Actions & AWS EC2 🚀

This project demonstrates a complete CI/CD pipeline setup for a simple **Flask web application** using **GitHub Actions** to deploy code automatically on an **AWS EC2 instance**.

---

## 🔧 Tech Stack

- **Flask** (Python)
- **GitHub Actions** (CI/CD)
- **AWS EC2** (Ubuntu Amazon Linux 2)
- **SSH Key Authentication**
- **Linux Bash Scripts**

---

## 📁 Project Structure
ci-cd-flask-app/

│

├── app.py # Flask application

├── requirements.txt # Python dependencies

├── run.sh # Deployment script executed on EC2

├── .github/

│ └── workflows/

│ └── ci.yml # GitHub Actions workflow

---

## ⚙️ Workflow Process

1. Developer pushes code to `main` branch.
2. GitHub Actions triggers the workflow (`ci.yml`).
3. The workflow:
   - Sets up Python
   - Decodes the base64 SSH private key
   - Connects to EC2 via SSH
   - Pulls latest code
   - Installs Python dependencies
   - Restarts the Flask app using `run.sh`

---

## 🔐 GitHub Secrets Used

| Secret Name         | Description                                   |
|---------------------|-----------------------------------------------|
| `EC2_HOST`          | Public IP or DNS of your EC2 instance         |
| `EC2_USER`          | EC2 username (e.g., `ec2-user`)               |
| `EC2_SSH_KEY_B64`   | Base64-encoded `.pem` private key             |

---

## 🖥️ Deployment Script (`run.sh`)

```bash
#!/bin/bash
cd ~/ci-cd-flask-app
git pull origin main
pip3 install -r requirements.txt
nohup python3 app.py > output.log 2>&1 &
✅ This ensures your Flask app is always updated and running in the background.

| `EC2_SSH_KEY_B64`   | Base64-encoded `.pem` private key             |
```

---

## 🧪 How to Test
Push any code update to the main branch

Watch the Actions tab in your GitHub repo

Once green ✅, visit http://<EC2_PUBLIC_IP>:5000/ in your browser

---

## 📌 Future Enhancements
Use Gunicorn + Nginx for production-grade serving

Enable Docker-based deployments

Add automated testing stage to workflow

---

## 📸 Architecture Diagram
GitHub Repo

    │
    └── Push to Main
         │
         ▼
         GitHub Actions Workflow
         │
         └── SSH to EC2   
               │
               └── Pull Code + Restart App
                   │          
                   ▼
                 Flask App Live on EC2

---

## 📬 Contact

Author: Mukeetuzzama

LinkedIn: www.linkedin.com/in/mukeetuzzama

Email: mukeetuzzama@outlook.com
