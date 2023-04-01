install.packages("sofa")
library(sofa)
install.packages("")
library(R4CouchDB)
library(couchDB)
install.packages("devtools")
devtools::install_github("ropensci/sofa")
library(sofa)
z<-Cushion$new(host="localhost",user="admin",pwd="admin")
#  host="stuff.cloudant.com",
#  transport="https",
# port=NULL,
#  user='foobar',
# pwd='things')
x<-Cushion$new()
z$ping()
db_list(z)
db_create(z,dbname="criminalsdb")
db_alldocs(z, dbname="criminalsdb")
doc1 <-'{"name":"criminals","crime":"theft"}'
doc_create(z,doc1,dbname = "criminalsdb",docid = "weapons")
doc2 <-'{"class":"regular","gang":"yes"}'
doc_create(z,doc2,dbname = "criminalsdb")
db_alldocs(z, dbname="criminalsdb")
doc_delete(z, dbname="criminalsdb", docid="weapons")
db_alldocs(z, dbname = "criminalsdb")
db_delete(z,dbname="student")
doc3<-'{"jailed":"yes"}'
doc_create(z,doc1,dbname = "criminalsdb",docid = "weapons")
doc_get(z, dbname = "criminalsdb", docid = "weapons")
revs <- db_revisions(z, dbname = "criminalsdb", docid = "weapons")
doc_update(z,dbname="criminalsdb",doc=doc3,docid="weapons",rev=revs[1])
db_revisions(z, dbname = "criminalsdb", docid = "weapons")
