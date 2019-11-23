# setwd
setwd(githubdir)
setwd("sons_and_daughters/data/")

# Load libs
library(readr)
library(stringr)

## AL

al_son <-  or_son <- read_csv("al/al_sons.csv")
al_son$`Entity Name`[sapply(lapply(str_extract_all(tolower(al_son$`Entity Name`), "\\w+"), function(x) str_detect(x, "^son$|^sons$")), sum) > 0]


## Montana
mt_son <- read_csv("mt/export-11_10_19_5_52_PM_son.csv")

mt_son[[1]][5:3754]

a <- grepl(".*son(\\s+).*", mt_son[[1]][5:3754])
mt_son[[1]][5:3754][a]
# [1] "Riley & sons construction" "Venegas & sons drywall"   

mt_son[[1]][5:3754][sapply(lapply(str_extract_all(tolower(mt_son[[1]][5:3754]), "\\w+"), function(x) str_detect(x, "^son$|^sons$")), sum) > 0]

## Ohio

oh_son <- read_csv("oh/Ohio Secretary of State Business Search-Business Name-son.csv")
oh_son$Name[sapply(lapply(str_extract_all(tolower(oh_son$Name), "\\w+"), function(x) str_detect(x, "^son$|^sons$")), sum) > 0]

## Oregon
or_son <-  or_son <- read_csv("or/son.csv")
or_son$Name[sapply(lapply(str_extract_all(tolower(or_son$Name), "\\w+"), function(x) str_detect(x, "^son$|^sons$")), sum) > 0]

## WA

wa_son <-  or_son <- read_csv("wa/Business Search Result son.csv")
wa_son$`Business Name`[sapply(lapply(str_extract_all(tolower(wa_son$`Business Name`), "\\w+"), function(x) str_detect(x, "^son$|^sons$")), sum) > 0]

