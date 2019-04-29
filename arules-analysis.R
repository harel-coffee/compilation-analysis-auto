library(readr)
library(arules)
library(dplyr)

df <- read_csv('/Users/macher1/Documents/SANDBOX/tuxml-datasets/config_bdd30000-40000.csv')
# df <- read_csv('/Users/macher1/Documents/SANDBOX/tuxml-datasets/config_bdd40000-60000.csv')
#df <- read_csv('/Users/macher1/Documents/SANDBOX/tuxml-datasets/config_bdd60000-90000.csv')
df <- Filter(function(x)(length(unique(x))>1), df)
df['compilation_failure'] <- df['vmlinux'] == -1
#df2 <- Filter(function(x)(Negate(is.numeric(x))), df1)

df <- df %>% dplyr::select_if(Negate(is.numeric))
df['date'] <- NULL

rules <- apriori (data=df, parameter=list (supp=0.00001, conf = 1.0, maxlen=4)) #, appearance = list (default="lhs", rhs="compilation_failure"), control = list (verbose=F))
# rules_conf <- sort (rules, by="support", decreasing=TRUE)

rules_failure <- subset(rules, subset = rhs %in% "compilation_failure")
