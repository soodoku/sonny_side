## Sons and Daughters

I estimate bias for sons by examining the extent to which the word son(s) is more common in business names than the word daughter(s). 

Businesses are registered with the state level in the U.S. and most states provide a way to search the data so that new businesses can pick names that haven't been used before. I search for 'son' and 'daughter' in state's databases for business names.

### Data

| State | Son    | Daughter| Son/Daughter Ratio |
|-------|--------|---------|--------------------|
|  AL   |  1000+ |  126    |        8           |
|  CA   |  3609  |  150    |        24          |
|  HI   |   -    |  88     |        -           |
|  MI   |  2265  |  93     |        24          |
|  MT   |        |  66     |                    |
|  NV   |  1440  |  20     |        72          |
|  OH   |  2550  |  100    |        26          |
|  OR   |  1000+ |  227    |        -           |
|  PA   |   NA   |  NA     |        -           |
|       |        |         |                    |
|  WA   |  1440  |  161    |        9           |
|  WI   |  845   |  43     |        20          |



### Underlying Data

**Notes**
1. Searched on 11/10/2019 or later
2. Existence of "son" in the name doesn't preclude existence of the word daughter. Vice versa. 

**By State**

* [AL](https://www.sos.alabama.gov/government-records/business-entity-records)
    - caps returns at 1000.

* [CA](https://businesssearch.sos.ca.gov/)
    - gives the number of results. 
    - you need to do separate searches for corporations and llc. 

* [HI](https://hbe.ehawaii.gov/documents/search.html)
    - gives counts but returns only 300. 
    - problematic regex search as counts words with son in them and funny things like 'son of a beach'

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

