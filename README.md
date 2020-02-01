## Son Bias in the US: Evidence from Business Names


I estimate the bias for sons by examining how common words `son` or `sons` are compared to `daughter(s)` in the names of businesses.

In the US, all businesses have to register with a state. All states provide a way to search business names, in part so that new companies can pick names that haven't been used before.

I begin by searching for `son(s)` and `daughter(s)` in states' databases of business names. But the results of searching `son` are inflated because of three reasons:

1. `son` is part of many English words, from names such as `Jason` and `Robinson` to ordinary English words like mason (which can also be a name).

2. `son` is a Korean name. 

3. some businesses use the word `son` playfully. For instance, `son` is a homonym of sun and some people use that to create names like `son of a beach`

I address the first concern by using a regex that only looks at words that exactly match `son` or `sons`. I also check if the string contains the words `daughter` or `daughters`. But not all states allow for regex searches or allow people to download a full set of results. Where possible, I try to draw a lower bound. But still some care is needed in interpreting the results.

In all, I find that the conservative estimate of son to daughter ratio is between 4 to 1 to 26 to 1 across states.

### Scripts

**Get Data**

1. [Alaska](scripts/ak_son.ipynb)
2. [Georgia](scripts/ga_son.ipynb)
3. [Illinois](scripts/il_son.ipynb)
4. [Indiana](scripts/in_son.ipynb)
5. [New Hampshire](scripts/nh_son.ipynb)
6. [Vermont](scripts/vt_son.ipynb)
7. [West Virginia](scripts/wv_son.ipynb)

**Find Sons and Daughters**

Scripts for addressing the first concern.

* [Regex Script](scripts/dson.R)

### Results 

[AL](data/al) returns at max. 1000 results. Results for `son(s)` are over a 1000. But when you apply regex to the 1,000, 884 come up as true positive. So the most conservative son:daughter ratio is 4. 

[CA](data/ca) returns a max. of 500 results. But it gives you total results (3609 vs. 150). We download the 500 results for `son(s)` and apply the regex. 499 come up as true positive. So the most conservative son:daughter ratio is 24. 

[HI](data/hi) returns a max. of 300 results. But it gives you total results (10,641 vs. 88). We download the 300 results for `son(s)` and apply the regex. 41 come up as true positive. So adjusted estimate = (41/300)*10,641 = 1454. The most conservative son:daughter ratio is 17. 

[MT](data/mt/) provides all the search results and we run a regex to narrow down to cases where son(s) is a separate word. A brief glimpse suggests all of the results are legitimate, of the variety `X and Son(s)` etc. There the ratio between business names with the word son and daughter is about 4. 

[OH](data/oh/) also provides an easy way to download the results. The ratio is about 26 to 1.   

[OR](data/or/) doesn't return more than 1,000 results. Results for son are over a 1000. But when you apply regex to the 1,000, 985 come up as true positive. So the most conservative son:daughter ratio is 4. 

[WA](data/wa/) returns all the results and after applying the regex, we get 2,424 results for son(s). This means a ratio of 15. 

| State | Son     | Daughter| Conservative Son/Daughter Ratio | 
|-------|---------|---------|---------------------------------|
|  AL   |  1,000+ |  126    |        7          |
|  AK   |  242    |  22     |        11         |
|  AR   |  1,482  |  87     |        17         |
|  AZ   |  -      |  -      |        -          |
|  CA   |  3,609  |  150    |        24         |
|  CO   |   -     |   -     |         -         |
|  CT   |  875    |  43     |        20         |
|  DE   |   -     |   -     |         -         |
|  FL   |  729    |  176    |         4         |
|  GA   |  6,002  |  497    |        12         |
|  HI   |  1,454  |  88     |        17         |
|  IA   |  -      |  -      |        -          | 
|  ID   |  60     |  39     |        2          | 
|  IL   |  2,324  |  48     |        48         |
|  IN   |  4,928  |  195    |        25         |
|  KS   |  75     |  14     |        5          |
|  KY   |  66     |  16     |        4          |
|  LA   |  -      |  -      |        -          |
|  MA   |  5,979  |  147    |        41         |
|  MD   |  128    |  82     |         2         |
|  ME   |   -     |   -     |         -         |
|  MI   |  2,265  |  93     |        24         |
|  MN   |  392    |  213    |         2         |
|  MO   |   -     |   -     |         -         |
|  MS   |  1,918  |  165    |        12         |
|  MT   |  240    |  66     |         4         |
|  NC   |    -    |   -     |         -         |
|  ND   |   605   |    23   |         26        |
|  NE   |   -     |   -     |         -         |
|  NH   |   3,203 |  119    |         27        |
|  NJ   |   173   |  73     |         2         |
|  NV   |  1,440  |  20     |        72         |
|  NY   |  1,190  |  745    |         2         |
|  OH   |  2,550  |  100    |        26         |
|  OK   |   -     |   -     |         -         |
|  OR   |  1,000+ |  227    |        4          |
|  PA   |   -     |   -     |         -         |
|  RI   |  206    |   12    |        17         |
|  SC   |  4,083  |   59    |        69         |
|  SD   |  129    |   11    |        12         |
|  TN   |  203    |  132    |         2         |
|  TX   |   -     |    -    |         -         |
|  UT   |   81    |   16    |         5         |
|  VI   |   -     |   -     |         -         |
|  VT   |  1,361  |   63    |        22         |
|  WA   |  2,424  |  161    |        15         |
|  WI   |  845    |  43     |        20         |
|  WV   |  128    |  72     |        2          |
|  WY   |  238    |   21    |        11         |

### Underlying Data

**Notes**

1. Searched on 11/10/2019 or later

2. Existence of "son" in the name doesn't preclude existence of the word daughter. Vice versa. 

3. For links to [all 50 SoS Business Entity Search Links](https://www.llcuniversity.com/50-secretary-of-state-sos-business-entity-search/)

4. Other notes are [here](states-work-tracker.csv)

### Authors

Walter Guillioli and Gaurav Sood
