# setwd
#setwd(githubdir)
#setwd("sons_and_daughters/data/")
setwd("C:\\Users\\wguil\\OneDrive\\Documents\\GitHub\\sonny_side\\data")

# Load libs
library(readr)
library(stringr)

## AL
al_son <-  read_csv("al/al_sons.csv")
al_son$`Entity Name`[sapply(lapply(str_extract_all(tolower(al_son$`Entity Name`), "\\w+"), function(x) str_detect(x, "^son$|^sons$")), sum) > 0]
al_son$`Entity Name`[sapply(lapply(str_extract_all(tolower(al_son$`Entity Name`), "\\w+"), function(x) str_detect(x, "^daughters$|^daughter$")), sum) > 0]

## CA
ca_son <-  read_csv("ca/son_corp.csv")
ca_son$`Entity Name`[sapply(lapply(str_extract_all(tolower(ca_son$`Entity Name`), "\\w+"), function(x) str_detect(x, "^son$|^sons$")), sum) > 0]
ca_son$`Entity Name`[sapply(lapply(str_extract_all(tolower(ca_son$`Entity Name`), "\\w+"), function(x) str_detect(x, "^daughters$|^daughter$")), sum) > 0]

## HI
hi_son <-  read_csv("hi/hi_sons.csv")
hi_son$Name[sapply(lapply(str_extract_all(tolower(hi_son$Name), "\\w+"), function(x) str_detect(x, "^son$|^sons$")), sum) > 0]
hi_son$Name[sapply(lapply(str_extract_all(tolower(hi_son$Name), "\\w+"), function(x) str_detect(x, "^daughters$|^daughter$")), sum) > 0]

#Kansas
ks_daughter <- read.csv("ks/ks-daughter.csv", stringsAsFactors = FALSE)
ks_daughter$Name[sapply(lapply(str_extract_all(tolower(ks_daughter$Name), "\\w+"), function(x) str_detect(x, "^daughters$|^daughter$")), sum) > 0]
ks_son <- read.csv("ks/ks-son.csv", stringsAsFactors = FALSE)
ks_son$Name[sapply(lapply(str_extract_all(tolower(ks_son$Name), "\\w+"), function(x) str_detect(x, "^son$|^sons$")), sum) > 0]
75/14

#Kentucky
ky_daughter <- read.csv("ky/ky-daughter.csv", stringsAsFactors = FALSE)
ky_daughter$CompanyName[sapply(lapply(str_extract_all(tolower(ky_daughter$CompanyName), "\\w+"), function(x) str_detect(x, "^daughters$|^daughter$")), sum) > 0]
ky_son <- read.csv("ky/ky-son.csv", stringsAsFactors = FALSE)
ky_son_dedup <- ky_son[!duplicated(ky_son$CompanyName), ]
ky_son_dedup$CompanyName[sapply(lapply(str_extract_all(tolower(ky_son_dedup$CompanyName), "\\w+"), function(x) str_detect(x, "^sons$|^son$")), sum) > 0]

## Montana
mt_son <- read_csv("mt/export-11_10_19_5_52_PM_son.csv")

mt_son[[1]][5:3754]

a <- grepl(".*son(\\s+).*", mt_son[[1]][5:3754])
mt_son[[1]][5:3754][a]
# [1] "Riley & sons construction" "Venegas & sons drywall"   

mt_son[[1]][5:3754][sapply(lapply(str_extract_all(tolower(mt_son[[1]][5:3754]), "\\w+"), function(x) str_detect(x, "^son$|^sons$")), sum) > 0]
mt_son[[1]][5:3754][sapply(lapply(str_extract_all(tolower(mt_son[[1]][5:3754]), "\\w+"), function(x) str_detect(x, "^daughter$|^daughters$")), sum) > 0]

## Ohio
oh_son <- read_csv("oh/Ohio Secretary of State Business Search-Business Name-son.csv")
oh_son$Name[sapply(lapply(str_extract_all(tolower(oh_son$Name), "\\w+"), function(x) str_detect(x, "^son$|^sons$")), sum) > 0]
oh_son$Name[sapply(lapply(str_extract_all(tolower(oh_son$Name), "\\w+"), function(x) str_detect(x, "^daughters$|^daughter$")), sum) > 0]

## Oregon
or_son <- read_csv("or/son.csv")
or_son$Name[sapply(lapply(str_extract_all(tolower(or_son$Name), "\\w+"), function(x) str_detect(x, "^son$|^sons$")), sum) > 0]
or_son$Name[sapply(lapply(str_extract_all(tolower(or_son$Name), "\\w+"), function(x) str_detect(x, "^daughters$|^daughter$")), sum) > 0]

## WA
wa_son <-  read_csv("wa/Business Search Result son.csv")
wa_son$`Business Name`[sapply(lapply(str_extract_all(tolower(wa_son$`Business Name`), "\\w+"), function(x) str_detect(x, "^son$|^sons$")), sum) > 0]
wa_son$`Business Name`[sapply(lapply(str_extract_all(tolower(wa_son$`Business Name`), "\\w+"), function(x) str_detect(x, "^daughters$|^daughter$")), sum) > 0]
