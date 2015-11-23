df1 <- COD %>% select(CAUSE_NAME,STATE,YEAR,DEATHS, AADR) %>% filter(YEAR == '1999',CAUSE_NAME == 'Diseases of Heart',STATE != 'United States')

df2 <- NHCE %>% select(ITEM,Y1999,STATE_NAME) %>% filter(ITEM == 'Hospital Care (Millions of Dollars)',STATE_NAME != 'United States')

df3 <- inner_join(df1,df2, by = c("STATE" = "STATE_NAME"))

df3 %>% ggplot(aes(x = DEATHS, y = Y1999)) + geom_point() + geom_smooth(method = lm) + labs(title= 'Correlation between Spending on Hospital Care and Deaths caused by Diseases of the Heart', x= 'Deaths',y='Spending in 1999')

#lm(Y1999~DEATHS,df3)

