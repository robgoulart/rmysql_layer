library("RMySQL")
library("stringr")

conecta=function(){
  con=dbConnect(MySQL(),
                user='u303739996_localidade',
                password='canetaazul',
                host='92.249.44.1',
                dbname='u303739996_localidade')
  return(con)
}

# função que executa uma query INSERT. Pode passar 2 ou 3 argumentos. O argumento 'campos' é opcional, pois
# a sintaxe SQL aceita uma query INSERT apenas com valores e o MYSQL se encarrega de inserir na ordem que está na query

# ATENÇÃO: é obrigatório especificar os nomes dos argumento na chamada da função pois existe um argumento opcional (campos)

# 1) a tabela onde serão inseridos os dados: formato character (string)
# 2) campos na tabela
# 3) valores que serão inseridos na tabela, são referentes aos campos

insere_registro=function(conexao, tabela, campos=c(), valores, print=FALSE){
  valores_t=c()
  for (v in valores){
    valores_t=paste(valores_t, paste("'",str_replace(v,"'" ,"@"), "',", sep=""), sep="")
  }
  valores_t=substr(valores_t, 1, nchar(valores_t)-1)
  if (length(campos)>0){
    campos_t=c()
    for (c in campos){
      campos_t=paste(campos_t, paste("",c, ",", sep=""), sep="")
    }
    campos_t=substr(campos_t, 1, nchar(campos_t)-1)
    query=paste("INSERT INTO ", tabela, " (", campos_t, ")", " VALUES (", valores_t, ");", sep="")
  } else {
    query=paste("INSERT INTO ", tabela, " VALUES (", valores_t, ");", sep="")
  }
  if (print==TRUE){
    print(query)
  }
  res=dbGetQuery(conexao, query)
  return(res)
}

seleciona=function(conexao, query){
  res=dbGetQuery(conexao, query)
  return(res)
}

fecha_conexao=function(con){
  dbDisconnect(con)
}