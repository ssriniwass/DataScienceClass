## Bootstrapping

data(baseball, package='plyr')
head(baseball)
baseball <- baseball[baseball$year >= 1990, ]

bat.avg <- function(data, indices=1:nrow(data))
{
  sum(data$h[indices]) / sum(data$ab[indices])
}
bat.avg(baseball)

library(boot)
avgBoot <- boot(data=baseball, statistic=bat.avg, R=1200, stype='i')
boot.ci(avgBoot, conf=.95, type='norm')
hist(avgBoot$t)
