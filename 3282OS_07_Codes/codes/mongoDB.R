
================================================================================
Book - Big Data Analytics with R and Hadoop
Book URL - https://www.packtpub.com/big-data-analytics-with-r-and-hadoop/book
Chapter - 7 mporting and Exporting Data from Various DBs   
Author - Vignesh Prajapati
Contact - a. email -> vignesh2066@gmail.com
          b. LinkedIn -> http://www.linkedin.com/in/vigneshprajapati   	  
================================================================================
################################################################################
# MongoDB
# sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
#
# echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
#
# sudo apt-get update
# apt-get install mongodb-10gen
################################################################################

# installing library rmongodb in R
install.packages (rmongodb)

# loading the library of rmongodb
library (rmongodb)


# Mongo connection establishment
mongo <-mongo.create ()

# Check whether the normal series
mongo.is.connected (mongo)

# Create a BSON object cache
buf <- mongo.bson.buffer.create ()

# Add element to the object buf
mongo.bson.buffer.append (buf, "name", "Echo")
b <- mongo.bson.from.list(list(name="Fred", age=29, city="Boston"))
iter <- mongo.bson.iterator.create(b)  # b is of class "mongo.bson"
while (mongo.bson.iterator.next(iter))
    print(mongo.bson.iterator.value(iter))

	if (mongo.is.connected(mongo)) {
    ns <- "test.people"

	# add bson objects to mongo
    buf <- mongo.bson.buffer.create()
    mongo.bson.buffer.append(buf, "name", "Joe")
    criteria <- mongo.bson.from.buffer(buf)

    buf <- mongo.bson.buffer.create()
    mongo.bson.buffer.start.object(buf, "$inc")
    mongo.bson.buffer.append(buf, "age", 1L)
    mongo.bson.buffer.finish.object(buf)
    objNew <- mongo.bson.from.buffer(buf)

    # increment the age field of the first record matching name "Joe"
    mongo.update(mongo, ns, criteria, objNew)

    buf <- mongo.bson.buffer.create()
    mongo.bson.buffer.append(buf, "name", "Jeff")
    criteria <- mongo.bson.from.buffer(buf)

    buf <- mongo.bson.buffer.create()
    mongo.bson.buffer.append(buf, "name", "Jeff")
    mongo.bson.buffer.append(buf, "age", 27L)
    objNew <- mongo.bson.from.buffer(buf)

    # update the entire record to { name: "Jeff", age: 27 }
    # where name equals "Jeff"
    # if such a record exists; otherwise, insert this as a new reord
    mongo.update(mongo, ns, criteria, objNew,
        mongo.update.upsert)

    # do a shorthand update:
    mongo.update(mongo, ns, list(name="John"), list(name="John", age=25))
}