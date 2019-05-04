library(readr)
library(arules)
library(dplyr)

df <- read_csv('/Users/macher1/Documents/SANDBOX/compilation-analysis/dataset_after_encoding.csv',
               col_types = list(
                 OPENVSWITCH = col_factor(c("0", "1", "2"))
               ))
# df <- read_csv('/Users/macher1/Documents/SANDBOX/tuxml-datasets/config_bdd40000-60000.csv')
#df <- read_csv('/Users/macher1/Documents/SANDBOX/tuxml-datasets/config_bdd60000-90000.csv')
df <- Filter(function(x)(length(unique(x))>1), df)
# df['compilation_failure'] <- df['vmlinux'] == -1
#df2 <- Filter(function(x)(Negate(is.numeric(x))), df1)

# df <- df %>% dplyr::select_if(Negate(is.numeric))
# df['date'] <- NULL

rules <- apriori (data=df, parameter=list (supp=0.0000000001, conf = 1.0)) #, appearance = list (default="lhs", rhs="compilation_failure"), control = list (verbose=F))
# rules_conf <- sort (rules, by="support", decreasing=TRUE)

rules_failure <- subset(rules, subset = rhs %in% "compile_success")

tristate <- c(0, 1, 2)
parse_factor(df, levels = tristate)