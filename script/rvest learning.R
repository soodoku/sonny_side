#Learning to rvest

#-----------------------------------------------------------------------------------------------
#Alaska
#-----------------------------------------------------------------------------------------------

#Specify URL
base_url <- "https://www.commerce.alaska.gov/cbp/main/search/entities" #won't work because it doesn't generate a URL after I typed "son" search
webpage <- read_html(base_url)

entities <- html_nodes(webpage, "td:nth-child(3)")
(entities <- as.character(html_text(entities)))

#IMDB quickie
#Get top 10 movie titles ever


base_url <- "https://www.imdb.com/chart/top/?ref_=nv_mv_250" 
webpage <- read_html(base_url)

movies <- html_nodes(webpage, ".titleColumn a")
(movies <- as.character(html_text(movies)))
#this works!

u <-'http://myanimelist.net/anime/25731/Cross_Ange:_Tenshi_to_Ryuu_no_Rondo/stats'
a <- html(u)
b <- (html_nodes(a,"#content table")) %>% html_table(fill = T)
colnames(b[[4]]) <- b[[4]][1,] %>% unlist %>% as.character
b[[4]] <- b[[4]][2:nrow(b[[4]]),]
head(b[[4]])





#-----------------------------------------------------------------------------------------------
#Billboard songs tutorial
#https://towardsdatascience.com/learn-to-create-your-own-datasets-web-scraping-in-r-f934a31748a5
#-----------------------------------------------------------------------------------------------

library(tidyverse)
library(rvest)

#Identify the url from where you want to extract data
base_url <- "https://www.billboard.com/charts/hot-100"
webpage <- read_html(base_url)

#Get song names
songs <- html_nodes(webpage, ".text--truncate.color--primary")
songs <- as.character(html_text(songs))
songs

#Get artist names
artists <- html_nodes(webpage, ".text--truncate.color--secondary")
artists <- as.character(html_text(artists))
artists

#Get ranking
rank <- html_nodes(webpage, ".chart-element__rank__number")
rank <- as.numeric(html_text(rank))
rank

cbind(rank, artists, songs)

artists[1:10]

#Format the link to navigate to the artists genius webpage
genius_urls <- paste0("https://genius.com/artists/",artists[1:10])

#Initialize a tibble to store the results
artist_lyrics <- tibble()

# Outer loop to get the song links for each artist 
for (i in 1:5) {
  genius_urls[i]
  genius_page <- read_html(genius_urls[i])
  song_links <- html_nodes(genius_page, ".mini_card_grid-song a") %>%
    html_attr("href") 
  
  #Inner loop to get the Song Name and Lyrics from the Song Link    
  for (j in 1:2) {
    
    # Get lyrics
    lyrics_scraped <- read_html(song_links[j]) %>%
      html_nodes("div.lyrics p") %>% #what???
      html_text()
    
    # Get song name
    song_name <- read_html(song_links[j]) %>%
      html_nodes("h1.header_with_cover_art-primary_info-title") %>% #what????
      html_text()
    
    # Save the details to a tibble
    artist_lyrics <- rbind(artist_lyrics, tibble(Artist = artists[i],
                                                 Song = song_name,
                                                 Lyrics = lyrics_scraped ))
    
    # Insert a time lag - to prevent me from getting booted from the site :)
    Sys.sleep(10)
  }
} 

#Inspect the results
artist_lyrics

#Above works but still confused on some stuff.

#Get top 10 songs for Mariah Carey,
genius_page <- read_html("https://genius.com/artists/Mariah-carey")
songs <- html_nodes(genius_page, ".mini_card-title")
(songs <- as.character(html_text(songs)))



############################################
#Get news title from rock page ---- test

base_url <- "https://www.billboard.com/rock"
webpage <- read_html(base_url)

#Get titles
titles <- html_nodes(webpage, ".content-title")
(titles <- as.character(html_text(titles)))

#Get links to news 
links <- 

  song_links <- html_nodes(genius_page, ".mini_card_grid-song a") %>%
  html_attr("href") 




#Get artist names
artists

#Identify the url from where you want to extract data
#????

#another good tutorial
#https://www.analyticsvidhya.com/blog/2017/03/beginners-guide-on-web-scraping-in-r-using-rvest-with-hands-on-knowledge/













