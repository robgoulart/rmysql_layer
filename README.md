# Data access layer to MySQL using R for multi proposal

Methods:
- connect. return an RMySql connection object
- insert. insert data. Receive 2 or 3 arguments. Fields is optional, SQL accept INSERT query with valores, without fields and MYSQL takes care of insert in the query order.
- select. select data