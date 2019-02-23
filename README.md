Jungle
=====================

A mini e-commerce application built with Rails 4.2 to assist in learning Ruby on Rails. Code is inherited from the source and I added project features as outlined below.

### Project Features
- Products in the catalogue show a "SOLD OUT" badge if their quantity is zero.
- Adding/removing products and adding categories are permitted only for those with an Admin sign-in
- Users can register for an account and login to their account. If they try to register with an already existing e-mail address they are redirected to the login page. 
- After completion of an order a detailed order page is shown with each item purchased, totals, their e-mail address, and order number.
  - An e-mail version of this is also generated to be sent to their e-mail address.
- Users cannot checkout with an empty cart.
- Once logged in users can review products on a 1-5 scale and leave an optional description. They can also delete their own reviews. The average of a product's reviews are displayed in the catalogue. 


### Project Stack
 - Front End: HTML, SASS, Bootstrap
 - Back End: Ruby on Rails

### Screenshots
![SOLD OUT Badge](https://github.com/erinltoth/jungle-rails/blob/master/docs/sold-out.png?raw=true)
![Order Details Page](https://github.com/erinltoth/jungle-rails/blob/master/docs/order-complete.png?raw=true)
![Full Rating & Review](https://github.com/erinltoth/jungle-rails/blob/master/docs/full-review.png?raw=true)
![Review Average Display](https://github.com/erinltoth/jungle-rails/blob/master/docs/front-review.png?raw=true)

### Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server

### Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

### Dependencies

* Rails 4.2
* PostgreSQL 9.x
* Stripe
* Bcrypt
