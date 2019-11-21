# setwd
setwd(githubdir)
setwd("sons_and_daughters/data/mt/")

# Load libs
library(readr)
library(stringr)

# read data
mt_son <- read_csv("export-11_10_19_5_52_PM_son.csv")
mt_son[[1]][5:3754]
a <- grepl(".*son(\\s+).*", mt_son[[1]][5:3754])
mt_son[[1]][5:3754][a]
# [1] "Riley & sons construction" "Venegas & sons drywall"   

mt_son[[1]][5:3754][sapply(lapply(str_extract_all(tolower(mt_son[[1]][5:3754]), "\\w+"), function(x) str_detect(x, "^son(s)$")), sum) > 0]
