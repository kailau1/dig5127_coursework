# DIG_5127 COURSEWORK

Product catalog web app using PHP and MySQL. 

## Prerequisites

Necessary to set up and run the project:

XAMPP
Node.js

## Installation 

XAMPP install here: [Download Page](https://www.apachefriends.org/download.html)

NODE.JS install here: [Download Page](https://nodejs.org/en/download)

Once both are installed. To set-up run xampp manager and start up the **Apache Web Server** and the **SQL Server**

Within the xampp directory, git clone this repository or extract downloaded zip file to **htdocs**.

On terminal/cli run:

```
npm install sass
```

```
npm install bootstrap@v5.3.2
```

This will install the used dependancies, the rest are CDNs within the html code.

To access the home page, if xampp is running on localhost use: http://localhost/dig5127_coursework/index.php(http://localhost/dig5127_coursework/index.php).
If not replace with the correct address

## Folder Structure

```
- /dig5127_coursework   # Contains all files/folders and the index page
    - /admin # Contains admin html pages.
    - /assets # Contains usable folders
        - /components # Contains website components
        - /images #Contains images for the website
    - /css # Contains all css/scss files
    - /db # Contains SQL scripts and database connector

```

## SQL database setup

Within PHP myadmin, copy the code within create_database.sql and run it.

This will create the db structure.

TODO: Create insert statements for test data. Add table for admin login.