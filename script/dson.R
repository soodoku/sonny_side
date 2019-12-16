# setwd
#setwd(githubdir)
#setwd("sons_and_daughters/data/")
setwd("C:\\Users\\wguil\\OneDrive\\Documents\\GitHub\\sonny_side\\data")

# Load libs
library(readr)
library(stringr)
library(rvest)

# Alaska AK
base_url <- "https://www.commerce.alaska.gov/cbp/main/Search/EntitiesResults?EntityName=son&IsStartsWithSearch=False&CurrentOnly=False&&pageNumber=1"
webpage <- read_html(base_url)
entities <- html_nodes(webpage, "td:nth-child(3)")
(entities <- as.character(html_text(entities)))
#Not working but why? 

## AL
al_son <-  read_csv("al/al_sons.csv")
al_son$`Entity Name`[sapply(lapply(str_extract_all(tolower(al_son$`Entity Name`), "\\w+"), function(x) str_detect(x, "^son$|^sons$")), sum) > 0]
al_son$`Entity Name`[sapply(lapply(str_extract_all(tolower(al_son$`Entity Name`), "\\w+"), function(x) str_detect(x, "^daughters$|^daughter$")), sum) > 0]

## CA
ca_son <-  read_csv("ca/son_corp.csv")
ca_son$`Entity Name`[sapply(lapply(str_extract_all(tolower(ca_son$`Entity Name`), "\\w+"), function(x) str_detect(x, "^son$|^sons$")), sum) > 0]
ca_son$`Entity Name`[sapply(lapply(str_extract_all(tolower(ca_son$`Entity Name`), "\\w+"), function(x) str_detect(x, "^daughters$|^daughter$")), sum) > 0]

#Connecticut
ct_son <- read.csv("ct/ct_son.csv", stringsAsFactors = FALSE)
ct_son_dedup <- ct_son[!duplicated(ct_son$Business.Name), ]
ct_son_dedup$Business.Name[sapply(lapply(str_extract_all(tolower(ct_son_dedup$Business.Name), "\\w+"), function(x) str_detect(x, "^sons$|^son$")), sum) > 0]
ct_daughter <- read.csv("ct/ct-daughter.csv", stringsAsFactors = FALSE)
#ct_daughter_dedup <- ct_daughter[!duplicated(ct_daughter$Business.Name), ] #not needed since already dedeupd
ct_daughter$Business.Name[sapply(lapply(str_extract_all(tolower(ct_daughter$Business.Name), "\\w+"), function(x) str_detect(x, "^daughters$|^daughter$")), sum) > 0]
875/43

#Florida
url <- "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?inquiryType=EntityName&searchNameOrder=DAUGHTER&searchTerm=daughter"
webpage <- read_html(url)
entities <- html_nodes(webpage, ".large-width")
(entities <- as.character(html_text(entities)))
#Works but needs more work to get all URLs

#daugther links to parse
#http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?inquiryType=EntityName&searchNameOrder=DAUGHTER&searchTerm=daughter
#http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=DAUGHTERSAIRCONDITIONING%20P150000284920&SearchTerm=daughter&entityId=P15000028492&listNameOrder=DAUGHTERBEAR%20L180001340680
#http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=DAUGHTERSDESTINYINTERNATIONALM%20N100000072850&SearchTerm=daughter&entityId=N10000007285&listNameOrder=DAUGHTERSAMERICANREVOLUTION%20X005230
#http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=DAUGHTERSFAITHCLEANING%20P040001235880&SearchTerm=daughter&entityId=P04000123588&listNameOrder=DAUGHTERSDESTINYOUTREACHMINIST%20N060000012260
#http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=DAUGHTERSINTERLINE%20P930000863780&SearchTerm=daughter&entityId=P93000086378&listNameOrder=DAUGHTERSFAITHINTERNATIONAL%20N190000002520
#http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=DAUGHTERSLEGACY%20L040000468030&SearchTerm=daughter&entityId=L04000046803&listNameOrder=DAUGHTERSINVIRTUOUSATTITUDES%20N100000055470
#http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=DAUGHTERSPRESS%20L180002033410&SearchTerm=daughter&entityId=L18000203341&listNameOrder=DAUGHTERSLEGACY%20L170001931391
#http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=DAUGHTERSSONS%20L100000469040&SearchTerm=daughter&entityId=L10000046904&listNameOrder=DAUGHTERSPURPOSE%20N120000048760
#http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=DAUGHTERSZION%20N097590&SearchTerm=daughter&entityId=N09759&listNameOrder=DAUGHTERSSONS%20P190000486570


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

#Rhode Island
ri_daughter <- read.csv("ri/ri-daughter.csv", stringsAsFactors = FALSE) 
ri_daughter$Entity.Name[sapply(lapply(str_extract_all(tolower(ri_daughter$Entity.Name), "\\w+"), function(x) str_detect(x, "^daughters$|^daughter$")), sum) > 0]
ri_son <- read.csv("ri/ri_son.csv", stringsAsFactors = FALSE) 
ri_son_dedup <- ri_son[!duplicated(ri_son$Entity.Name), ]
ri_son_dedup$Entity.Name[sapply(lapply(str_extract_all(tolower(ri_son_dedup$Entity.Name), "\\w+"), function(x) str_detect(x, "^sons$|^son$")), sum) > 0]
206/12

#South Carolina
sc_daughter <- read.csv("sc/sc_daughter.csv", stringsAsFactors = FALSE) 
sc_daughter$Entity.Name[sapply(lapply(str_extract_all(tolower(sc_daughter$Entity.Name), "\\w+"), function(x) str_detect(x, "^daughters$|^daughter$")), sum) > 0]
59/60 #daugther
sc_son <- read.csv("sc/sc_son.csv", stringsAsFactors = FALSE) 
sc_son$Entity.Name[sapply(lapply(str_extract_all(tolower(sc_son$Entity.Name), "\\w+"), function(x) str_detect(x, "^sons$|^son$")), sum) > 0]
9/60 #son

#South Dakota
sd_daughter <- read.csv("sd/sd_daughter.csv", stringsAsFactors = FALSE) 
sd_daughter_dedup <- sd_daughter[!duplicated(sd_daughter$Name), ]
sd_daughter_dedup$Name[sapply(lapply(str_extract_all(tolower(sd_daughter_dedup$Name), "\\w+"), function(x) str_detect(x, "^daughters$|^daughter$")), sum) > 0]
sd_son <- read.csv("sd/sd_son.csv", stringsAsFactors = FALSE) 
sd_son_dedup <- sd_son[!duplicated(sd_son$Name), ]
sd_son_dedup$Name[sapply(lapply(str_extract_all(tolower(sd_son_dedup$Name), "\\w+"), function(x) str_detect(x, "^sons$|^son$")), sum) > 0]
129/11



## WA
wa_son <-  read_csv("wa/Business Search Result son.csv")
wa_son$`Business Name`[sapply(lapply(str_extract_all(tolower(wa_son$`Business Name`), "\\w+"), function(x) str_detect(x, "^son$|^sons$")), sum) > 0]
wa_son$`Business Name`[sapply(lapply(str_extract_all(tolower(wa_son$`Business Name`), "\\w+"), function(x) str_detect(x, "^daughters$|^daughter$")), sum) > 0]
