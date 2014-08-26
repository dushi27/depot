##E-commerce Web App

Depot is a business to consumer e-commerce Ruby on Rails application built based on Agile Web Development (4th edition). Currently the application is live on <a href="http://bookz.herokuapp.com/">bookz.herokuapp.com</a> using Heroku cloud server. Please feel free to explor the consumer interface and the admin interface of the application (admin username: john and password: john2014). The application also utiliese Mendrill email API, Google Analytics for Analytics. 

The following documentation describes how to;

1. How to use the Products API

2. Create a locat copy of the application


##Using the Products API

The products is a a RESFTful JSON API that allow admin users to access a list of products currently in the catalog. To access products API;

Step 1: Go to <a href="http://bookz.herokuapp.com/api/v1/products.json">bookz.herokuapp.com/api/v1/products.json</a>

Step 2: If you are not already longged in as an admin user, it will promt a login. Please ender the username "john" and password "john2014" OR if you have created a new Admin user, enter the appropriate cridentials. Note that only an Admin user can create another admin user. 

Step 3: It'll render a list of products currently saved on the catalog

Step 4: To access a single product, add the product id to the URL. Example, <a href="http://bookz.herokuapp.com/api/v1/products/1.json">bookz.herokuapp.com/api/v1/products/1.json</a>. Above will render the first product in the catalog. 

##Curl Examples

1. To get a procuts catalog

```bash
curl -u john:john2014 http://bookz.herokuapp.com/api/v1/products.json
```

2. Get each product by product ID

```bash
curl -u john:john2014 http://bookz.herokuapp.com/api/v1/products/1.json
```

##Create a Local Copy of the Repo

Step 1: Click the 'Fork' button on the top right on your screen. That will create a copy of the repo under your Github username.

Step 2: In your commandline/ terminal run

```bash
$ git clone GIT CLONE URL 
```
GIT CLONE URL = https://github.com/INSERT YOUR USERNAME/Twitter.git or you can copy the "HTTP CLONE url"

Step 3: Run the following commands 
to install the necessary gems 
```bash
$ bundle install 
```
to migrate the database (This reporitory use Rails 4.1.1 if you are using older version migrate the test environment): 
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
 
