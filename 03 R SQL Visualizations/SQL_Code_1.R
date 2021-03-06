require(tidyr)
require(dplyr)
require(ggplot2)

setwd("/Users/Ryan_Wechter/DataVisualization/DV_RProject3/01\ Data/provider-state-estimates")

file_path <- "US_AGGREGATE09.csv"

df <- read.csv(file_path, stringsAsFactors = FALSE)
NHCE <- df

# str(df) # Uncomment this and  run just the lines to here to get column types to use for getting the list of measures.

dimensions <- c("Code","Item","Group","Region_Number","Region_Name","State_Name")



measures <- setdiff(names(df), dimensions)


sql <- paste("CREATE TABLE", "NHCE", "(\n--")
if( length(measures) > 1 || ! is.na(dimensions)) {
  for(d in dimensions) {
    sql <- paste(sql, paste(d, "varchar2(4000),\n"))
  }
}
if( length(measures) > 1 || ! is.na(measures)) {
  for(m in measures) {
    if(m != tail(measures, n=1)) sql <- paste(sql, paste(m, "number(38,4),\n"))
    else sql <- paste(sql, paste(m, "number(38,4)\n"))
  }
}
sql <- paste(sql, ");")
cat(sql)