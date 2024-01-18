## Inspect the new table 
colnames(all_trips)
nrow(all_trips)
dim(all_trips)
head(all_trips)
tail(all_trips)
str(all_trips)
summary(all_trips)

## Clean data

## Consolidate the "member_casual" column from four to two labels
table(all_trips$member_casual)
all_trips <- all_trips%>%
  mutate(member_casual = recode(member_casual, "Subscriber"="member",
                                "Customer"="casual"))

## Add columns that lists diff. date formats for additional opportunities to aggregate
all_trips$date <- as.Date(all_trips$started_at)
all_trips$month <- format(as.Date(all_trips$date), "%m")
all_trips$day <- format(as.Date(all_trips$date), "%d")
all_trips$year <- format(as.Date(all_trips$date), "%Y")
all_trips$day_of_week <- format(as.Date(all_trips$date), "%A")

## Add a calculated field "ride_length" to get the trip duration for the entire dataframe
## and covert it to numeric for proper calculations.
all_trips$ride_length <- difftime(all_trips$ended_at, all_trips$started_at)
is.factor(all_trips$ride_length)
all_trips$ride_length <- as.numeric(as.character(all_trips$ride_length))
is.numeric(all_trips$ride_length)

##  Remove bad data such as negative ride_length and create a new version
all_trips_v2 <- all_trips[!(all_trips$start_station_name=="HQ QR" | all_trips$ride_length<0),]