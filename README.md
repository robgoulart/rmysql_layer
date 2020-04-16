# R data access layer to MySQL for multi proposal using

Libraries required:
- RMySQL
- stringr
- rjson

Methods:

- connect. Return a RMySql connection object. The connections must be in a JSON file in this format:
	{
	"connection1":
		{
		"user" : "user1",
		"password" : "passwd1",
		"host": "host1",
		"database" : "db1"
		},
 	"connection2":
 		{
 		"user" : "user2",
		"password" : "passwd2",
		"host" : "host2",
		"database" : "db2"
		}
	}

- insert. Insert data in a table. Receive 2 or 3 arguments. Specify arguments is mandatory. Values with ' are replaced with @.
	1) table where data will be inserted: character
	2) fields in table (optional, SQL accept INSERT query with valores, without fields and MYSQL takes care of insert in the query order)
	3) values inserted in table 

- select. Select data