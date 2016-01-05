requir## Samizdata

The package samizdata aims at provide some useful tools for working with time series data retrieved by Samizdata provider. It allows to easily retrieve and transform time series data through a variety of official sources. 

## Installation in R

To get the current development version from github:

```R
install.packages("devtools")
require("devtools")
install_github("Muladhara/samizdata")
```

## Usage in R

```R
#download from the source 'fred' the time series 'gdp' 
x <- getSamiz("fred", "gdp")


#download from the source 'fred' the time series 'gdp' at the vintage date '2015-07-01'
x <- getSamiz("fred", "gdp", vintage="2015-07-01")


#download from the source 'worldbank' the time series 'ic.tax.totl.cp.zs', 
#for the country Albania 'AL', with the transformation 'log'
x <- getSamiz("worldbank", "ic.tax.totl.cp.zs", country="AL", transformation="log")


#download from the source 'ecb' the time series 'gst_a_fi_n_b0x13_m8v_b1300_sa_e'  
#at the transformation 'log'
x <- getSamiz("ecb", "gst_a_fi_n_b0x13_m8v_b1300_sa_e", transformation="log")
```