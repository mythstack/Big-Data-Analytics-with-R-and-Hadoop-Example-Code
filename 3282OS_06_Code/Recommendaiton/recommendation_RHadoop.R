# Load rmr2 package
library (rmr2)

# Input Data File
train <-read.csv (file = "small.csv", header = FALSE)
names (train) <-c ("user", "item", "pref")

# Use the hadoop rmr format, hadoop is the default setting.
rmr.options (backend = 'hadoop')

# The data set into HDFS
train.hdfs = to.dfs (keyval (train$user, train))

# see the data from hdfs
from.dfs (train.hdfs)


train.mr <-mapreduce (
  train.hdfs, 
  map = function (k, v) {
    keyval (k, v$item)
  }
  , Reduce = function (k, v) {
    m <-merge (v, v)
    keyval (m$x, m$y)
  }
)


step2.mr <-mapreduce (
  train.mr,
  map = function (k, v) {
    d <-data.frame (k, v)
    d2 <-ddply (d,. (k, v), count)

    key <- d2$k
    val <- d2
    keyval(key, val)
  }
)
from.dfs(step2.mr)


train2.mr <-mapreduce (
  train.hdfs, 
  map = function(k, v) {
    # Df <- v[which (v$user == 3),]
    df <- v
    key <-df $ item
    val <-data.frame (item = df$item, user = df$user, pref = df$pref)
    keyval(key, val)
  }
)
from.dfs(train2.mr)


eq.hdfs <-equijoin (
  left.input = step2.mr, 
  right.input = train2.mr,
  map.left = function (k, v) {
    keyval (k, v)
  },
  map.right = function (k, v) {
    keyval (k, v)
  },
  outer = c ("left")
)
from.dfs (eq.hdfs)


cal.mr <-mapreduce (
  input = eq.hdfs,
  map = function (k, v) {
    val <-v
    na <-is.na (v$user.r)
    if (length (which(na))> 0) val <-v [-which (is.na (v $ user.r)),]
    keyval (val$kl, val)
  }
  , Reduce = function (k, v) {
    val <-ddply (v,. (kl, vl, user.r), summarize, v = freq.l * pref.r)
    keyval (val $ kl, val)
  }
)
from.dfs (cal.mr)


result.mr <-mapreduce (
  input = cal.mr,
  map = function (k, v) {
    keyval (v $ user.r, v)
  }
  , Reduce = function (k, v) {
    val <-ddply (v,. (user.r, vl), summarize, v = sum (v))
    val2 <-val [order (val$v, decreasing = TRUE),]
    names (val2) <-c ("user", "item", "pref")
    keyval (val2$user, val2)
  }
)
from.dfs (result.mr)
