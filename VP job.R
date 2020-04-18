library(stringr)
library(bioRad)
library(filesstrings)
#library(lubridate)
#library(lutz)

`%!in%` = Negate(`%in%`)
`%+%` <- function(x,y) str_c(x,y)

files_to_process <- list.files(getwd() %+% "/todo", full.names=TRUE)
#dir.create("/home/rstudio/todo_done")

start_time_total <- Sys.time()
for (i in seq(1, length(files_to_process), by = 50)) {
  start_time = Sys.time()
  index <- seq(i, min(i+49, length(files_to_process)))
  vptemp_files <- read_vpfiles(files_to_process[index])
  vptstemp <- bind_into_vpts(vptemp_files)
  vpitemp <- integrate_profile(vptstemp)
  saveRDS(vpitemp, getwd() %+% "/VPI1 Batch " %+% index[1] %+% ".RDS")
  print("Batch " %+% index[1] %+% " to " %+% index[length(index)] 
        %+% " | Time: " %+% round(Sys.time() - start_time,2)
        %+% " | Total: " %+% round(Sys.time() - start_time_total,2))
  #Sys.sleep(3)
  move_files(files_to_process[index], "/home/rstudio/todo_done")
  print("Moved files batch: " %+% index[1])
}
print(Sys.time()-start_time_total)