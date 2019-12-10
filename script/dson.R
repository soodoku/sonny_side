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

#Maine
me_daughter <- read.csv("me/me-daughter.csv", stringsAsFactors = FALSE)
me_daughter$Entity[sapply(lapply(str_extract_all(tolower(me_daughter$Entity), "\\w+"), function(x) str_detect(x, "^daughters$|^daughter$")), sum) > 0]
me_son <- read.csv("me/me-son.csv", stringsAsFactors = FALSE)
me_son_dedup <- me_son[!duplicated(me_son$Entity), ]
me_son_dedup$Entity[sapply(lapply(str_extract_all(tolower(me_son_dedup$Entity), "\\w+"), function(x) str_detect(x, "^sons$|^son$")), sum) > 0]

#Maryland
md_daughter <- read.csv("md/md_daughter.csv", stringsAsFactors = FALSE)
md_daughter$BusinessName[sapply(lapply(str_extract_all(tolower(md_daughter$BusinessName), "\\w+"), function(x) str_detect(x, "^daughters$|^daughter$")), sum) > 0]
md_son <- read.csv("md/md_son.csv", stringsAsFactors = FALSE)
md_son_dedup <- md_son[!duplicated(md_son$BusinessName), ]
md_son_dedup$BusinessName[sapply(lapply(str_extract_all(tolower(md_son_dedup$BusinessName), "\\w+"), function(x) str_detect(x, "^sons$|^son$")), sum) > 0]

#Massachusets
ma_daughter <- read.csv("ma/ma_daughter.csv", stringsAsFactors = FALSE) 
ma_daughter <- ma_daughter[ma_daughter$Entity.Name != "", ] #brought empty lines so need to remove
ma_daughter_dedup <- ma_daughter[!duplicated(ma_daughter$Entity.Name), ]
ma_daughter_dedup$Entity.Name[sapply(lapply(str_extract_all(tolower(ma_daughter_dedup$Entity.Name), "\\w+"), function(x) str_detect(x, "^daughters$|^daughter$")), sum) > 0]
ma_son <- read.csv("ma/ma_son.csv", stringsAsFactors = FALSE) 
ma_son <- ma_son[ma_son$Entity.Name != "", ] #brought empty lines so need to remove
ma_son_dedup <- ma_son[!duplicated(ma_son$Entity.Name), ]
ma_son_dedup$Entity.Name[sapply(lapply(str_extract_all(tolower(ma_son_dedup$Entity.Name), "\\w+"), function(x) str_detect(x, "^sons$|^son$")), sum) > 0]

#Minnesota
mn_daughter <- read.csv("mn/mn_daughter.csv", stringsAsFactors = FALSE) 
mn_daughter_dedup <- mn_daughter[!duplicated(mn_daughter$Business.Name), ]
mn_daughter_dedup[sapply(lapply(str_extract_all(tolower(mn_daughter_dedup), "\\w+"), function(x) str_detect(x, "^daughters$|^daughter$")), sum) > 0]
mn_son <- read.csv("mn/mn_son.csv", stringsAsFactors = FALSE) 
mn_son_dedup <- mn_son[!duplicated(mn_son$Business.Name), ]
mn_son_dedup[sapply(lapply(str_extract_all(tolower(mn_son_dedup), "\\w+"), function(x) str_detect(x, "^sons$|^son$")), sum) > 0]
222/212

## Montana
mt_son <- read_csv("mt/export-11_10_19_5_52_PM_son.csv")

mt_son[[1]][5:3754]

a <- grepl(".*son(\\s+).*", mt_son[[1]][5:3754])
mt_son[[1]][5:3754][a]
# [1] "Riley & sons construction" "Venegas & sons drywall"   

mt_son[[1]][5:3754][sapply(lapply(str_extract_all(tolower(mt_son[[1]][5:3754]), "\\w+"), function(x) str_detect(x, "^son$|^sons$")), sum) > 0]
mt_son[[1]][5:3754][sapply(lapply(str_extract_all(tolower(mt_son[[1]][5:3754]), "\\w+"), function(x) str_detect(x, "^daughter$|^daughters$")), sum) > 0]

#Nebraska
ne_daughter <- read.csv("ne/ne_daughter.csv", stringsAsFactors = FALSE) 
ne_daughter$Name[sapply(lapply(str_extract_all(tolower(ne_daughter$Name), "\\w+"), function(x) str_detect(x, "^daughters$|^daughter$")), sum) == 0]
#[1] "DADANDDAUGHTERBUYHOUSES.COM"
#so all are actually
41



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
