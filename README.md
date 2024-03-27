# README

ruby - 3.2.3
rails - 7.1.3

Follow below steps to start/run assignments:
1. Clone repository from git clone https://github.com/parthavi1522/AssociationExample.git

2. cd AssociationExample

3. bundle install

4. Add databse password in credential file using:
   EDITOR=nano rails credentials:edit

   and set password using below format in file:
   development:
     database_password: your_password

5. This step will create, migrate & seed the database
   rails db:create 
   rails db:migrate
   rails db:seed

6. To start the server use:
   rails server