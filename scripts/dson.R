# setwd
#setwd(githubdir)
#setwd("sons_and_daughters/data/")
setwd("C:\\Users\\wguil\\OneDrive\\Documents\\GitHub\\sonny_side\\data")

# Load libs
library(readr)
library(stringr)
library(rvest)

# Alaska AK
# rvest didn't work so Gaurav did selenium pull
ak_son <- read.csv("./ak/ak-son.csv", stringsAsFactors = FALSE)
ak_son_dedup <- ak_son[!duplicated(ak_son$Entity.Name),]
ak_son$Entity.Name[sapply(lapply(str_extract_all(tolower(ak_son$Entity.Name), "\\w+"), function(x) str_detect(x, "^son$|^sons$")), sum) > 0]
ak_daughter <- read.csv("./ak/ak-daughter.csv", stringsAsFactors = FALSE)
ak_daughter_dedup <- ak_daughter[!duplicated(ak_daughter$Entity.Name),]
ak_daughter$Entity.Name[sapply(lapply(str_extract_all(tolower(ak_daughter$Entity.Name), "\\w+"), function(x) str_detect(x, "^daughter$|^daughters$")), sum) > 0]
246/22

## AL
al_son <-  read_csv("al/al_sons.csv")
al_son$`Entity Name`[sapply(lapply(str_extract_all(tolower(al_son$`Entity Name`), "\\w+"), function(x) str_detect(x, "^son$|^sons$")), sum) > 0]
al_son$`Entity Name`[sapply(lapply(str_extract_all(tolower(al_son$`Entity Name`), "\\w+"), function(x) str_detect(x, "^daughters$|^daughter$")), sum) > 0]

## Arkansas

### Total results = 14555
### Results per page = 250
### Total pages = 14555/250 = 59 -- total returns are smaller at 14,305
### Iterate over pages

res <- list()

for (i in 1:58) {
  web_url <- paste0("https://www.sos.arkansas.gov/corps/search_corps.php?SEARCH=1&run=", i, "&corp_type_id=&corp_name=son&agent_search=&agent_city=&agent_state=&filing_number=&cmd=")
  webpage <- read_html(web_url)
  res <- rbind(res, html_table(webpage, fill = T)[[4]])
  write_xml(webpage, file = paste0("data/ar/html_files/son_", i,".html"))
}

readr::write_csv(res, path = "data/ar/ar_son.csv")

#Above works to scrape, now let's estimate ratio
ar_son <- read.csv("./ar/ar_son.csv", stringsAsFactors = FALSE)
ar_son$X1[sapply(lapply(str_extract_all(tolower(ar_son$X1), "\\w+"), function(x) str_detect(x, "^son$|^sons$")), sum) > 0]
length(ar_son$X1[sapply(lapply(str_extract_all(tolower(ar_son$X1), "\\w+"), function(x) str_detect(x, "^son$|^sons$")), sum) > 0])
ar_daughter <- read.csv("./ar/ar-daughter.csv", stringsAsFactors = FALSE)
ar_daughter$Name[sapply(lapply(str_extract_all(tolower(ar_daughter$Name), "\\w+"), function(x) str_detect(x, "^daughter$|^daughters$")), sum) > 0]
1482/87

## CA
ca_son <-  read_csv("ca/son_corp.csv")
ca_son$`Entity Name`[sapply(lapply(str_extract_all(tolower(ca_son$`Entity Name`), "\\w+"), function(x) str_detect(x, "^son$|^sons$")), sum) > 0]
ca_son$`Entity Name`[sapply(lapply(str_extract_all(tolower(ca_son$`Entity Name`), "\\w+"), function(x) str_detect(x, "^daughters$|^daughter$")), sum) > 0]

# Colorado
base_url <- "https://www.sos.state.co.us/biz/BusinessEntityResultsAdv.do?&cmd=passgo&pi1=1"
webpage <- read_html(base_url)
entities <- html_nodes(webpage, "td:nth-child(4)")
(entities <- as.character(html_text(entities)))
#https://www.sos.state.co.us/biz/BusinessEntityResultsAdv.do?&cmd=passgo&pi1=1
#https://www.sos.state.co.us/biz/BusinessEntityResultsAdv.do?&cmd=passgo&pi1=2
#https://www.sos.state.co.us/biz/BusinessEntityResultsAdv.do?&cmd=passgo&pi1=3
#td:nth-child(4)
#Why it's not working?

#Connecticut
ct_son <- read.csv("ct/ct_son.csv", stringsAsFactors = FALSE)
ct_son_dedup <- ct_son[!duplicated(ct_son$Business.Name), ]
ct_son_dedup$Business.Name[sapply(lapply(str_extract_all(tolower(ct_son_dedup$Business.Name), "\\w+"), function(x) str_detect(x, "^sons$|^son$")), sum) > 0]
ct_daughter <- read.csv("ct/ct-daughter.csv", stringsAsFactors = FALSE)
#ct_daughter_dedup <- ct_daughter[!duplicated(ct_daughter$Business.Name), ] #not needed since already dedeupd
ct_daughter$Business.Name[sapply(lapply(str_extract_all(tolower(ct_daughter$Business.Name), "\\w+"), function(x) str_detect(x, "^daughters$|^daughter$")), sum) > 0]
875/43

#Delaware
de_son <- read.csv("de/de_son.csv", stringsAsFactors = FALSE)
de_son_dedup <- de_son[!duplicated(de_son$FILE.NUMBER), ]
de_son_dedup$ENTITY.NAME[sapply(lapply(str_extract_all(tolower(de_son_dedup$ENTITY.NAME), "\\w+"), function(x) str_detect(x, "^sons$|^son$")), sum) > 0]
de_daughter <- read.csv("de/de-daughter.csv", stringsAsFactors = FALSE)
de_daughter_dedup <- de_daughter[!duplicated(de_daughter$ENTITY.NAME), ]
de_daughter_dedup$ENTITY.NAME[sapply(lapply(str_extract_all(tolower(de_daughter_dedup$ENTITY.NAME), "\\w+"), function(x) str_detect(x, "^daughters$|^daughter$")), sum) > 0]
24/33

#Florida
#First parse the hard coded links in excel and get get the usual regex
daughter_links <- c("http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?inquiryType=EntityName&searchNameOrder=DAUGHTER&searchTerm=daughter",
                    "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=DAUGHTERSAIRCONDITIONING%20P150000284920&SearchTerm=daughter&entityId=P15000028492&listNameOrder=DAUGHTERBEAR%20L180001340680",
                    "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=DAUGHTERSDESTINYINTERNATIONALM%20N100000072850&SearchTerm=daughter&entityId=N10000007285&listNameOrder=DAUGHTERSAMERICANREVOLUTION%20X005230",
                    "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=DAUGHTERSFAITHCLEANING%20P040001235880&SearchTerm=daughter&entityId=P04000123588&listNameOrder=DAUGHTERSDESTINYOUTREACHMINIST%20N060000012260",
                    "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=DAUGHTERSINTERLINE%20P930000863780&SearchTerm=daughter&entityId=P93000086378&listNameOrder=DAUGHTERSFAITHINTERNATIONAL%20N190000002520",
                    "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=DAUGHTERSLEGACY%20L040000468030&SearchTerm=daughter&entityId=L04000046803&listNameOrder=DAUGHTERSINVIRTUOUSATTITUDES%20N100000055470",
                    "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=DAUGHTERSPRESS%20L180002033410&SearchTerm=daughter&entityId=L18000203341&listNameOrder=DAUGHTERSLEGACY%20L170001931391",
                    "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=DAUGHTERSSONS%20L100000469040&SearchTerm=daughter&entityId=L10000046904&listNameOrder=DAUGHTERSPURPOSE%20N120000048760",
                    "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=DAUGHTERSZION%20N097590&SearchTerm=daughter&entityId=N09759&listNameOrder=DAUGHTERSSONS%20P190000486570"
                    )
fl_daughter <- c()
for (i in 1:length(daughter_links)){ 
  url <- daughter_links[i]
  print(url)
  webpage <- read_html(url)
  entities <- html_nodes(webpage, "td.large-width")
  entities <- as.character(html_text(entities))
  fl_daughter <- c(fl_daughter, entities)
}

fl_daughter[sapply(lapply(str_extract_all(tolower(fl_daughter), "\\w+"), function(x) str_detect(x, "^daughters$|^daughter$")), sum) > 0]

fl_son <- c()
for (i in 1:length(fl_son_links)){ #fl_son_links was defined at bottom of script since it's looonngg 
  url <- fl_son_links[i]
  print(url)
  webpage <- read_html(url)
  entities <- html_nodes(webpage, "td.large-width")
  entities <- as.character(html_text(entities))
  fl_son <- c(fl_son, entities)
}

fl_son[sapply(lapply(str_extract_all(tolower(fl_son), "\\w+"), function(x) str_detect(x, "^sons$|^son$")), sum) > 0]
729/176

# Georgia
# Gaurav did selenium and I am pulling csv from 7z file
ga_son <- read.csv("./ga/ga_son.csv", stringsAsFactors = FALSE)
ga_son$Business.Name[sapply(lapply(str_extract_all(tolower(ga_son$Business.Name), "\\w+"), function(x) str_detect(x, "^sons$|^son$")), sum) > 0]
length(ga_son$Business.Name[sapply(lapply(str_extract_all(tolower(ga_son$Business.Name), "\\w+"), function(x) str_detect(x, "^sons$|^son$")), sum) > 0])
ga_daughter <- read.csv("./ga/ga_daughter.csv", stringsAsFactors = FALSE)
ga_daughter$Business.Name[sapply(lapply(str_extract_all(tolower(ga_daughter$Business.Name), "\\w+"), function(x) str_detect(x, "^daughters$|^daughter$")), sum) > 0]
6002/497


## HI
hi_son <-  read_csv("hi/hi_sons.csv")
hi_son$Name[sapply(lapply(str_extract_all(tolower(hi_son$Name), "\\w+"), function(x) str_detect(x, "^son$|^sons$")), sum) > 0]
hi_son$Name[sapply(lapply(str_extract_all(tolower(hi_son$Name), "\\w+"), function(x) str_detect(x, "^daughters$|^daughter$")), sum) > 0]

# Illinois
il_son <- read.csv("./il/il_son.csv", stringsAsFactors = FALSE)
il_son$Corporation.LLC.Name[sapply(lapply(str_extract_all(tolower(il_son$Corporation.LLC.Name), "\\w+"), function(x) str_detect(x, "^sons$|^son$")), sum) > 0]
length(il_son$Corporation.LLC.Name[sapply(lapply(str_extract_all(tolower(il_son$Corporation.LLC.Name), "\\w+"), function(x) str_detect(x, "^sons$|^son$")), sum) > 0])
il_daughter <- read.csv("./il/il_daughter.csv", stringsAsFactors = FALSE)
il_daughter$Name[sapply(lapply(str_extract_all(tolower(il_daughter$Name), "\\w+"), function(x) str_detect(x, "^daughters$|^daughter$")), sum) > 0]
2324/48


# Indiana
in_son <- read.csv("./in/in_son.csv", stringsAsFactors = FALSE)
in_daughter <- read.csv("./in/in_daughter.csv", stringsAsFactors = FALSE)
in_son$Business.Name[sapply(lapply(str_extract_all(tolower(in_son$Business.Name), "\\w+"), function(x) str_detect(x, "^sons$|^son$")), sum) > 0]
length(in_son$Business.Name[sapply(lapply(str_extract_all(tolower(in_son$Business.Name), "\\w+"), function(x) str_detect(x, "^sons$|^son$")), sum) > 0])
in_daughter$Business.Name[sapply(lapply(str_extract_all(tolower(in_daughter$Business.Name), "\\w+"), function(x) str_detect(x, "^daughters$|^daughter$")), sum) > 0]
4928/195

# Iowa
url <- "https://sos.iowa.gov/search/business/results.aspx?q=MI0p_RDYIXTq-Lzw4n6v0a7GMqtM0u6xAU3Y-wIyA7g4QiHX9FC_BAPt4PUVSlTGLkQiEob5rnXSkB4q1uOHagHzR6kFVa77GId5YqZm-O_jiKuYgtK8or5mlg4VIvu9teoMdPeZW8tdPEN5fKRV0A5UG0RYYMuEbAqAy0jVlIP7itdBzXn1d1NAz4GsXu57Lj5dG_bTAjtXchzv2LQc7UFe2Nts-MJLg4wIS8gMoW-CikDaWmyMj3a8tC656ayV9jIuQKghkTptr3QffJHt4UMZ67UT7Fz2KWr0MRZGB7JL_6vpWn8rxDYbq5livcqKeSNIjVLX16EZepJdRN_IjmgjrrjQ7asrMJFRjDYe0-VRdy_hEvbupQJHab_SkjTg0"
webpage <- read_html(url)
entities <- html_nodes(webpage, "td:nth-child(2)")
(entities <- as.character(html_text(entities)))
#not working and should work, don't know why.


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
#Minnesota was redone with proper spider below
#mn_daughter <- read.csv("mn/mn_daughter.csv", stringsAsFactors = FALSE) 
#mn_daughter_dedup <- mn_daughter[!duplicated(mn_daughter$Business.Name), ]
#mn_daughter_dedup[sapply(lapply(str_extract_all(tolower(mn_daughter_dedup), "\\w+"), function(x) str_detect(x, "^daughters$|^daughter$")), sum) > 0]
#mn_son <- read.csv("mn/mn_son.csv", stringsAsFactors = FALSE) 
#mn_son_dedup <- mn_son[!duplicated(mn_son$Business.Name), ]
#mn_son_dedup[sapply(lapply(str_extract_all(tolower(mn_son_dedup), "\\w+"), function(x) str_detect(x, "^sons$|^son$")), sum) > 0]

#Minnesota with spider

#son
#results are capped at 500 so I generate several URLs to maximize results:
#2 scope (begins, contains) x 2 status (active, inactive) x 2 search terms (son, sons) = 8 URLs
mn_son_urls <- c(
  "https://mblsportal.sos.state.mn.us/Business/BusinessSearch?BusinessName=son&IncludePriorNames=False&Status=Active&Type=BeginsWith",
  "https://mblsportal.sos.state.mn.us/Business/BusinessSearch?BusinessName=son&IncludePriorNames=False&Status=Inactive&Type=BeginsWith",
  "https://mblsportal.sos.state.mn.us/Business/BusinessSearch?BusinessName=son&IncludePriorNames=False&Status=Active&Type=Contains",
  "https://mblsportal.sos.state.mn.us/Business/BusinessSearch?BusinessName=son&IncludePriorNames=False&Status=Inactive&Type=Contains",
  "https://mblsportal.sos.state.mn.us/Business/BusinessSearch?BusinessName=sons&IncludePriorNames=False&Status=Active&Type=BeginsWith",
  "https://mblsportal.sos.state.mn.us/Business/BusinessSearch?BusinessName=sons&IncludePriorNames=False&Status=Inactive&Type=BeginsWith",
  "https://mblsportal.sos.state.mn.us/Business/BusinessSearch?BusinessName=sons&IncludePriorNames=False&Status=Active&Type=Contains",
  "https://mblsportal.sos.state.mn.us/Business/BusinessSearch?BusinessName=sons&IncludePriorNames=False&Status=Inactive&Type=Contains"
  )

mn_son <- c()
for (i in 1:length(mn_son_urls)){ 
  url <- mn_son_urls[i]
  webpage <- read_html(url)
  entities <- html_nodes(webpage, "strong")
  entities <- as.character(html_text(entities))
  mn_son <- c(mn_son, entities)
}
mn_son_dedup <- mn_son[!duplicated(mn_son)]
mn_son_dedup[sapply(lapply(str_extract_all(tolower(mn_son_dedup), "\\w+"), function(x) str_detect(x, "^sons$|^son$")), sum) > 0]

#daughter
#results are capped at 500 so I generate several URLs to maximize results:
#2 scope (begins, contains) x 2 status (active, inactive) x 2 search terms (daughter, daughters) = 8 URLs
mn_daughter_urls <- c(
  "https://mblsportal.sos.state.mn.us/Business/BusinessSearch?BusinessName=daughter&IncludePriorNames=False&Status=Active&Type=BeginsWith",
  "https://mblsportal.sos.state.mn.us/Business/BusinessSearch?BusinessName=daughter&IncludePriorNames=False&Status=Inactive&Type=BeginsWith",
  "https://mblsportal.sos.state.mn.us/Business/BusinessSearch?BusinessName=daughter&IncludePriorNames=False&Status=Active&Type=Contains",
  "https://mblsportal.sos.state.mn.us/Business/BusinessSearch?BusinessName=daughter&IncludePriorNames=False&Status=Inactive&Type=Contains",
  "https://mblsportal.sos.state.mn.us/Business/BusinessSearch?BusinessName=daughters&IncludePriorNames=False&Status=Active&Type=BeginsWith",
  "https://mblsportal.sos.state.mn.us/Business/BusinessSearch?BusinessName=daughters&IncludePriorNames=False&Status=Inactive&Type=BeginsWith",
  "https://mblsportal.sos.state.mn.us/Business/BusinessSearch?BusinessName=daughters&IncludePriorNames=False&Status=Active&Type=Contains",
  "https://mblsportal.sos.state.mn.us/Business/BusinessSearch?BusinessName=daughters&IncludePriorNames=False&Status=Inactive&Type=Contains"
)

mn_daughter <- c()
for (i in 1:length(mn_daughter_urls)){ 
  url <- mn_daughter_urls[i]
  webpage <- read_html(url)
  entities <- html_nodes(webpage, "strong")
  entities <- as.character(html_text(entities))
  mn_daughter <- c(mn_daughter, entities)
}

mn_daughter_dedup <- mn_daughter[!duplicated(mn_daughter)]
mn_daughter_dedup[sapply(lapply(str_extract_all(tolower(mn_daughter_dedup), "\\w+"), function(x) str_detect(x, "^daughters$|^daughter$")), sum) > 0]
392/213

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

#New York

#ny son search
#results capped at 500 so doing a few combos to get more search results; can't do son search for contains since asking for 4+letters
#could have done function but was lazy and trying this time

#all entities begin with son (n=500, 25rows in 20 pages), do it fast cause captcha expires
url_part1 <- "https://appext20.dos.ny.gov/corp_public/CORPSEARCH.SELECT_ENTITY?p_captcha=11455&p_captcha_check=09CCE55B478EEA884DBBA5DB5C8BDEB337481C4E64CB2B552FEEDD34B4BA90B33896BDDF303E37CCBA6B1410FB270833&p_srch_results_page="
url_part2 <- "&p_entity_name=%73%6F%6E&p_name_type=%25&p_search_type=%42%45%47%49%4E%53"
ny_begin_son_all <- c()
for (i in 1:20){
  print(i)
  url <- paste(url_part1,i,url_part2, sep ="")
  webpage <- read_html(url)
  entities <- html_nodes(webpage, "td a")
  (entities <- as.character(html_text(entities)))
  print(entities)
  ny_begin_son_all <- c(ny_begin_son_all, entities)
}

#active entities begin with son
url_part1 <- "https://appext20.dos.ny.gov/corp_public/CORPSEARCH.SELECT_ENTITY?p_captcha=17563&p_captcha_check=3EC0F71D0273C26E2142DD694966562738D1683DB092B7A0F2CA14D9CB0EC621F33C6588312F5B352B4CC8FAA9502F37&p_srch_results_page="
url_part2 <- "&p_entity_name=%73%6F%6E&p_name_type=%41&p_search_type=%42%45%47%49%4E%53"
ny_begin_son_act <- c()
for (i in 1:20){
  print(i)
  url <- paste(url_part1,i,url_part2, sep ="")
  webpage <- read_html(url)
  entities <- html_nodes(webpage, "td a")
  (entities <- as.character(html_text(entities)))
  print(entities)
  ny_begin_son_act <- c(ny_begin_son_act, entities)
}

#all entities begin with sons (242 in 10 pages)
url_part1 <- "https://appext20.dos.ny.gov/corp_public/CORPSEARCH.SELECT_ENTITY?p_captcha=17131&p_captcha_check=9CA5212BEC574C56DE03B23233ADE1AFEC23D7D3E6473720EC390E8E9BC0D89173F6382485A89ADC9C371A3B108AEE38&p_srch_results_page="
url_part2 <- "&p_entity_name=%73%6F%6E%73&p_name_type=%25&p_search_type=%42%45%47%49%4E%53"
ny_begin_sons_all <- c()
for (i in 1:10){
  print(i)
  url <- paste(url_part1,i,url_part2, sep ="")
  webpage <- read_html(url)
  entities <- html_nodes(webpage, "td a")
  (entities <- as.character(html_text(entities)))
  print(entities)
  ny_begin_sons_all <- c(ny_begin_sons_all, entities)
}

#all entities contain sons (500 in 20 pages)
url_part1 <- "https://appext20.dos.ny.gov/corp_public/CORPSEARCH.SELECT_ENTITY?p_captcha=11955&p_captcha_check=39E89A7263D598AF9E09DDE158470F0DAD4A51BE991AA76C237B70427B4E4F5E41BD8F16FA1C2395D4D163C4A1093AA3&p_srch_results_page="
url_part2 <- "&p_entity_name=%73%6F%6E%73&p_name_type=%25&p_search_type=%43%4F%4E%54%41%49%4E%53"
ny_contain_sons_all <- c()
for (i in 1:20){
  print(i)
  url <- paste(url_part1,i,url_part2, sep ="")
  webpage <- read_html(url)
  entities <- html_nodes(webpage, "td a")
  (entities <- as.character(html_text(entities)))
  print(entities)
  ny_contain_sons_all <- c(ny_contain_sons_all, entities)
}

#active entities contain sons
url <- "https://appext20.dos.ny.gov/corp_public/CORPSEARCH.SELECT_ENTITY?p_captcha=13141&p_captcha_check=FD134A844178E860EC88933635B1AB7C4D4A2C5D32B433C78E4E7033C01673F4DD799AF77B41DF5DA88CAD344E9D89DA&p_srch_results_page=1&p_entity_name=%73%6F%6E%73&p_name_type=%41&p_search_type=%43%4F%4E%54%41%49%4E%53"
url_part1 <- unlist(strsplit(url,"srch_results_page=1"))[1]
url_part2 <- unlist(strsplit(url,"srch_results_page=1"))[2]
ny_contain_sons_act <- c()
for (i in 1:20){
  print(i)
  url <- paste(url_part1,"srch_results_page=",i,url_part2, sep ="")
  webpage <- read_html(url)
  entities <- html_nodes(webpage, "td a")
  (entities <- as.character(html_text(entities)))
  print(entities)
  ny_contain_sons_act <- c(ny_contain_sons_act, entities)
}

#combine all ny sons/son from above
ny_son <- c(ny_begin_son_all, 
            ny_begin_son_act,
            ny_begin_sons_all,
            ny_contain_sons_all,
            ny_contain_sons_act)
write.csv(ny_son, "./ny/ny_son.csv", col.names = FALSE, row.names = FALSE)
ny_son_dedup <- ny_son[!duplicated(ny_son)]

ny_son_dedup[sapply(lapply(str_extract_all(tolower(ny_son_dedup), "\\w+"), function(x) str_detect(x, "^sons$|^son$")), sum) > 0]
length(ny_son_dedup[sapply(lapply(str_extract_all(tolower(ny_son_dedup), "\\w+"), function(x) str_detect(x, "^sons$|^son$")), sum) > 0])

#ny daughter search
#results capped at 500 so doing a few combos to get more search results; 

#all containing daughter, 231
url <- "https://appext20.dos.ny.gov/corp_public/CORPSEARCH.SELECT_ENTITY?p_captcha=18305&p_captcha_check=D9ACD705AA56A9797A0674DD45000AAF0E8BF757B73936089F201F0CDA1FB10C6165BB6D495B133D6857C4AD24C223C2&p_srch_results_page=1&p_entity_name=%64%61%75%67%68%74%65%72&p_name_type=%25&p_search_type=%43%4F%4E%54%41%49%4E%53"
url_part1 <- unlist(strsplit(url,"srch_results_page=1"))[1]
url_part2 <- unlist(strsplit(url,"srch_results_page=1"))[2]
ny_contain_daughter_all <- c()
for (i in 1:10){
  print(i)
  url <- paste(url_part1,"srch_results_page=",i,url_part2, sep ="")
  webpage <- read_html(url)
  entities <- html_nodes(webpage, "td a")
  (entities <- as.character(html_text(entities)))
  print(entities)
  ny_contain_daughter_all <- c(ny_contain_daughter_all, entities)
}

#all containing daughters, capped at 500
url <- "https://appext20.dos.ny.gov/corp_public/CORPSEARCH.SELECT_ENTITY?p_captcha=13995&p_captcha_check=3C73DB25469DD5F792B4A1A16AD0DE194451E8E387274F5005E99DF9022AAB4424C4B36CD83E456AF640317B0169F26F&p_srch_results_page=1&p_entity_name=%64%61%75%67%68%74%65%72%73&p_name_type=%25&p_search_type=%43%4F%4E%54%41%49%4E%53"
url_part1 <- unlist(strsplit(url,"srch_results_page=1"))[1]
url_part2 <- unlist(strsplit(url,"srch_results_page=1"))[2]
ny_contain_daughters_all <- c()
for (i in 1:20){
  print(i)
  url <- paste(url_part1,"srch_results_page=",i,url_part2, sep ="")
  webpage <- read_html(url)
  entities <- html_nodes(webpage, "td a")
  (entities <- as.character(html_text(entities)))
  print(entities)
  ny_contain_daughters_all <- c(ny_contain_daughters_all, entities)
}

#active containing daughters, 368
url <- "https://appext20.dos.ny.gov/corp_public/CORPSEARCH.SELECT_ENTITY?p_captcha=11156&p_captcha_check=9E62E9F2CF7380BD1C923C141B3EE72401C801A8748505F2FF182EE2EA0FFDA6FE47244698F32DFF69146FBC43A89F19&p_srch_results_page=1&p_entity_name=%64%61%75%67%68%74%65%72%73&p_name_type=%41&p_search_type=%43%4F%4E%54%41%49%4E%53"
url_part1 <- unlist(strsplit(url,"srch_results_page=1"))[1]
url_part2 <- unlist(strsplit(url,"srch_results_page=1"))[2]
ny_contain_daughters_act <- c()
for (i in 1:15){
  print(i)
  url <- paste(url_part1,"srch_results_page=",i,url_part2, sep ="")
  webpage <- read_html(url)
  entities <- html_nodes(webpage, "td a")
  (entities <- as.character(html_text(entities)))
  print(entities)
  ny_contain_daughters_act <- c(ny_contain_daughters_act, entities)
}

#all beginning daughters, 99
url <- "https://appext20.dos.ny.gov/corp_public/CORPSEARCH.SELECT_ENTITY?p_captcha=14817&p_captcha_check=57858246ABB9EE0532A9F2E0410D466B20E073CD8530F61D38EBF1A01C210D518FA93ED8FC52E93AB136B7FEFCF75482&p_srch_results_page=1&p_entity_name=%64%61%75%67%68%74%65%72%73&p_name_type=%25&p_search_type=%42%45%47%49%4E%53"
url_part1 <- unlist(strsplit(url,"srch_results_page=1"))[1]
url_part2 <- unlist(strsplit(url,"srch_results_page=1"))[2]
ny_beg_daughters_all <- c()
for (i in 1:4){
  print(i)
  url <- paste(url_part1,"srch_results_page=",i,url_part2, sep ="")
  webpage <- read_html(url)
  entities <- html_nodes(webpage, "td a")
  (entities <- as.character(html_text(entities)))
  print(entities)
  ny_beg_daughters_all <- c(ny_beg_daughters_all, entities)
}

#Combine all ny daugthers
ny_daughter <- c(ny_contain_daughter_all,
                 ny_contain_daughters_all,
                 ny_contain_daughters_act,
                 ny_beg_daughters_all)
write.csv(ny_daughter, "./ny/ny_daughter.csv", col.names = FALSE, row.names = FALSE)
ny_daughter_dedup <- ny_daughter[!duplicated(ny_daughter)]

ny_daughter_dedup[sapply(lapply(str_extract_all(tolower(ny_daughter_dedup), "\\w+"), function(x) str_detect(x, "^daughters$|^daughter$")), sum) > 0]

1190/745

#North Dakota
nd_daughter <- read.csv("nd/nd_daughter.csv", stringsAsFactors = FALSE) 
nd_daughter_dedup <- nd_daughter[!duplicated(nd_daughter$Name),]#deduping since it has a lot of garbage 
nd_daughter_dedup[sapply(lapply(str_extract_all(tolower(nd_daughter_dedup), "\\w+"), function(x) str_detect(x, "^daughters$|^daughter$")), sum) > 0]
nd_son <- read.csv("nd/nd_son.csv", stringsAsFactors = FALSE) 
nd_son_dedup <- nd_son[!duplicated(nd_son$Name),]#deduping since it has a lot of garbage and many repeats due to how search was done
nd_son_dedup[sapply(lapply(str_extract_all(tolower(nd_son_dedup), "\\w+"), function(x) str_detect(x, "^sons$|^son$")), sum) > 0]
605/23

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

# Tennessee
tn_son <- read.csv("tn/tn_son.csv", stringsAsFactors = FALSE) 
tn_son_dedup <- tn_son[!duplicated(tn_son$Control),]
tn_son_dedup$Name[sapply(lapply(str_extract_all(tolower(tn_son_dedup$Name), "\\w+"), function(x) str_detect(x, "^sons$|^son$")), sum) > 0]
tn_daughter <- read.csv("tn/tn_daughter.csv", stringsAsFactors = FALSE) 
tn_daughter_dedup <- tn_daughter[!duplicated(tn_daughter$Control),]
tn_daughter_dedup$Name[sapply(lapply(str_extract_all(tolower(tn_daughter_dedup$Name), "\\w+"), function(x) str_detect(x, "^daughters$|^daughter$")), sum) > 0]
203/132

#Utah
ut_son <- read.csv("./ut/ut_son.csv", stringsAsFactors = FALSE)
ut_son$Header[sapply(lapply(str_extract_all(tolower(ut_son$Header), "\\w+"), function(x) str_detect(x, "^sons$|^son$")), sum) > 0]
ut_daughter <- read.csv("./ut/ut_daughter.csv", stringsAsFactors = FALSE)
ut_daughter$Header[sapply(lapply(str_extract_all(tolower(ut_daughter$Header), "\\w+"), function(x) str_detect(x, "^daughters$|^daughter$")), sum) > 0]
81/16

# Vermont
vt_son <- read.csv("vt/vt_son.csv", stringsAsFactors = FALSE) 
vt_son$Business.Name[sapply(lapply(str_extract_all(tolower(vt_son$Business.Name), "\\w+"), function(x) str_detect(x, "^sons$|^son$")), sum) > 0]
length(vt_son$Business.Name[sapply(lapply(str_extract_all(tolower(vt_son$Business.Name), "\\w+"), function(x) str_detect(x, "^sons$|^son$")), sum) > 0])
vt_daughter <- read.csv("vt/vt_daughter.csv", stringsAsFactors = FALSE) 
vt_daughter$Business.Name[sapply(lapply(str_extract_all(tolower(vt_daughter$Business.Name), "\\w+"), function(x) str_detect(x, "^daughter$|^daughters$")), sum) > 0]
1361/63

## WA
wa_son <-  read_csv("wa/Business Search Result son.csv")
wa_son$`Business Name`[sapply(lapply(str_extract_all(tolower(wa_son$`Business Name`), "\\w+"), function(x) str_detect(x, "^son$|^sons$")), sum) > 0]
wa_son$`Business Name`[sapply(lapply(str_extract_all(tolower(wa_son$`Business Name`), "\\w+"), function(x) str_detect(x, "^daughters$|^daughter$")), sum) > 0]

#West Virginia
url <- "https://apps.wv.gov/SOS/BusinessEntitySearch/SearchResults.aspx?name=5lnEkwp0XdUTW8DNfgzlaw%3d%3d"
webpage <- read_html(url)
entities <- html_nodes(webpage, "td:nth-child(1)")
(entities <- as.character(html_text(entities)))
#It kind of works but I don't see a pattern in the URLs generated and for son there are 100 pages with same URL. blocked.

#Wyoming
wy_db <- read.csv("wy/FILING_edited.csv", stringsAsFactors = FALSE, sep = "|", row.names = NULL, na.strings = "") 
wy_db <- wy_db[!is.na(wy_db$FILING_NAME),] #remove rows with no name
wy_db <- wy_db[order(wy_db$FILING_NAME),]
str(wy_db)
dim(wy_db)
wy_db$FILING_NAME[sapply(lapply(str_extract_all(tolower(wy_db$FILING_NAME), "\\w+"), function(x) str_detect(x, "^daughter$|^daughters$")), sum) > 0]
wy_db$FILING_NAME[sapply(lapply(str_extract_all(tolower(wy_db$FILING_NAME), "\\w+"), function(x) str_detect(x, "^son$|^sons$")), sum) > 0]
238/21







#--------------------------------------------------------------------------------------------------------------------
# --  APPENDIX

#Florida son links to parse
fl_son_links <- c(
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?inquiryType=EntityName&searchNameOrder=SON&searchTerm=son",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONAAR%20L150002065850&SearchTerm=son&entityId=L15000206585&listNameOrder=SON%20F242780",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONACITYPRO%20L140000498120&SearchTerm=son&entityId=L14000049812&listNameOrder=SONAB%20L130000107720",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONADI%20P050001345840&SearchTerm=son&entityId=P05000134584&listNameOrder=SONACITYPRODUCTIONS%20L140000498121",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONAFORMACENTRALFLORIDA%20P130000078140&SearchTerm=son&entityId=P13000007814&listNameOrder=SONADIGITAL%20L190001439860",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONAINVILLEUSA%20L190002141400&SearchTerm=son&entityId=L19000214140&listNameOrder=SONAGALLERY%20P040001420670",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONAL10551%20P140000387690&SearchTerm=son&entityId=P14000038769&listNameOrder=SONAIR%20L050000832640",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONALIINVESTMENT%20P930000291460&SearchTerm=son&entityId=P93000029146&listNameOrder=SONAL786%20P090000392620",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONALSTRANSPORT%20L180001416910&SearchTerm=son&entityId=L18000141691&listNameOrder=SONALIMANAGEMENT%20L070000260890",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONANCE%20P110000415720&SearchTerm=son&entityId=P11000041572&listNameOrder=SONALURE%20P930000189660",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONAPPROPERTIES%20P140000369800&SearchTerm=son&entityId=P14000036980&listNameOrder=SONANDAD%205663130",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONARCOMMUNICATIONSSYSTEMS%20G868540&SearchTerm=son&entityId=G86854&listNameOrder=SONAPREACHERMAN%20L190002866130",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONARLEAKDETECTION%20L190000932500&SearchTerm=son&entityId=L19000093250&listNameOrder=SONARCONSULTING%20P010000130180",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONARTMEDS%20P100000596610&SearchTerm=son&entityId=P10000059661&listNameOrder=SONARMARKETINTELLIGENCE%20P030000399960",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONASSTAFFING%20P180000929190&SearchTerm=son&entityId=P18000092919&listNameOrder=SONARTREALESTATEINVESTMENTS%20L190000114480",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONATAOSCEOLAMANAGER%20L190002205080&SearchTerm=son&entityId=L19000220508&listNameOrder=SONATACOCONUTCREEK%20L160001821860",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONATAWESTORANGE%20L120000277590&SearchTerm=son&entityId=L12000027759&listNameOrder=SONATAPARTNERS%20P100000652920",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONAUSAHOLDINGS%20L190002139490&SearchTerm=son&entityId=L19000213949&listNameOrder=SONATECH%20P120000497920",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONBEACHCHARTERS%20P030000401630&SearchTerm=son&entityId=P03000040163&listNameOrder=SONAV%20T040000002670",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONBRIGHTDIVERSIFIEDSERVICES%20P130001020860&SearchTerm=son&entityId=P13000102086&listNameOrder=SONBEAMMINISTRIESDESIGN%209178070",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONCARPENTRY%20P150000547680&SearchTerm=son&entityId=P15000054768&listNameOrder=SONBRIGHTDIVERSIFIEDSERVICES%20P180000017540",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONCO%20P980000723210&SearchTerm=son&entityId=P98000072321&listNameOrder=SONCARTAGENAENTERTAINMENTPRODU%20P090000447460",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONCOASTPROCUREMENT%20L140000105000&SearchTerm=son&entityId=L14000010500&listNameOrder=SONCOAST%20L060000457660",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONCOSERVICES%20P090000077460&SearchTerm=son&entityId=P09000007746&listNameOrder=SONCOASTPROPERTIES%20L160001816140",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONDADPAINTING%205058740&SearchTerm=son&entityId=505874&listNameOrder=SONCOTTENTERPRISES%20S070280",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONDAUGHTERGOD13GROUP%20L180000577550&SearchTerm=son&entityId=L18000057755&listNameOrder=SONDADREALESTATE%20L100000822640",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONDEESDECORPAINTINGHOMEDECORA%20P050000338810&SearchTerm=son&entityId=P05000033881&listNameOrder=SONDAUGHTERHERNANDEZ%20P160000198000",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONDERCAPITALINVESTMENTS%20L180001925480&SearchTerm=son&entityId=L18000192548&listNameOrder=SONDEJPREMIERSERVICES%20L060000251280",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONDERMIAMI%20L190002325350&SearchTerm=son&entityId=L19000232535&listNameOrder=SONDERCONSULTING%20L190001580920",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONDIAL%20P150001021070&SearchTerm=son&entityId=P15000102107&listNameOrder=SONDERMUSIC%20L160000637090",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=PreviousList&searchNameOrder=SONDOVINTERNATIONAL%203297570&SearchTerm=son&entityId=329757&listNameOrder=SONDOVINTERNATIONAL%203297570",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONDRO%204179530&SearchTerm=son&entityId=417953&listNameOrder=SONDRASCIARAPPA%20P960000897970",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONELECTRICOMUSIC%20P060000382080&SearchTerm=son&entityId=P06000038208&listNameOrder=SONEEPHARMACYSERVICES%20P110000591600",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONESTAREALESTATE%20L877980&SearchTerm=son&entityId=L87798&listNameOrder=SONESTABOUGAINVILLE%20H013380",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONETMA%20P180000495840&SearchTerm=son&entityId=P18000049584&listNameOrder=SONESTASANIBELHARBOUR%20H013381",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONEYCOMMERCIALPROPERTYMANAGEM%20P070001348840&SearchTerm=son&entityId=P07000134884&listNameOrder=SONETPROPERTIES%20L140001194700",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONFATHERTRUCKING%20L170002165530&SearchTerm=son&entityId=L17000216553&listNameOrder=SONEYFLORIDAINVESTMENT%20P040001495310",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONFLOWER%20P090000315250&SearchTerm=son&entityId=P09000031525&listNameOrder=SONFELI%20P070001078910",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONGMASTERSTUDIOSEDUCATION%20L100000965810&SearchTerm=son&entityId=L10000096581&listNameOrder=SONGKRAN%20K494881",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONGOSAURUS%20P970000423470&SearchTerm=son&entityId=P97000042347&listNameOrder=SONGMINJONG%20P980000666190",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONGYPARTNERSREALTY%20A930000006540&SearchTerm=son&entityId=A93000000654&listNameOrder=SONGWRITERINSTITUTE%20L090001225510",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONHOMESCONSTRUCTION%20P060001119210&SearchTerm=son&entityId=P06000111921&listNameOrder=SONGZI%20P130000015700",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONIINVESTMENTS%20P030000395330&SearchTerm=son&entityId=P03000039533&listNameOrder=SONIFLOR%20P060001476440",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONIMARPRODUCTIONS%20M150000101240&SearchTerm=son&entityId=M15000010124&listNameOrder=SONILAWFIRMPA%20P140000067390",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONJACKSONVILLE%20V493570&SearchTerm=son&entityId=V49357&listNameOrder=SONIXCOMPUTER%20P990000580190",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONJIV%20L160000920240&SearchTerm=son&entityId=L16000092024&listNameOrder=SONJASUNISEX%20H165460",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONKINALVAREZMDSPA%205655490&SearchTerm=son&entityId=565549&listNameOrder=SONJOCRYJAMCONNECTIONS%20L070001071450",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONLEE%20J309160&SearchTerm=son&entityId=J30916&listNameOrder=SONKINALVAREZSAYERMDSPA%205655491",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONLIGHTCOMMUNITYCHURCH%20N233130&SearchTerm=son&entityId=N23313&listNameOrder=SONLIGHT%205349650",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONLIGHTPRODUCTIONS%20M082490&SearchTerm=son&entityId=M08249&listNameOrder=SONLIGHTINDUSTRIES%20P950000445650",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONLILYBOUTIQUE%20P070000910980&SearchTerm=son&entityId=P07000091098&listNameOrder=SONLIGHTPRODUCTIONS%20N110000011030",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONLYS%20H362810&SearchTerm=son&entityId=H36281&listNameOrder=SONLINAPARTMENTS%203287390",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONMARENTERPRISES%20P990000287960&SearchTerm=son&entityId=P99000028796&listNameOrder=SONMAINTENANCE%20P070000221360",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONMAYPROPERTIES%20L170000202320&SearchTerm=son&entityId=L17000020232&listNameOrder=SONMARFTMYERS%20M970000004070",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONMOON%20P010000799640&SearchTerm=son&entityId=P01000079964&listNameOrder=SONMDO%20L120000244740",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONNEYTRAMMELL%20L040000219520&SearchTerm=son&entityId=L04000021952&listNameOrder=SONNEREMODELINGDESIGN%20L190001891580",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONOMIXX%20P060000188010&SearchTerm=son&entityId=P06000018801&listNameOrder=SONOMEDICS%20P080000326110",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONORAVENTUREGROUP%20P030000721891&SearchTerm=son&entityId=P03000072189&listNameOrder=SONORANSUNE501%20L160001320780",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONPIZZHAIR%20L065490&SearchTerm=son&entityId=L06549&listNameOrder=SONOWAVESDIAGNOSTIC%20P930000776860",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONRAH%20P010000112820&SearchTerm=son&entityId=P01000011282&listNameOrder=SONPLUMB%20L190002667880",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONRI%20P960000742560&SearchTerm=son&entityId=P96000074256&listNameOrder=SONRAI%20L150000805550",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONRISE%20P090001022470&SearchTerm=son&entityId=P09000102247&listNameOrder=SONRISAREALESTATEHOMEINSPECTIO%20P010000906660",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONRISEAUTOMOTIVE%20L110001447960&SearchTerm=son&entityId=L11000144796&listNameOrder=SONRISE%20P940000279200",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONRISEINVESTMENTSONE%20L050000150230&SearchTerm=son&entityId=L05000015023&listNameOrder=SONRISEFOUNDATION%20N030000012830",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONRISENUTRITION%20P140000389410&SearchTerm=son&entityId=P14000038941&listNameOrder=SONRISEISPRECIOUS%20L130000299541",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONRISERETREAT%20N443260&SearchTerm=son&entityId=N44326&listNameOrder=SONRISEOASIS%20P990000049410",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONRISEVILLASII%20L020000316010&SearchTerm=son&entityId=L02000031601&listNameOrder=SONRISESALOON%20N150000001580",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONROSE%20P170000108870&SearchTerm=son&entityId=P17000010887&listNameOrder=SONRISEVILLASII%20L050000062590",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONSAFE%20L060000585410&SearchTerm=son&entityId=L06000058541&listNameOrder=SONROSEENTERPRISES%20K504000",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONSAMERICANLEGIONSQUADRONPOST%20N170000009130&SearchTerm=son&entityId=N17000000913&listNameOrder=SONSAKADISTRIBUTIONS%20L170001547000",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONSANDLAR%20L020000314700&SearchTerm=son&entityId=L02000031470&listNameOrder=SONSAMERICANREVOLUTION%20X005250",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONSBEACHES%20P130000052820&SearchTerm=son&entityId=P13000005282&listNameOrder=SONSANO%20P190000409060",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONSCHRIST%20N074000&SearchTerm=son&entityId=N07400&listNameOrder=SONSBEACHESBAYCOUNTYFLORIDA%20N010000004130",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONSCYPRESS%20P080000951260&SearchTerm=son&entityId=P08000095126&listNameOrder=SONSCIRCLE%20P020000423850",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONSDAUGHTERSPEARLHARBORSURVIV%207288570&SearchTerm=son&entityId=728857&listNameOrder=SONSDAUGHTER%20P070000610910",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONSENGINEERING%20L150000682000&SearchTerm=son&entityId=L15000068200&listNameOrder=SONSDAUGHTERSSOUTH%20N950000000490",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONSETPRISONMINISTRY%20N209860&SearchTerm=son&entityId=N20986&listNameOrder=SONSENTERPRISES%20P140000142440",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONSGODMCMINISTRYCECCHAPTER%20P110000034700&SearchTerm=son&entityId=P11000003470&listNameOrder=SONSETRECORDS%20L080000433530",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONSHINECHRISTIANACADEMY%20N940000049020&SearchTerm=son&entityId=N94000004902&listNameOrder=SONSHINEBEHAVIORSERVICESBCBA%20L180001229840",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONSHINEELECTRICALCONTRACTORS%20P000000718851&SearchTerm=son&entityId=P00000071885&listNameOrder=SONSHINECURSILLOMOVEMENT%207401690",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONSHINEELECTRICALCONTRACTORS%20P000000718851&SearchTerm=son&entityId=P00000071885&listNameOrder=SONSHINECURSILLOMOVEMENT%207401690",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONSHINEFOOTANKLECENTER%20P000000668520&SearchTerm=son&entityId=P00000066852&listNameOrder=SONSHINEEMPOWERMENT%20N120000014720",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONSHINEPOULTRY%20P030000957360&SearchTerm=son&entityId=P03000095736&listNameOrder=SONSHINEMOTORS%20L100000367230",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONSHINESPRAYERS%20L080000089320&SearchTerm=son&entityId=L08000008932&listNameOrder=SONSHINESCLEANING%20L170002309990",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONSHIPYACHTSALESFLORIDA%20L030000285320&SearchTerm=son&entityId=L03000028532&listNameOrder=SONSHIPBUILDERS%20M664970",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONSINVESTMENTCLUB%20P990000453230&SearchTerm=son&entityId=P99000045323&listNameOrder=SONSHIRAM%20P060000863210",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONSITALYHOLIDAYISLELODGENO225%207245980&SearchTerm=son&entityId=724598&listNameOrder=SONSIOINTERNATIONALFLORIDA%20F050000039670",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONSKINGMINISTRIES%20P950000645770&SearchTerm=son&entityId=P95000064577&listNameOrder=SONSITALYINAMERICASTPETERSBURG%207237600",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONSMARINEINDUSTRIAL%20P150000687750&SearchTerm=son&entityId=P15000068775&listNameOrder=SONSKOSSMUSIC%20L190000299680",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONSOBE%20P020001337920&SearchTerm=son&entityId=P02000133792&listNameOrder=SONSMASONSMASONRY%20P160000625060",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONSOUNDSOLUTIONS%20L180001785230&SearchTerm=son&entityId=L18000178523&listNameOrder=SONSOFLIBERTYPARTNERS%20L140001811050",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONSRABALAC%20L120000815290&SearchTerm=son&entityId=L12000081529&listNameOrder=SONSOURCE%20L190000014670",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONSSHINERANCH%20L090000357120&SearchTerm=son&entityId=L09000035712&listNameOrder=SONSRABALAC%20N140000096760",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONSSTONEINVESTMENTS%20P040001485090&SearchTerm=son&entityId=P04000148509&listNameOrder=SONSSHINESIDING%20P000000255100",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONSTHUNDEROUTREACH%20N980000033710&SearchTerm=son&entityId=N98000003371&listNameOrder=SONSSTONEINVESTMENTS%20P080000719260",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONSUN%20P070000680920&SearchTerm=son&entityId=P07000068092&listNameOrder=SONSTHUNDERPRODUCTIONS%20L160001042160",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONTAG%20F675410&SearchTerm=son&entityId=F67541&listNameOrder=SONSUNIONVETERANSCIVILWAR%20X005570",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONTAY2%20P090000958580&SearchTerm=son&entityId=P09000095858&listNameOrder=SONTAG%20J970300",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONTHORDESIGN%20L180000164540&SearchTerm=son&entityId=L18000016454&listNameOrder=SONTEAY%20P040000469580",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONTRANS%20P980000734700&SearchTerm=son&entityId=P98000073470&listNameOrder=SONTHOUSANDPROPERTIES%20P120000240940",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONUBU%20P100000534910&SearchTerm=son&entityId=P10000053491&listNameOrder=SONTRONICS%20P080001113730",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONUSINTERNATIONAL%20M412920&SearchTerm=son&entityId=M41292&listNameOrder=SONUELECTRICAL%20P020000752980",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONVIVIAN%20P110000930730&SearchTerm=son&entityId=P11000093073&listNameOrder=SONUSLAND%20P130000978120",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONYOPTICALARCHIVE%20F160000034830&SearchTerm=son&entityId=F16000003483&listNameOrder=SONYLATINMUSICPUBLISHING%20F930000029000",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONYSCARPETFLOOR%20P120000038910&SearchTerm=son&entityId=P12000003891&listNameOrder=SONYPANAMASA%20P202890",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONYTRANSPORT%20P080000427750&SearchTerm=son&entityId=P08000042775&listNameOrder=SONYSCLEANSERVICES%20P090000122360",
  "http://search.sunbiz.org/Inquiry/CorporationSearch/SearchResults?InquiryType=EntityName&inquiryDirectionType=ForwardList&searchNameOrder=SONZFRANCHISING%20L050001205090&SearchTerm=son&entityId=L05000120509&listNameOrder=SONYTRANSPORTSERVICES%20P180000386900"
)





















