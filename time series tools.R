# Title: Time series tools
# Objective: Processing time series data
# Created by: Jiacheng Zhao
# Created on: 2021-03-27
# Copyright (c) Jiacheng Zhao, 2021
# Beijing Normal University
# Email: zhaojiacheng@mail.bnu.edu.cn

# time series complete ---------------------------------------------------------
# the input should be a two-column data table with the first column named "date" and formated a standarded date type (e.g., yyyy-mm-dd)
# the function automatically fill the missing data in a time series with NA
ts.complete <- function(data, by, ...) {
  tb <- tidyr::complete(
    data,
    date = seq(
      min(data[, date]),
      max(data[, date]),
      by = by
    ),
    fill = list(value = NA)
  )
  start_y <- as.numeric(substr(min(tb$date), 1, 4))
  start_m <- as.numeric(substr(min(tb$date), 6, 7))
  return(
    ts(
      as.numeric(as.matrix(tb[, 2])),
      start = c(start_y, start_m),
      ...
    )
  )
}
# example
# dt = data.table(
#   date = sort(
#     sample(
#       seq(
#         as.Date('1999/05/01'),
#         as.Date('2010/05/01'),
#         by= 'month'
#       ),
#       120
#     )
#   ),
#   value = runif(120) - seq(-140, -21)^2 / 10000
# )
# head(dt, 15)
# completed = ts.complete(dt, by = '1 month', frequency = 12)
# plot(completed)

# fill time series NA ----------------------------------------------------------
# generic function for filling NA values using seasonal Kalman filter
# the input object should be a regular time series and have a frequency
ts.fill <- function(data) zoo::na.StructTS(data)
# example
# filled = ts.fill(completed)
# opar <- par(no.readonly = T)
# par(mai = c(0.5, 0.8, 0.1, 0.1), mfrow = c(2, 1), oma = c(0, 1, 0, 0.5), tck = 0.025)
# plot(completed)
# plot(filled)
# par(opar)

# time series data -------------------------------------------------------------
# the input should be an object of class "stl" with components
# the function return a data table with each stl component
ts.data <- function(stl) {
  d <- zoo::as.yearmon(time(stl$time.series))
  dt <- cbind(d, as.data.table(stl$time.series))
  colnames(dt)[1] <- 'date'
  dt[, all := seasonal + trend + remainder]
  return(dt)
}
# example
# td = ts.data(
#   stl(filled, 'per')
# )
# print(stl(filled, 'per'))
# print(td)
# print(td)

# seasonal data ----------------------------------------------------------------
# ts.sdata <- function(data) {
#   dt = data[, year := format(data$date,'%Y')]
#   # numeric columns
#   numcols = names(Filter(is.numeric, dt))
#   # spring
#   spring <- dt[months(dt$date) %in% month.name[c(3, 4, 5)], ][, lapply(.SD, mean), by = year, .SDcols = numcols][, season := 'spring']
#   # summer
#   summer <- dt[months(dt$date) %in% month.name[c(6, 7, 8)], ][, lapply(.SD, mean), by = year, .SDcols = numcols][, season := 'summer']
#   # autumn
#   autumn <- dt[months(dt$date) %in% month.name[c(9, 10, 11)], ][, lapply(.SD, mean), by = year, .SDcols = numcols][, season := 'autumn']
#   # winter
#   winter <- dt[months(dt$date) %in% month.name[c(1, 2)], ][, lapply(.SD, mean), by = year, .SDcols = numcols][, season := 'winter']
#   return(rbind(spring, summer, autumn, winter))
# }