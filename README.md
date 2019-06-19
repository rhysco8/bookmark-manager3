Bookmark Manager
-------------

Introduction
--------------
This is week 4 of Maker's and an introduction to *databases* and their integration to a web app.  
The goal of this app is to be a bookmark manager.

User Stories
----
```
As a user
So that I can see a list of my favorite webpages
I want to be able to see a list of my bookmarks

As a user
So that I can save new pages
I want to be able add to my list of bookmarks

```

![domain model picture coming soon]( )


## Set up

### Using the Database

1. Connect to psql (`psql` in the command line)
2. Create the database using
```
# CREATE DATABASE bookmark_manager;
```
3. Connect to the database using
```
# \c bookmark_manager
```
4. Run the SQL scripts in `db/migrations` folder in the given order
