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
Which is internal to using base-16 when representing base-10 numbers.  This makes measuring the number of decimal places after a decimal point very tricky.  For this reason, the line calling the price verification function will be initially commented out.  It can be re-enabled once the database has been properly seeded.

Country names must be listed EXACTLY as they appear in the country lookup gem that has been installed;
eg: United States of America
NOT: US, USA, America, United States, 'merica, etc.

For this reason, the country verification function which calls the country lookup gem has been initially disabled.  The commented-out line of code which calls the function can be re-enabled once the database has been properly seeded with test data.

Both of these two lines of code can be uncommented in app/models/product.rb.

## Support and contact details

For further support, please contact Ken Rutan via his Github account.  E-mail will not be listed here as this README is publicly displayed.

## Technologies Used

This website was constructed using HTML, CSS and Javascript as well as Ruby running on a Rails framework.

## License

&copy; 2017 Ken Rutan _MIT_  **MIT License**
