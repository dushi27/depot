##E-commerce Web App

Book-Z is a business to consumer e-commerce application built based on <a href="http://www.amazon.com/Agile-Development-Rails-Pragmatic-Programmers/dp/1934356549">Agile Web Development with Rails</a>. Currently the application is live on <a href="http://bookz.herokuapp.com/">bookz.herokuapp.com</a>. Please feel free to explore the consumer interface and the admin interface of the application (admin username: bookzrails and password: bookzrails2014). If you have any questions, concerns or issues please feel free to contact me via <a href="https://twitter.com/Dushyanthi1">@Dushyanthi1</a> twitter handle.

The following documentation describes;

1. About and Technical Specs

2. How to use the Products API

3. Create a locat copy and testing


##About and Technical Specs

Book-z is built using Ruby on Rails version 4.1.1 and Ruby 2.1.1. It is currently in production using Postgresql database on Heroku cloud scalable server. It also integrate Mendrill email infrastructure and Google Analytics for application usage statistics.    


##Using the Products API

Book-Z also offers an autheticated RESTful JSON API of its products catalog. The access is limited to the Admin users of the application. To use the products API;

Step 1: Go to <a href="http://bookz.herokuapp.com/api/v1/products.json">bookz.herokuapp.com/api/v1/products.json</a>

Step 2: If you are not already signed in as an admin user, it will alert a login. Please ender the username "john" and password "john2014" OR if you have created a new Admin user, enter the appropriate credentials. Note that only an Admin user can create another admin user. 

Step 3: It'll render a list of products currently saved on the catalog

Step 4: To access a single product, add the product id to the URL. Example, <a href="http://bookz.herokuapp.com/api/v1/products/1.json">bookz.herokuapp.com/api/v1/products/1.json</a>. Above will render the first product in the catalog. 

###Curl Examples for Products API

1. To get the products catalog

```bash
curl -u john:john2014 http://bookz.herokuapp.com/api/v1/products.json
```

2. Get each product by product ID

```bash
curl -u john:john2014 http://bookz.herokuapp.com/api/v1/products/1.json
```

##Creating a Local Copy and Testing

Step 1: Click the 'Fork' button on the top right on your screen. That will create a copy of the repo under your Github username.

Step 2: In your command line/ terminal run

```bash
$ git clone GIT CLONE URL 
```
GIT CLONE URL = https://github.com/INSERT YOUR USERNAME/Twitter.git or you can copy the "HTTP CLONE url"

Step 3: Run the following commands 
to install the necessary gems 
```bash
$ bundle install 
```
to migrate the database (This repository use Rails 4.1.1 if you are using older version migrate the test environment): 
```bash
$ rake db:migrate
```

to execute the lib task sample data
```bash
$ rake db:seed 
```
Note:Seed will create an Admin user for the admin tools demo.

to run project in a  locally
```bash
$ rails s 
```
 
###Testing 

The application uses <a href="http://guides.rubyonrails.org/testing.html" traget="_blank">Rails test suite</a> for automated testing. All the tests are located in the test directory. 

To run all the existing tests;
```bash
$ rake test test/
```
To run products controller tests
```bash
$ rake test test/controllers/products_controller_test.rb
```

