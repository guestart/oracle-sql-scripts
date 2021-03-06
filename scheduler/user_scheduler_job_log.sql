REM
REM     Script:     user_scheduler_job_log.sql
REM     Author:     Quanwen Zhao
REM     Dated:      Aug 08, 2019
REM
REM     Purpose:
REM         This SQL script uses to check the executing/running situation of the oracle scheduer/job log on 'TEST' schema.
REM

PROMPT ==========================
PROMPT Executing on "TEST" schema
PROMPT ==========================

CONN test/test;

SET LINESIZE 200
SET PAGESIZE 50

COLUMN job_name  FORMAT a12
COLUMN owner     FORMAT a12
COLUMN log_date  FORMAT a35
COLUMN job_class FORMAT a17
COLUMN operation FORMAT a9
COLUMN status    FORMAT a9

SELECT job_name
       , owner
       , log_id
       , log_date
       , job_class
       , operation
       , status
FROM user_scheduler_job_log
ORDER BY log_date
/

-- A detailed demo.
-- 
-- TEST@xxxx> SET LINESIZE 200
-- TEST@xxxx> SET PAGESIZE 50
-- TEST@xxxx> 
-- TEST@xxxx> COLUMN job_name  FORMAT a12
-- TEST@xxxx> COLUMN owner     FORMAT a12
-- TEST@xxxx> COLUMN log_date  FORMAT a35
-- TEST@xxxx> COLUMN job_class FORMAT a17
-- TEST@xxxx> COLUMN operation FORMAT a9
-- TEST@xxxx> COLUMN status    FORMAT a9
-- TEST@xxxx> 
-- TEST@xxxx> SELECT job_name
--   2               , owner
--   3               , log_id
--   4               , log_date
--   5               , job_class
--   6               , operation
--   7               , status
--   8  FROM user_scheduler_job_log
--   9  ORDER BY log_date
--  10  /
-- 
-- JOB_NAME     OWNER            LOG_ID LOG_DATE                            JOB_CLASS         OPERATION STATUS
-- ------------ ------------ ---------- ----------------------------------- ----------------- --------- ---------
-- RTS_JOB      TEST              90900 06-AUG-19 04.36.09.219513 PM +08:00 DEFAULT_JOB_CLASS COMPLETED SUCCEEDED
-- RTS_JOB      TEST              90901 06-AUG-19 04.41.09.042880 PM +08:00 DEFAULT_JOB_CLASS COMPLETED SUCCEEDED
-- RTS_JOB      TEST              90902 06-AUG-19 04.46.09.048793 PM +08:00 DEFAULT_JOB_CLASS COMPLETED SUCCEEDED
-- RTS_JOB      TEST              90904 06-AUG-19 04.51.09.044790 PM +08:00 DEFAULT_JOB_CLASS COMPLETED SUCCEEDED
-- RTS_JOB      TEST              90905 06-AUG-19 04.56.09.046098 PM +08:00 DEFAULT_JOB_CLASS COMPLETED SUCCEEDED
-- RTS_JOB      TEST              90906 06-AUG-19 04.56.09.048318 PM +08:00 DEFAULT_JOB_CLASS COMPLETED SUCCEEDED
-- 
-- 6 rows selected.
