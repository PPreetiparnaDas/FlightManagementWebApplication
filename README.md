📌 Flight Booking Web Application
A full-stack flight booking system that allows customers to search and book flights, while admins can manage flights, bookings, and users.

🚀 Built using: Servlets, JSP, JDBC, MySQL, jQuery, AJAX, Bootstrap 5
🛠 Pattern: MVC | Build Tool: Maven | Server: Apache Tomcat 10.26

📜 Features
👤 Customer Module
✅ User Registration/Login
✅ Search Flights (Based on date, location, etc.)
✅ Book Tickets
✅ View Booking History

🛠 Admin Module
✅ Add, Edit, Delete Flights
✅ Manage Customers & Bookings
✅ Dashboard for Analytics

🔄 Dynamic Features
✅ AJAX for real-time updates
✅ Responsive UI with Bootstrap 5

🖥️ Technologies Used
Stack	Technologies
Frontend	JSP, HTML5, CSS3, JavaScript, jQuery, AJAX, Bootstrap 5
Backend	Java Servlets, JDBC
Database	MySQL
Architecture	MVC
Build Tool	Maven
Server	Apache Tomcat 10.26
🚀 Installation & Setup
🔧 Prerequisites
Install JDK 11+
Install Apache Tomcat 10.26
Install MySQL
Install Maven
📥 Steps to Set Up
Clone the Repository

sh
Copy
Edit
git clone https://github.com/your-username/flight-booking-app.git
cd flight-booking-app
Import into Eclipse/IntelliJ

Open Eclipse/IntelliJ IDEA
Import as a Maven Project
Configure Database

Create a MySQL Database
Import schema.sql (if available)
Update db.properties in the project
Build & Deploy

sh
Copy
Edit
mvn clean install
Deploy on Apache Tomcat
Start the server
Access the Application

Customer Portal: http://localhost:8080/FlightBookingApp/
Admin Panel: http://localhost:8080/FlightBookingApp/admin
📂 Project Structure
bash
Copy
Edit
📂 src/main/java/com/otz
 ├── 📂 controller      # Servlets (Admin, Booking, Flight, User)
 ├── 📂 dao            # Database access layer (JDBC)
 ├── 📂 model          # JavaBeans (Flight, Booking, User)
 ├── 📂 service        # Business logic
📂 src/main/webapp
 ├── 📂 WEB-INF        # Configurations
 ├── 📂 include       # Admin JSP pages
 ├── 📜 index.jsp      # Homepage
 ├── 📜 login.jsp      # Login Page
 ├── 📜 search.jsp     # Flight Search
 ├── 📜 ticket.jsp     # Booking Details
📌 Future Enhancements
✅ Payment Gateway Integration
✅ Email & SMS Notifications
✅ Seat Selection & Dynamic Pricing
