# R data access layer to MySQL using multi proposal

Libraries required:
- RMySQL
- stringr
- rjson

Methods:

- connect. Return a RMySql connection object. The connections must be in a JSON file in this format:
	&lt;p&gt;{
 		&lt;p&gt;"connection1":
			&lt;p&gt;{
				&lt;p&gt;"user" : "user1",
				&lt;p&gt;"password" : "passwd1",
				"&lt;p&gt;host": "host1",
				&lt;p&gt;"database" : "db1"
			&lt;p&gt;},
 		&lt;p&gt;"connection2":
 			&lt;p&gt;{
 				&lt;p&gt;"user" : "user2",
				&lt;p&gt;"password" : "passwd2",
				&lt;p&gt;"host" : "host2",
				&lt;p&gt;"database" : "db2"
			&lt;p&gt;}
	&lt;p&gt;}

- insert. Insert data in a table. Receive 2 or 3 arguments. Specify arguments is mandatory. Values with ' are replaced with @.
	&lt;1) table where data will be inserted: character
	&lt;2) fields in table (optional, SQL accept INSERT query with valores, without fields and MYSQL takes care of insert in the query order)
	&lt;3) values inserted in table 

- select. Select data