## Descriptive analysis
summary(all_trips_v2$ride_length)
aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = summary)

## Sort day_of_week and calculate ride_length mean
all_trips_v2$day_of_week <- ordered(all_trips_v2$day_of_week, levels = c("Sunday",
                                                                         "Monday", "Tuesday", "Wednesday", "Thursday",
                                                                         "Friday", "Saturday"))
trips_summary1 <- aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual +
                              all_trips_v2$day_of_week, FUN = mean)

## Analyze ridership data by type and weekday
trips_summary2 <- all_trips_v2%>%
  mutate(weekday = wday(started_at, label = TRUE))%>%
  group_by(member_casual, weekday)%>%
  summarise(number_of_rides = n(), average_duration = mean(ride_length))%>%
  arrange(member_casual, weekday) ## sorts

## Analyze ridership data by type and yearmonth
all_trips_v2$months <- format(as.Date(all_trips_v2$date), "%b")
all_trips_v2$months <- 
  ordered(all_trips_v2$months, levels =
            c("Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec","Jan","Feb","Mar"))

seasons <- aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual +
                       all_trips_v2$months, FUN = mean)

trips_summary3 <- all_trips_v2%>%
  mutate(yearmonth = month(started_at, label = TRUE))%>%
  group_by(member_casual, yearmonth)%>%
  summarise(number_of_rides = n(), average_duration = mean(ride_length))%>%
  arrange(member_casual, yearmonth)

## Analyze ridership data by type and yearmonth
all_trips_v2$hours <- format(as.POSIXct(all_trips_v2$started_at), "%H")

hourly <- aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual +
                        all_trips_v2$hours, FUN = mean)

trips_summary4 <- all_trips_v2%>%
  mutate(day_hours = hour(started_at))%>%
  group_by(member_casual, day_hours)%>%
  summarise(number_of_rides = n())%>%
  arrange(member_casual, day_hours)