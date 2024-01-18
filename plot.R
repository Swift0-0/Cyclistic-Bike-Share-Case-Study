## Number of rides - weekly 
options(scipen = 999)
weekly_plot1 <- trips_summary2%>%
  ggplot(aes(x=weekday, y=number_of_rides, fill=member_casual)) +
  geom_col(position = "dodge") +
  labs(title = "Weekly Number of Rides By Rider Type")

## Average duration - weekly
weekly_plot2 <- trips_summary2%>%
  ggplot(aes(x=weekday, y=average_duration, fill=member_casual)) +
  geom_col(position = "dodge") +
  labs(title = "Weekly Average Duration By Rider Type")

## Average duration by seasons
##Spring  
spring_plot2 <- trips_summary3%>%
  filter(yearmonth =="Apr"|yearmonth =="May"|yearmonth =="Jun")%>%
  ggplot(aes(x=yearmonth, y=average_duration, fill=member_casual)) +
  geom_col(position = "dodge") +
  labs(title = "Average Duration By Rider Type - Spring")

##Summer
summer_plot2 <- trips_summary3%>%
  filter(yearmonth =="Jul"|yearmonth =="Aug"|yearmonth =="Sep")%>%
  ggplot(aes(x=yearmonth, y=average_duration, fill=member_casual)) +
  geom_col(position = "dodge") +
  labs(title = "Average Duration By Rider Type - Summer")

##Fall
fall_plot2 <- trips_summary3%>%
  filter(yearmonth =="Oct"|yearmonth =="Nov"|yearmonth =="Dec")%>%
  ggplot(aes(x=yearmonth, y=average_duration, fill=member_casual)) +
  geom_col(position = "dodge") +
  labs(title = "Average Duration By Rider Type - Fall")


##Winter
winter_plot2 <- trips_summary3%>%
  filter(yearmonth =="Jan"|yearmonth =="Feb"|yearmonth =="Mar")%>%
  ggplot(aes(x=yearmonth, y=average_duration, fill=member_casual)) +
  geom_col(position = "dodge") +
  labs(title = "Average Duration By Rider Type - Winter")

##Average duration by seasons dashboard
library(patchwork)
(spring_plot2 | summer_plot2) / (fall_plot2 | winter_plot2)

##Number of rides by seasons
##Spring
spring_plot1 <- trips_summary3%>%
  filter(yearmonth =="Apr"|yearmonth =="May"|yearmonth =="Jun")%>%
  ggplot(aes(x=yearmonth, y=number_of_rides, fill=member_casual)) +
  geom_col(position = "dodge") +
  labs(title = "Number of Rides By Rider Type - Spring")

##Summer
summer_plot1 <- trips_summary3%>%
  filter(yearmonth =="Jul"|yearmonth =="Aug"|yearmonth =="Sep")%>%
  ggplot(aes(x=yearmonth, y=number_of_rides, fill=member_casual)) +
  geom_col(position = "dodge") +
  labs(title = "Number of Rides By Rider Type - Summer")

##Fall
fall_plot1 <- trips_summary3%>%
  filter(yearmonth =="Oct"|yearmonth =="Nov"|yearmonth =="Dec")%>%
  ggplot(aes(x=yearmonth, y=number_of_rides, fill=member_casual)) +
  geom_col(position = "dodge") +
  labs(title = "Number of Rides By Rider Type - Fall")

##Winter
winter_plot1 <- trips_summary3%>%
  filter(yearmonth =="Jan"|yearmonth =="Feb"|yearmonth =="Mar")%>%
  ggplot(aes(x=yearmonth, y=number_of_rides, fill=member_casual)) +
  geom_col(position = "dodge") +
  labs(title = "Number of Rides By Rider Type - Winter")

##Number of rides by seasons dashboard
(spring_plot1 | summer_plot1) / (fall_plot1 | winter_plot1)

## Individual Plot (casual / member) - Weekly
## Member
member_plot1 <- trips_summary2%>%
  filter(member_casual == "member")%>%
  ggplot(aes(x=weekday, y=number_of_rides, fill=member_casual)) +
  geom_col(position = "dodge") +
  scale_fill_manual(values = c("#87CEEB")) +
  labs(title = "Number of Rides By Rider Type - Weekly")

member_plot2 <- trips_summary2%>%
  filter(member_casual == "member")%>%
  ggplot(aes(x=weekday, y=average_duration, fill=member_casual)) +
  geom_col(position = "dodge") +
  scale_fill_manual(values = c("#87CEEB")) +
  labs(title = "Average Duration By Rider Type - Weekly")

##Casual
casual_plot1 <- trips_summary2%>%
  filter(member_casual == "casual")%>%
  ggplot(aes(x=weekday, y=number_of_rides, fill=member_casual)) +
  geom_col(position = "dodge") +
  labs(title = "Number of Rides By Rider Type - Weekly")

casual_plot2 <- trips_summary2%>%
  filter(member_casual == "casual")%>%
  ggplot(aes(x=weekday, y=average_duration, fill=member_casual)) +
  geom_col(position = "dodge") +
  labs(title = "Average Duration By Rider Type - Weekly")

## Individual dashboard - Weekly
(member_plot1 | member_plot2) / (casual_plot1 | casual_plot2)

## Individual Plot (casual / member) - monthly
##Member
member_plot3 <- trips_summary3%>%
  filter(member_casual == "member")%>%
  ggplot(aes(x=yearmonth, y=number_of_rides, fill=member_casual)) +
  geom_col(position = "dodge") +
  scale_fill_manual(values = c("#87CEEB")) +
  theme(axis.text.x=element_text(angle=90,vjust=0.5,hjust=1)) +
  labs(title = "Number of Rides By Rider Type - Monthly")

member_plot4 <- trips_summary3%>%
  filter(member_casual == "member")%>%
  ggplot(aes(x=yearmonth, y=average_duration, fill=member_casual)) +
  geom_col(position = "dodge") +
  scale_fill_manual(values = c("#87CEEB")) +
  theme(axis.text.x=element_text(angle=90,vjust=0.5,hjust=1)) +
  labs(title = "Average Duration By Rider Type - Monthly")

##Casual
casual_plot3 <- trips_summary3%>%
  filter(member_casual == "casual")%>%
  ggplot(aes(x=yearmonth, y=number_of_rides, fill=member_casual)) +
  geom_col(position = "dodge") +
  theme(axis.text.x=element_text(angle=90,vjust=0.5,hjust=1)) +
  labs(title = "Number of Rides By Rider Type - Monthly")

casual_plot4 <- trips_summary3%>%
  filter(member_casual == "casual")%>%
  ggplot(aes(x=yearmonth, y=average_duration, fill=member_casual)) +
  geom_col(position = "dodge") +
  theme(axis.text.x=element_text(angle=90,vjust=0.5,hjust=1)) +
  labs(title = "Average Duration By Rider Type - Monthly")

## Individual dashboard - monthly
(member_plot3 | member_plot4) / (casual_plot3 | casual_plot4)

## Hourly Plot
##Number of rides
hourly_plot1 <- trips_summary4%>%
  ggplot(aes(x=day_hours, y=number_of_rides, fill=member_casual)) +
  geom_col(position = "dodge") +
  scale_x_continuous(breaks=seq(0,24, by=3)) +
  labs(title = "Number of Rides By Rider Type - Hourly",
       caption = "24 hour time format")