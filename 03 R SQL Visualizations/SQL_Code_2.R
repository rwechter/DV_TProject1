setwd("~/DataVisualization/DV_RProject2")

file_path <- "./01\ Data/LeadingCausesStateYear.csv"

df <- read.csv(file_path, stringsAsFactors = FALSE)
COD <- df

str(df) # Uncomment this and  run just the lines to here to get column types to use for getting the list of measures.

measures <- c("YEAR","DEATHS","AADR")

# Get rid of special characters in each column.
# Google ASCII Table to understand the following:

dimensions <- setdiff(names(df), measures)

sql <- paste("CREATE TABLE", "COD", "(\n")
if( length(dimensions) > 1 || ! is.na(dimensions)) {
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

