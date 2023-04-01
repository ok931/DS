# installs development version of 'mongolite'
# devtools::install_github("jeroen/mongolite")
install.packages("mongolite")
# Init connection to local mongod
library(mongolite)
m <- mongo(collection = "diamonds")
# Insert test data
data(diamonds, package="ggplot2")
m$insert(diamonds)
# Check records
m$count()
nrow(diamonds)
# Perform a query and retrieve data
out <- m$find('{"cut" : "Premium", "price" : { "$lt" : 1000 } }')
# Compare
nrow(out)
nrow(subset(diamonds, cut == "Premium" & price < 1000))
# Cross-table
tbl <- m$mapreduce(
  map = "function(){emit({cut:this.cut, color:this.color}, 1)}",
  reduce = "function(id, counts){return Array.sum(counts)}")
# Same as:
data.frame(with(diamonds, table(cut, color)))
# Stream jsonlines into a connection
tmp <- tempfile()
m$export(file(tmp))

# Stream it back in R
library(jsonlite)
mydata <- stream_in(file(tmp))
# Or into mongo
m2 <- mongo("diamonds2")
m2$count()
m2$import(file(tmp))
m2$count()
# Remove the collection
m$drop()
m2$drop()
