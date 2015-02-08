# Loading Hadoop Sreaming library
Library('HadoopStreaming')
# Input data String with collection of key and values
str <- " key1\t1.91\nkey1\t2.1\nkey1\t20.2\nkey1\t3.2\nkey2\t1.2\nkey2\t10\nkey3\t2.5\nkey3\t2.1\nkey4\t1.2\n"
# To print string on the stream or console
cat(str)



################################################################################



# A list of column names, as’what’ arg to scan
cols = list(key='',val=0)

# To make a text connection
con <- textConnection(str, open = "r")

# To read the data  with chunksize 3
hsTableReader(con,cols,chunkSize=3,FUN=print,ignoreKey=TRUE)


################################################################################

# Funciton for reading chunkwise dataset
printkeyval <- function(k,v) {
cat('A chunk:\n')
cat(paste(k,v,sep=': '),sep='\n')
}

str <- "key1\tval1\nkey2\tval2\nkey3\tval3\n"

con <- textConnection(str, open = "r")

hsKeyValReader(con, chunkSize=1, FUN=printFn)

################################################################################

# Input string dataset
str <- " This is HadoopStreaming!!\n here are,\n exampels for chunk dataset!!\n in R\n  ?"


#  For defining the string as data source
con <- textConnection(str, open = "r")

# read from the con object
hsLineReader(con,chunkSize=2,FUN=print)


