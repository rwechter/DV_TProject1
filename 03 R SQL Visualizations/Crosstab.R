df1 <- NHCE %>% select(CODE, ITEM,STATE_NAME,AVERAGE_ANNUAL_PERCENT_GROWTH) %>% filter(ITEM != 'Total State Spending',STATE_NAME != 'null')
  
df1 <- mutate(df1, LOW = (AVERAGE_ANNUAL_PERCENT_GROWTH) %/% 7.01)
df1 <- mutate(df1, MED = (AVERAGE_ANNUAL_PERCENT_GROWTH) %/% 10)
df1 <- mutate(df1, HIGH = LOW + MED)  

df1 %>% ggplot(aes(x=STATE_NAME,y=ITEM,label=round(AVERAGE_ANNUAL_PERCENT_GROWTH,digits = 2),color = factor(HIGH))) + geom_text() + scale_colour_manual(values = c("blue", "orange", "green","green")) + coord_flip()
