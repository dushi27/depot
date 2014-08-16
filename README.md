##E-commerce Web App

Depot is a business to consumer e-commerce application built based on Agile Web Development (4th edition). The application is live on <a href="http://dp-pragmatic.herokuapp.com/">dp-pragmatic.herokuapp.com</a>. Please clone the repository</a> to see the admin view of the application. 

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
 
