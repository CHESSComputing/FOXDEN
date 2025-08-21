# FOXDEN clean-up
During development activities we often need to clean-up FOXDEN databases and
start from scratch. This document outlines all required steps to do that:
1. Lookup your data files in your foxden.yaml configuration file
2. You need
   - user credentials for MongoDB used by MetaData service
   - user credentials for relational database used by DataBookkeeping service
     - in case of development we use SQLite database
     - in case of production deployment we use MySQL database
3. login to MongoDB database and use the following set of commands:
```
# login to MongoDB (change you login and port accordingly)
mongosh mongodb://foxden-dev@testmongo:27017

# within mongo shell navigate to your database, e.g.
mongosh> use foxdendev
# check how many records you have in meta collection
mongosh> db.meta.count()
# wipe out all records in meta collection, replace {} with some spec
# if you need to wipe out specific records
mongosh> db.meta.deleteMany({})
```
4. login to relational database to clean-up provenance record. In case of
   SQLite you can simply delete the database and repopulate it with schema,
   e.g.
```
# here we use
rm /path/dbs.db
# create again dbs.db using your schema file
sqlite3 /path/dbs.db < DataBookkeeping/static/schema/sqlite.sql
```
5. At this moment you'll have zero records in MongoDB and SQLite and you can
   simply start your services again via manage script, e.g.
```
/path/manage stop
/path/manage start
```
