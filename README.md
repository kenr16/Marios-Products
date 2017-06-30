# README

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

Apparently sometimes numbers with a cents value ending in a 1 will fail to multiply properly during validation, springing an error that refuses to validate them.  This has to do with how ruby processes floating point values.

https://en.wikipedia.org/wiki/Floating-point_arithmetic#Accuracy_problems

This is not the kind of problem I anticipated.

Country names must be listed EXACTLY as they appear in the country lookup gem that has been installed;

eg: United States

NOT: US, USA, America, United States of America, 'merica, etc.
