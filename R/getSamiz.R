require(httr)
getSamiz <- function(src, ts_name, vintage='today', country='all', transformation='raw') {
  header <- ('http://samizdata.it/timeseries/') 
  if (vintage=='today') 
      URL<-paste(header, src, "/", country, "/", ts_name, "?", "&transformation=", transformation,  sep="")
  else 
      URL<-paste(header, src, "/", country, "/", ts_name, "?", "&transformation=", transformation, "&vintage=", vintage, sep="")  
  
  ts<-GET(URL)
  dates = vector("character")
  values = vector("double")
  dates <- as.Date(dates, "%Y-%m-%d")
  
  if (ts$status_code==200) {
    ts_list <- content(ts)
    data <- ts_list$data
    for (i in 1:length(data)) {
       dates<-c(dates,   as.Date (data[[i]]$date, "%Y-%m-%d") )
       values<-c(values, data[[i]]$value)
    }
    df<-data.frame(dates, values)
    names(df)<-c("DATE", toupper(ts_name))
    return(df)
  }
  else{
    print(content(ts, "text"))
    return(NULL)
  }
  
}


