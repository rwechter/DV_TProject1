df1 <- NHCE %>% select(COUNTRYGROUP,CODE,ITEM,STATE_NAME,Y1980,Y1981,Y1982,Y1983,Y1984,Y1985,Y1986,Y1987,Y1988,Y1989,Y1990,Y1991,Y1992,Y1993,Y1994,Y1995,Y1996,Y1997,Y1998,Y1999,Y2000,Y2001,Y2002,Y2003,Y2004,Y2005,Y2006,Y2007,Y2008,Y2009,AVERAGE_ANNUAL_PERCENT_GROWTH) %>% filter(STATE_NAME == "Texas",CODE != '12') %>% select(ITEM,Y1980,Y1981,Y1982,Y1983,Y1984,Y1985,Y1986,Y1987,Y1988,Y1989,Y1990,Y1991,Y1992,Y1993,Y1994,Y1995,Y1996,Y1997,Y1998,Y1999,Y2000,Y2001,Y2002,Y2003,Y2004,Y2005,Y2006,Y2007,Y2008,Y2009)

  
df2 <- melt(df1,id.var = "ITEM")

#ggplot(df2,aes(x=variable,y=value,fill = ITEM)) + geom_bar(stat='identity')

ggplot () + 
  coord_cartesian() +
  scale_x_discrete() +
  scale_y_continuous() +
  labs(title = 'Annual Healthcare Expenditure in Texas by Service Type',x='Year',y='Spending') +
  layer(data = df2, mapping = aes(x = variable, y =value, fill = ITEM), stat = 'identity',geom = 'bar') + 
  theme(axis.text.x = element_text(angle = 45,size = 10))

  