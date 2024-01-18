## Compare column names
colnames(q2_2019)
colnames(q3_2019)
colnames(q4_2019)
colnames(q1_2020)

## Rename inconsistent column names using q1_2020 as the yardstick
(q2_2019 <- rename(q2_2019,
                   ride_id = "01 - Rental Details Rental ID",
                   rideable_type = "01 - Rental Details Bike ID",
                   started_at = "01 - Rental Details Local Start Time",
                   ended_at = "01 - Rental Details Local End Time",
                   start_station_name = "03 - Rental Start Station Name",
                   start_station_id = "03 - Rental Start Station ID",
                   end_station_name = "02 - Rental End Station Name",
                   end_station_id = "02 - Rental End Station ID",
                   member_casual = "User Type"))

(q3_2019 <- rename(q3_2019,
                   ride_id = "trip_id",
                   rideable_type = "bikeid",
                   started_at = "start_time",
                   ended_at = "end_time",
                   start_station_name = "from_station_name",
                   start_station_id = "from_station_id",
                   end_station_name = "to_station_name",
                   end_station_id = "to_station_id",
                   member_casual = "usertype"))

(q4_2019 <- rename(q4_2019,
                   ride_id = "trip_id",
                   rideable_type = "bikeid",
                   started_at = "start_time",
                   ended_at = "end_time",
                   start_station_name = "from_station_name",
                   start_station_id = "from_station_id",
                   end_station_name = "to_station_name",
                   end_station_id = "to_station_id",
                   member_casual = "usertype"))

## Inspect and check for incongruencies
str(q2_2019)
str(q3_2019)
str(q4_2019)
str(q1_2020)

## Aggregate columns with similar data
q2_2019 <- mutate(q2_2019, ride_id = as.character(ride_id),
                  rideable_type = as.character(rideable_type))
q3_2019 <- mutate(q3_2019, ride_id = as.character(ride_id),
                  rideable_type = as.character(rideable_type))
q4_2019 <- mutate(q4_2019, ride_id = as.character(ride_id),
                  rideable_type = as.character(rideable_type))

## Combine all data frames into one big data
all_trips <- bind_rows(q2_2019,q3_2019,q4_2019,q1_2020)

## Remove irrelevant columns
all_trips <- all_trips%>%
  select(-c(start_lat, start_lng, end_lat, end_lng, birthyear, gender,
            "05 - Member Details Member Birthday Year", "Member Gender",
            tripduration, "01 - Rental Details Duration In Seconds Uncapped"))
