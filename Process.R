library(tidyverse)

# 1.  COMBINING TABLES 

# 1.1 DAILY ACTIVITY TABLE

colnames(dailyActivity_merged_am)
colnames(dailyActivity_merged_ma)
colnames(dailyCalories_merged_am)
colnames(dailyIntensities_merged_am)
colnames(dailySteps_merged_am)

nrow(dailyActivity_merged_am)
nrow(dailyActivity_merged_ma)

daily_activity <- rbind(dailyActivity_merged_am, dailyActivity_merged_ma)
nrow(daily_activity)

rm(dailyActivity_merged_am, dailyActivity_merged_ma, dailyCalories_merged_am, dailyIntensities_merged_am, dailySteps_merged_am)



# 1.2  WEIGHT LOG TABLE

colnames(weightLogInfo_merged_am)
colnames(weightLogInfo_merged_ma)

nrow(weightLogInfo_merged_am)
nrow(weightLogInfo_merged_ma)

weight_log <- rbind(weightLogInfo_merged_am, weightLogInfo_merged_ma)
nrow(weight_log)

rm(weightLogInfo_merged_am, weightLogInfo_merged_ma)



# 1.3  HEARTRATE SECONDS TABLE

colnames(heartrate_seconds_merged_am)
colnames(heartrate_seconds_merged_ma)

nrow(heartrate_seconds_merged_am)
nrow(heartrate_seconds_merged_ma)

heartrate_seconds <- rbind(heartrate_seconds_merged_am, heartrate_seconds_merged_ma)
nrow(heartrate_seconds)

rm(heartrate_seconds_merged_am, heartrate_seconds_merged_ma)




# 1.4  HOURLY CALORIES INTENSITIES STEPS TABLE

colnames(hourlyCalories_merged_ma)
colnames(hourlyIntensities_merged_ma)
colnames(hourlySteps_merged_ma)

nrow(hourlyCalories_merged_ma)
nrow(hourlyIntensities_merged_ma)
nrow(hourlySteps_merged_ma)

hourly_summary <- merge(hourlyCalories_merged_ma, hourlyIntensities_merged_ma, by = c("Id", "ActivityHour"))
hourly_summary <- merge(hourly_summary, hourlySteps_merged_ma, by = c("Id", "ActivityHour"))
nrow(hourly_summary)
colnames(hourly_summary)

rm(hourlyCalories_merged_ma, hourlyIntensities_merged_ma, hourlySteps_merged_ma)

# ------------------------

colnames(hourlyCalories_merged_am)
colnames(hourlyIntensities_merged_am)
colnames(hourlySteps_merged_am)

nrow(hourlyCalories_merged_am)
nrow(hourlyIntensities_merged_am)
nrow(hourlySteps_merged_am)

hourly_summary_ <- merge(hourlyCalories_merged_am, hourlyIntensities_merged_am, by = c("Id", "ActivityHour"))
hourly_summary_ <- merge(hourly_summary_, hourlySteps_merged_am, by = c("Id", "ActivityHour"))
nrow(hourly_summary_)
colnames(hourly_summary_)

rm(hourlyCalories_merged_am, hourlyIntensities_merged_am, hourlySteps_merged_am)

# ------------------------

colnames(hourly_summary)
colnames(hourly_summary_)

nrow(hourly_summary)
nrow(hourly_summary_)

hourly__summary <- rbind(hourly_summary, hourly_summary_)
nrow(hourly__summary)

rm(hourly_summary, hourly_summary_)
hourly_summary <- hourly__summary
rm(hourly__summary)



# 1.5  MINUTELY CALORIES INTENSITY STEPS METs TABLE

colnames(minuteCaloriesNarrow_merged_ma)
colnames(minuteIntensitiesNarrow_merged_ma)
colnames(minuteMETsNarrow_merged_ma)
colnames(minuteStepsNarrow_merged_ma)

nrow(minuteCaloriesNarrow_merged_ma)
nrow(minuteIntensitiesNarrow_merged_ma)
nrow(minuteMETsNarrow_merged_ma)
nrow(minuteStepsNarrow_merged_ma)

minutely_summary_ma <- merge(minuteCaloriesNarrow_merged_ma, minuteIntensitiesNarrow_merged_ma, by = c("Id", "ActivityMinute"))
minutely_summary_ma <- merge(minutely_summary_ma, minuteMETsNarrow_merged_ma, by = c("Id", "ActivityMinute"))
minutely_summary_ma <- merge(minutely_summary_ma, minuteStepsNarrow_merged_ma, by = c("Id", "ActivityMinute"))
nrow(minutely_summary_ma)
colnames(minutely_summary_ma)

rm(minuteCaloriesNarrow_merged_ma, minuteIntensitiesNarrow_merged_ma, minuteMETsNarrow_merged_ma, minuteStepsNarrow_merged_ma)

# ------------------------

colnames(minuteCaloriesNarrow_merged_am)
colnames(minuteIntensitiesNarrow_merged_am)
colnames(minuteMETsNarrow_merged_am)
colnames(minuteStepsNarrow_merged_am)

nrow(minuteCaloriesNarrow_merged_am)
nrow(minuteIntensitiesNarrow_merged_am)
nrow(minuteMETsNarrow_merged_am)
nrow(minuteStepsNarrow_merged_am)

minutely_summary_am <- merge(minuteCaloriesNarrow_merged_am, minuteIntensitiesNarrow_merged_am, by = c("Id", "ActivityMinute"))
minutely_summary_am <- merge(minutely_summary_am, minuteMETsNarrow_merged_am, by = c("Id", "ActivityMinute"))
minutely_summary_am <- merge(minutely_summary_am, minuteStepsNarrow_merged_am, by = c("Id", "ActivityMinute"))
nrow(minutely_summary_am)
colnames(minutely_summary_am)

rm(minuteCaloriesNarrow_merged_am, minuteIntensitiesNarrow_merged_am, minuteMETsNarrow_merged_am, minuteStepsNarrow_merged_am)

# ------------------------

colnames(minutely_summary_am)
colnames(minutely_summary_ma)

nrow(minutely_summary_am)
nrow(minutely_summary_ma)

minutely_summary <- rbind(minutely_summary_ma, minutely_summary_am)
colnames(minutely_summary)
nrow(minutely_summary)

rm(minutely_summary_am, minutely_summary_ma)



# 1.6  MINUTES ASLEEP TABLE

colnames(minuteSleep_merged_am)
colnames(minuteSleep_merged_ma)

nrow(minuteSleep_merged_am)
nrow(minuteSleep_merged_ma)

minutes_asleep <- rbind(minuteSleep_merged_ma, minuteSleep_merged_am)
nrow(minutes_asleep)
colnames(minutes_asleep)

rm(minuteSleep_merged_ma, minuteSleep_merged_am)



# 1.7  SLEEP DAY TABLE
# USED CHATGPT TO CREATE SLEEP DAY TABLE BY REFERRING TO MINUTES ASLEEP TABLE


# 2. SUMMARY OF DATA

summary(daily_activity)
summary(heartrate_seconds)
summary(hourly_summary)
summary(minutely_summary)
summary(minutes_asleep)
summary(sleep_day)
summary(weight_log)


# 3.  CLEANING DATA

# 3.1 DAILY ACTIVITY TABLE

colSums(is.na(daily_activity))
sum(duplicated(daily_activity))

daily_activity$LoggedActivitiesDistance <- NULL

daily_activity$month <- format(as.Date(daily_activity$ActivityDate), "%m")
daily_activity$day <- format(as.Date(daily_activity$ActivityDate), "%d")
daily_activity$day_of_week <- format(as.Date(daily_activity$ActivityDate), "%A")
str(daily_activity)

daily_activity$month <- as.numeric(as.character(daily_activity$month))
daily_activity$day <- as.numeric(as.character(daily_activity$day))
str(daily_activity)


# 3.2 HEARTRATE TABLE

colSums(is.na(heartrate_seconds))
sum(duplicated(heartrate_seconds))

heartrate_duplicates <- colnames(heartrate_seconds)[sapply(heartrate_seconds, function(col) any(duplicated(col)))]
heartrate_duplicated_rows <- heartrate_seconds[duplicated(heartrate_seconds), ]

heartrate_seconds <- heartrate_seconds %>% distinct()

rm(heartrate_duplicated_rows, heartrate_duplicates)

heartrate_seconds$month <- format(as.Date(heartrate_seconds$Time), "%m")
heartrate_seconds$day <- format(as.Date(heartrate_seconds$Time), "%d")
heartrate_seconds$hour <- format(as.POSIXct(heartrate_seconds$Time), "%H")
heartrate_seconds$minute <- format(as.POSIXct(heartrate_seconds$Time), "%M")
heartrate_seconds$second <- format(as.POSIXct(heartrate_seconds$Time), "%S")
heartrate_seconds$day_of_week <- format(as.Date(heartrate_seconds$Time), "%A")
str(heartrate_seconds)

heartrate_seconds$month <- as.numeric(as.character(heartrate_seconds$month))
heartrate_seconds$day <- as.numeric(as.character(heartrate_seconds$day))
heartrate_seconds$hour <- as.numeric(as.character(heartrate_seconds$hour))
heartrate_seconds$minute <- as.numeric(as.character(heartrate_seconds$minute))
heartrate_seconds$second <- as.numeric(as.character(heartrate_seconds$second))
str(heartrate_seconds)



# 3.3 HOURLY SUMMARY TABLE

colSums(is.na(hourly_summary))
sum(duplicated(hourly_summary))

hourly_summary <- hourly_summary %>% distinct()

hourly_summary$month <- format(as.Date(hourly_summary$ActivityHour), "%m")
hourly_summary$day <- format(as.Date(hourly_summary$ActivityHour), "%d")
hourly_summary$hour <- format(as.POSIXct(hourly_summary$ActivityHour), "%H")
hourly_summary$day_of_week <- format(as.Date(hourly_summary$ActivityHour), "%A")
str(hourly_summary)

hourly_summary$month <- as.numeric(as.character(hourly_summary$month))
hourly_summary$day <- as.numeric(as.character(hourly_summary$day))
hourly_summary$hour <- as.numeric(as.character(hourly_summary$hour))
str(hourly_summary)




# 3.4 MINUTELY SUMMARY TABLE

colSums(is.na(minutely_summary))
sum(duplicated(minutely_summary))

minutely_summary <- minutely_summary %>% distinct()

minutely_summary$month <- format(as.Date(minutely_summary$ActivityMinute), "%m")
minutely_summary$day <- format(as.Date(minutely_summary$ActivityMinute), "%d")
minutely_summary$hour <- format(as.POSIXct(minutely_summary$ActivityMinute), "%H")
minutely_summary$minute <- format(as.POSIXct(minutely_summary$ActivityMinute), "%M")
minutely_summary$day_of_week <- format(as.Date(minutely_summary$ActivityMinute), "%A")
str(minutely_summary)

minutely_summary$month <- as.numeric(as.character(minutely_summary$month))
minutely_summary$day <- as.numeric(as.character(minutely_summary$day))
minutely_summary$hour <- as.numeric(as.character(minutely_summary$hour))
minutely_summary$minute <- as.numeric(as.character(minutely_summary$minute))
str(minutely_summary)



# 3.5 MINUTES ASLEEP TABLE

colSums(is.na(minutes_asleep))
sum(duplicated(minutes_asleep))

minutes_asleep <- minutes_asleep %>% distinct()

minutes_asleep$month <- format(as.Date(minutes_asleep$date), "%m")
minutes_asleep$day <- format(as.Date(minutes_asleep$date), "%d")
minutes_asleep$hour <- format(as.POSIXct(minutes_asleep$date), "%H")
minutes_asleep$minute <- format(as.POSIXct(minutes_asleep$date), "%M")
minutes_asleep$day_of_week <- format(as.Date(minutes_asleep$date), "%A")
str(minutes_asleep)

minutes_asleep$month <- as.numeric(as.character(minutes_asleep$month))
minutes_asleep$day <- as.numeric(as.character(minutes_asleep$day))
minutes_asleep$hour <- as.numeric(as.character(minutes_asleep$hour))
minutes_asleep$minute <- as.numeric(as.character(minutes_asleep$minute))
str(minutes_asleep)



# 3.6 SLEEP DAY TABLE

colSums(is.na(sleep_day))
sum(duplicated(sleep_day))

sleep_day$month <- format(as.Date(sleep_day$SleepDay), "%m")
sleep_day$day <- format(as.Date(sleep_day$SleepDay), "%d")
sleep_day$day_of_week <- format(as.Date(sleep_day$SleepDay), "%A")
str(sleep_day)

sleep_day$month <- as.numeric(as.character(sleep_day$month))
sleep_day$day <- as.numeric(as.character(sleep_day$day))
str(sleep_day)



# 3.7 WEIGHT LOG TABLE

colSums(is.na(weight_log))
sum(duplicated(weight_log))

weight_log$Fat <- NULL
weight_log <- weight_log %>% distinct()

weight_log$month <- format(as.Date(weight_log$Date), "%m")
weight_log$day <- format(as.Date(weight_log$Date), "%d")
weight_log$day_of_week <- format(as.Date(weight_log$Date), "%A")
str(weight_log)

weight_log$month <- as.numeric(as.character(weight_log$month))
weight_log$day <- as.numeric(as.character(weight_log$day))
str(weight_log)



# 4. DATA INSPECTION

summary(daily_activity)
colSums(is.na(daily_activity))
sum(duplicated(daily_activity))

summary(heartrate_seconds)
colSums(is.na(heartrate_seconds))
sum(duplicated(heartrate_seconds))

summary(hourly_summary)
colSums(is.na(hourly_summary))
sum(duplicated(hourly_summary))

summary(minutely_summary)
colSums(is.na(minutely_summary))
sum(duplicated(minutely_summary))

summary(minutes_asleep)
colSums(is.na(minutes_asleep))
sum(duplicated(minutes_asleep))

summary(sleep_day)
colSums(is.na(sleep_day))
sum(duplicated(sleep_day))

summary(weight_log)
colSums(is.na(weight_log))
sum(duplicated(weight_log))


# SAVING AS EXCEL

install.packages("openxlsx")
library(openxlsx)

write.xlsx(daily_activity, "daily_activity.xlsx")
write.xlsx(heartrate_seconds, "heartrate_seconds.xlsx")
write.xlsx(hourly_summary, "hourly_summary.xlsx")
write.xlsx(minutely_summary, "minutely_summary.xlsx")
write.xlsx(minutes_asleep, "minutes_asleep.xlsx")
write.xlsx(sleep_day, "sleep_day.xlsx")
write.xlsx(weight_log, "weight_summary.xlsx")
