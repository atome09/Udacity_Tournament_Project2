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
* Start Vagrant - Open terminal or cmd cd into /vagrant
* Type `vagrant up`
* `vagrant ssh`
* `cd /vagrant/tournament`
* type `psql`
* Use the command `\i tournament.sql` to create and connect to the database **tournament**
* type `\q` to quit out of PSQL 
* Run the tests: type `python tournament_test.py`

###Test Results
```
1. Old matches can be deleted.
2. Player records can be deleted.
3. After deleting, countPlayers() returns zero.
4. After registering a player, countPlayers() returns 1.
5. Players can be registered and deleted.
6. Newly registered players appear in the standings with no matches.
7. After a match, players have updated standings.
8. After one match, players with one win are paired.
Success!  All tests pass!
```
