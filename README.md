# E-Commerce Website

## Overview

This project is an e-commerce website developed using Java EE servlets, JSP, and MySQL database. The website allows users to browse products, add them to their cart, and make purchases online. It provides an intuitive user interface for both customers and administrators to manage products and user accounts.

## Features

- **User Authentication:** Customers can create accounts, log in, and manage their profiles. Administrators have access to additional functionalities for managing users.
  
- **Product Management:** Administrators can add, edit, and delete products from the inventory. Each product includes details such as name, description, price, and quantity.

- **Shopping Cart:** Customers can add products to their shopping cart, view the cart contents, update quantities, and proceed to checkout.

- **Search and Filtering:** Users can search for products by keyword and filter results based on categories, prices, and other attributes.

## Technologies Used

- **Java EE Servlets:** Backend logic and request handling.
- **JSP (JavaServer Pages):** Dynamic web pages for presentation and user interface.
- **MySQL Database:** Data storage and management.
- **HTML, CSS, JavaScript:** Frontend development for user interface and interactivity.

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/Anands001/Greeno.git
   cd Greeno-main
   ```

2. Set up the MySQL database:
   - Create a new MySQL database and import the provided SQL schema file (`database.sql`).

3. Configure database connection:
   - Update the database connection settings in the `config.properties` file.

4. Deploy the application:
   - Deploy the WAR file to a Java EE-compliant application server (e.g., Apache Tomcat).

## Usage

1. Access the website:
   - Open a web browser and navigate to the URL where the application is deployed.

2. Register/Login:
   - Create a new account or log in using existing credentials.

3. Browse Products:
   - Explore the available products, search for specific items, and add them to your cart.

4. Manage Cart:
   - View your shopping cart, update quantities, and proceed to checkout.

## Project Demo Images

### User Authentication
![User Authentication](https://github.com/Anands001/Greeno/assets/110816114/e33c8e53-9b5f-436c-b64b-7b259175bab4)
- The user authentication feature allows customers to create accounts and log in securely.

### Home Page
![Home Page](https://github.com/Anands001/Greeno/assets/110816114/6e0149cf-5136-41db-81df-c61da3728fcc)
![image](https://github.com/Anands001/Greeno/assets/110816114/03a94d05-b6a0-467c-828d-5b7007d4f0a6)
![image](https://github.com/Anands001/Greeno/assets/110816114/85333fde-868a-4232-a864-7d0688bf22cf)

### Profile
![image](https://github.com/Anands001/Greeno/assets/110816114/0d5fd537-efbb-4258-850b-68857fefcf2a)

### Product Management
![image](https://github.com/Anands001/Greeno/assets/110816114/71690026-7a4d-4f3d-89d0-c71933205500)
- Administrators can manage products by adding new items, editing existing ones, and removing outdated products.

### Shopping Cart
![image](https://github.com/Anands001/Greeno/assets/110816114/83fb7b57-19bc-48dd-b7db-8efbe637117e)
- Customers can add products to their shopping cart, update quantities, and proceed to checkout seamlessly.

---
## License

This project is licensed under the [MIT License](LICENSE).

---
