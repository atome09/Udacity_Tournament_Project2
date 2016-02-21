# Udacity_Tournament_Project2
Tournament Project 2 - Udacity FullStack Nanodegree

###Description
This Project has a Python module that uses a PostgresSQL to keep track of players and matches in a game tournament. The game tournament uses the Swiss system for pairing up players in each round.

###Files
* tournament.sql -- Database Schema
* tournament.py -- Contains the functions to access the database and perform SQL statements (INSERT, DELETE, SELECT)
* tournament_test.py -- Contains unit tests for the founction in the tournament.py file

###How to Run
You need the Vagrant virtual machine provided for Udacity: [fullstack-nanodegree-vm](https://github.com/udacity/fullstack-nanodegree-vm)
1. Start Vagrant
  1. Open Terminal or cmd and browse to the vagrant folder
  2. Type `vagrant up`
2. SSH in to the vagrant VM
  1. In the same terminal type `vagrant ssh`
3. Change to the correct folder
  1. Type `cd /vagrant/tournament`
4. Open PSQL and run the tournament.sql 
  1. type `psql`
  2. copy the contents of tournament.sql and paste in to the terminal window
  3. type `\q` to quit out of PSQL 
5. Run the tests
  1. In the terminal type `python tournament_test.py`
