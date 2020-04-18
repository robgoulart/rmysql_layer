library("RMySQL")
library("stringr")
library("rjson")

connect=function(name, connections_file){
  dados_conn=fromJSON(file=connections_file)
  dados_conn=unlist(dados_conn[name])
  con=dbConnect(MySQL(),
                user=dados_conn[1],
                password=dados_conn[2],
                host=dados_conn[3],
                dbname=dados_conn[4])
  return(con)
}

insert=function(connection, table, fields=c(), values, print=FALSE){
  values_t=c()
  for (v in values){
    values_t=paste0(values_t, paste0("'",str_replace(v,"'" ,"@"), "',"))
  }
  values_t=substr(values_t, 1, nchar(values_t)-1)
  if (length(fields)>0){
    fields_t=c()
    for (c in fields){
      fields_t=paste0(fields_t, paste0("",c, ","))
    }
    fields_t=substr(fields_t, 1, nchar(fields_t)-1)
    query=paste0("INSERT INTO ", table, " (", fields_t, ")", " VALUES (", values_t, ");")
  } else {
    query=paste0("INSERT INTO ", table, " VALUES (", values_t, ");")
  }
  if (print==TRUE){
    print(query)
  }
  res=dbGetQuery(connection, query)
  return(res)
}

select=function(connection, query){
  res=dbGetQuery(connection, query)
  return(res)
}

close=function(connection){
  dbDisconnect(connection)
}