# BigBird
NYU Capstone

Workflow

(1) Download and process weather files into KDEN Weather.RDS
(2) Run FAA Import and cleaning code (first chunk, ignore stuff at bottom), save KDEN FAA.RDS
(3) Run Master File Creation code (load the previous two, bird counts, flights) and save as KDEN complete.RDS

(4) read the file in again with your_var <- readRDS("KDEN complete.RDS")

Note- Strikes Master not uploaded due to filesize constraints
