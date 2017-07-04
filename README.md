# README
# Animal Zoo Angular Project

#### _July 3rd, 2017_

#### By _**Ken Rutan**_

## Overview

This website is a one-to-many relationship with full CRUD functionality created in Ruby on Rails.  It allows the user to send and retrieve database objects from a postgresql database on the back end of the website.

## Objective

The objective of this project was to create a functional and user friendly front end landing-page where a user can enter information on various products which will then be entered into a database.  The user can then select an individual product on the site's page and navigate to that particular page and view further information on that particular product.  Users can then leave reviews on various products and rate them, the average total of all ratings will then be displayed on the main page.


## Usage

Navigate to the homepage and choose to enter a new product.  You may then enter information on the specifics of that particular product.  Once the product has been created, the user may then leave whatever reviews they wish on that product.

## Known Bugs

Apparently sometimes numbers with a cents value ending in a 1 will fail to multiply properly during validation, springing an error that refuses to validate them.  This has to do with how ruby processes floating point values:
https://en.wikipedia.org/wiki/Floating-point_arithmetic#Accuracy_problems
Which is internal to using base-16 when representing base-10 numbers.  This makes measuring the number of decimal places after a decimal point very tricky.  For this reason, 

Country names must be listed EXACTLY as they appear in the country lookup gem that has been installed;

eg: United States

NOT: US, USA, America, United States of America, 'merica, etc.

## Support and contact details

For further support, please contact Ken Rutan via his Github account.  E-mail will not be listed here as this README is publicly displayed.

## Technologies Used

This website was constructed using HTML, CSS and Javascript as well as jQuerey elements running on Angular2 framework.

## License

&copy; 2017 Ken Rutan _MIT_  **MIT License**


This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

bugs
