## Son Bias in the US: Evidence from Business Names

I estimate the bias for sons by examining how common words `son` or `sons` are compared to `daughter(s)` in the names of businesses.

In the US, all businesses have to register with a state. All states provide a way to search business names, in part so that new companies can pick names that haven't been used before.

I begin by searching for `son(s)` and `daughter(s)` in states' databases of business names. But the results of searching `son` are inflated because of three reasons:

* `son` is part of many English words, from names such as `Jason` and `Robinson` to ordinary English words like mason (which can also be a name).

* `son` is a Korean name. 

* some businesses use the word `son` playfully. For instance, `son` is a homonym of sun and some people use that to create names like `son of a beach`

I address the first concern by using a regex that only looks at words that exactly match `son` or `sons`. But not all states allow for regex searches or allow people to download a full set of results. Where possible, I try to draw a lower bound. But still some care is needed in interpreting the results.

In all, I find that the conservative estimate of son to daughter ratio is between 4 to 1 to 26 to 1 across states.

### Script

Script for addressing the first concern.

* [Regex Script](scripts/dson.R)
    - AL
    - CA
    - HI
    - MT
    - OH
    - OR
    - WA

### Results 

[AL](data/al) returns at max. 1000 results. Results for `son(s)` are over a 1000. But when you apply regex to the 1,000, 884 come up as true positive. So the most conservative son:daughter ratio is 4. 

[CA](data/ca) returns a max. of 500 results. But it gives you total results (3609 vs. 150). We download the 500 results for `son(s)` and apply the regex. 499 come up as true positive. So the most conservative son:daughter ratio is 24. 

[HI](data/hi) returns a max. of 300 results. But it gives you total results (10,641 vs. 88). We download the 300 results for `son(s)` and apply the regex. 41 come up as true positive. So adjusted estimate = (41/300)*10,641 = 1454. The most conservative son:daughter ratio is 17. 

[MT](data/mt/) provides all the search results and we run a regex to narrow down to cases where son(s) is a separate word. A brief glimpse suggests all of the results are legitimate, of the variety `X and Son(s)` etc. There the ratio between business names with the word son and daughter is about 4. 

[OH](data/oh/) also provides an easy way to download the results. The ratio is about 26 to 1.   

[OR](data/or/) doesn't return more than 1,000 results. Results for son are over a 1000. But when you apply regex to the 1,000, 985 come up as true positive. So the most conservative son:daughter ratio is 4. 

[WA](data/wa/) returns all the results and after applying the regex, we get 2,424 results for son(s). This means a ratio of 15. 

| State | Son    | Daughter| Son/Daughter Ratio | Conservative Est. | 
|-------|--------|---------|--------------------|-------------------|
|  AL   |  1000+ |  126    |        8           |        7          |
|  CA   |  3609  |  150    |        24          |        24         |
|  HI   |  1,454 |  88     |        17          |        17         |
|  ID   |  60    |  39     |        -           |                   | 
|  MI   |  2265  |  93     |        24          |                   |
|  MT   |  240   |  66     |        4           |         4         |
|  NV   |  1440  |  20     |        72          |                   |
|  OH   |  2550  |  100    |        26          |        26         |
|  OR   |  1000+ |  227    |        -           |         4         |
|  PA   |   NA   |  NA     |        -           |                   |
|  WA   |  2424  |  161    |        15          |         15        |
|  WI   |  845   |  43     |        20          |                   |

### Underlying Data

**Notes**

1. Searched on 11/10/2019 or later

2. Existence of "son" in the name doesn't preclude existence of the word daughter. Vice versa. 

3. For links to [all 50 SoS Business Entity Search Links](https://www.llcuniversity.com/50-secretary-of-state-sos-business-entity-search/)

**By State**

* [AL](https://www.sos.alabama.gov/government-records/business-entity-records)
    - caps returns at 1000.

* [CA](https://businesssearch.sos.ca.gov/)
    - gives the number of results. 
    - you need to do separate searches for corporations and llc. 

* [CT](https://www.concord-sots.ct.gov/CONCORD/online?sn=PublicInquiry&eid=9740)

* [HI](https://hbe.ehawaii.gov/documents/search.html)
    - gives counts but returns only 300. 
    - problematic regex search as counts words with son in them and funny things like 'son of a beach'

* [ID](https://sosbiz.idaho.gov/search/business)
    - regex used: `.*_son(s)_.*` and `.*_daughter(s)_.*`

* [MI](https://cofs.lara.state.mi.us/SearchApi/Search/Search)
    - keyword search
    - returns number of results

* [MT](https://sosmt.gov/business/)
    - offers downloadable list
    - doesn't do a good regex search. need to run regex.

* [NV](https://esos.nv.gov/EntitySearch/OnlineEntitySearch)
    - pop-up tells us the number of search results if search results > 500

* [OR](http://egov.sos.state.or.us/br/pkg_web_name_srch_inq.login)
    - max results capped at 1000
    - can copy and paste easily

* [PA](https://www.corporations.pa.gov/Search/corpsearch) 
    - doesn't seem to allow for exhaustive search

* [WA](https://ccfs.sos.wa.gov/#/)
    - gives the full list of results. downloadable.

* [WI](https://www.wdfi.org/apps/CorpSearch/Advanced.aspx?type=Simple&q=son)
    - Searches for "son" as a separate word.
    - Had to do multiple searches---breaking by time---for son as results > 500

