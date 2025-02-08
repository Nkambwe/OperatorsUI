# Operators - Application UI

**Operators** is a Java-based web application built using **JSP (JavaServer Pages)**, designed and developed in **NetBeans 21** with **Java 21.0.5**. This repository contains the user interface (UI) for the application.

## 📌 Requirements

Before cloning and setting up this project, ensure you have the following installed:

### 🔹 Required Software
- **Java Development Kit (JDK) 21.0.5**  
  - [Download JDK 21](https://jdk.java.net/21/)
- **Apache Tomcat (Version 10 or higher recommended)**  
  - [Download Tomcat](https://tomcat.apache.org/)
- **NetBeans 21** (or any compatible IDE supporting JSP & Servlets)  
  - [Download NetBeans](https://netbeans.apache.org/)
- **Maven** (optional, if using dependency management)  
  - [Download Maven](https://maven.apache.org/)

### 🔹 Recommended Browser
- **Google Chrome**, **Mozilla Firefox**, or any modern browser supporting JavaScript.

---

## 🚀 Getting Started

### 1 Clone the Repository
```sh
git clone https://github.com/yourusername/operators-ui.git
cd operators-ui

### 2 Clone the Repository
Open NetBeans 21.
Click on File > Open Project.
Navigate to the cloned repository folder and select it.
Wait for NetBeans to load dependencies.

### 3 Configure Tomcat Server
Go to Tools > Servers in NetBeans.
Click Add Server, then choose Apache Tomcat.
Browse and select your Tomcat installation directory.
Set the server port (default: 8080).
Save and close.

### 4 Build & Run the Application
Click on Run Project (F6) in NetBeans.
OR
Deploy manually using the Tomcat server:

mvn clean package

### 5 Access the Application
Once the server starts, open your browser and navigate to:
🔗 http://localhost:[port]/Operators/

### Project Structure
operators-ui/
│── src/
│   ├── main/
│   │   ├── webapp/          # JSP files and static assets
│   │   ├── java/            # Java source code
│── WEB-INF/
│   ├── web.xml              # Deployment descriptor
│── pom.xml                  # Maven dependencies (if applicable)
│── README.md                # Project documentation
│── .gitignore               # Git ignored files
