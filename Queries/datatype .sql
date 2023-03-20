USE datawarehouse;

-- --------------------------------------------------------------------------------------------------------

SELECT * FROM admissions;
 
ALTER TABLE admissions CHANGE row_id row_id MEDIUMINT UNSIGNED NOT NULL PRIMARY KEY;
ALTER TABLE admissions CHANGE subject_id subject_id MEDIUMINT UNSIGNED NOT NULL;
ALTER TABLE admissions CHANGE hadm_id hadm_id MEDIUMINT UNSIGNED NOT NULL;
ALTER TABLE admissions CHANGE admittime admittime DATETIME NOT NULL;
ALTER TABLE admissions CHANGE dischtime dischtime DATETIME NOT NULL;
ALTER TABLE admissions CHANGE deathtime deathtime DATETIME; -- Genera error ya que contiene valores nulos y no permite el cambio a deathtime 

UPDATE admission SET deathtime  = NULL WHERE deathtime  = ''; -- se reemplazan los vacios con nulos dentro del campo deathime
UPDATE admission SET  deathtime= '1900-01-01 00:00:00' WHERE deathtime IS NULL;-- se reemplazan los nulos con la fecha '1900-01-01 00:00:00'
ALTER TABLE admissions CHANGE deathtime deathtime DATETIME;

ALTER TABLE admissions CHANGE admission_type admission_type VARCHAR(50) NOT NULL;
ALTER TABLE admissions CHANGE admission_location admission_location VARCHAR(50) NOT NULL;
ALTER TABLE admissions CHANGE discharge_location discharge_location VARCHAR(50) NOT NULL;
ALTER TABLE admissions CHANGE insurance insurance VARCHAR(255) NOT NULL;
ALTER TABLE admissions CHANGE language language VARCHAR(10);
ALTER TABLE admissions CHANGE religion religion VARCHAR(50);
ALTER TABLE admissions CHANGE marital_status marital_status VARCHAR(50);
ALTER TABLE admissions CHANGE ethnicity ethnicity VARCHAR(200) NOT NULL;
ALTER TABLE admissions CHANGE edregtime edregtime DATETIME; -- Genera error ya que contiene valores nulos y no permite el cambio a datetime

UPDATE admission SET edregtime  = NULL WHERE edregtime  = ''; -- se reemplazan los vacios con nulos dentro del campo edregtime
UPDATE admission SET edregtime= '1900-01-01 00:00:00' WHERE edregtime IS NULL;-- se reemplazan los nulos con la fecha '1900-01-01 00:00:00'
ALTER TABLE admissions CHANGE edregtime edregtime DATETIME;
 
ALTER TABLE admissions CHANGE edouttime edouttime DATETIME; -- Genera error ya que contiene valores nulos y no permite el cambio a datetime

UPDATE admission SET edregtime  = NULL WHERE edregtime  = ''; -- se reemplazan los vacios con nulos dentro del campo edregtime
UPDATE admission SET edregtime= '1900-01-01 00:00:00' WHERE edregtime IS NULL;-- se reemplazan los nulos con la fecha '1900-01-01 00:00:00'
ALTER TABLE admissions CHANGE edouttime edouttime DATETIME;

ALTER TABLE admissions CHANGE diagnosis diagnosis VARCHAR(255);
ALTER TABLE admissions CHANGE hospital_expire_flag hospital_expire_flag TINYINT UNSIGNED NOT NULL;
ALTER TABLE admissions CHANGE has_chartevents_data has_chartevents_data TINYINT UNSIGNED NOT NULL;
-- --------------------------------------------------------------------------------------------------------

SELECT * FROM transfers;

ALTER TABLE transfers CHANGE row_id row_id MEDIUMINT UNSIGNED NOT NULL PRIMARY KEY;
ALTER TABLE transfers CHANGE subject_id subject_id MEDIUMINT UNSIGNED NOT NULL;
ALTER TABLE transfers CHANGE hadm_id hadm_id MEDIUMINT UNSIGNED NOT NULL;
ALTER TABLE transfers CHANGE icustay_id icustay_id MEDIUMINT UNSIGNED; -- error al intentar cambiar el tipo de dato


UPDATE transfers SET icustay_id = CAST(icustay_id AS UNSIGNED) -- convertimos los datos a enteros
WHERE icustay_id IS NOT NULL AND icustay_id != '' AND icustay_id REGEXP '^[0-9]+$';
UPDATE transfers  SET icustay_id = NULL WHERE icustay_id  = '';-- nulo cuando este vacio
ALTER TABLE transfers CHANGE icustay_id icustay_id MEDIUMINT UNSIGNED;-- asignación del tipo de dato 

ALTER TABLE transfers CHANGE dbsource dbsource VARCHAR(20);
ALTER TABLE transfers CHANGE eventtype eventtype VARCHAR(20);
ALTER TABLE transfers CHANGE prev_careunit prev_careunit VARCHAR(20);
ALTER TABLE transfers CHANGE curr_careunit curr_careunit VARCHAR(20);
ALTER TABLE transfers CHANGE prev_wardid prev_wardid TINYINT UNSIGNED;-- error al tratar de cambiar el tipo de dato
SET SQL_SAFE_UPDATES = 0;-- Desactiva el modo seguro de edición 
UPDATE transfers SET prev_wardid = NULL WHERE prev_wardid = ''; -- se completa los vacios con nulos
ALTER TABLE transfers CHANGE prev_wardid prev_wardid TINYINT UNSIGNED;-- asignación de tipo de dato 
ALTER TABLE transfers CHANGE curr_wardid curr_wardid TINYINT UNSIGNED;-- error al tratar de cambiar el tipo de dato
UPDATE transfers SET curr_wardid = NULL WHERE curr_wardid = ''; -- se completa los vacios con nulos
ALTER TABLE transfers CHANGE curr_wardid curr_wardid TINYINT UNSIGNED;-- asignación de tipo de dato 
SET SQL_SAFE_UPDATES = 1;-- Activa el modo seguro de edición 
ALTER TABLE transfers CHANGE intime intime DATETIME;
UPDATE transfers SET outtime = NULL WHERE outtime = ''; -- se completa los vacios con nulos
ALTER TABLE transfers CHANGE outtime outtime DATETIME;-- error al intentar setear el tipo de dato

UPDATE transfers SET outtime  = NULL WHERE outtime  = '';-- se completa los vacios con nulos
UPDATE transfers SET  outtime= '1900-01-01 00:00:00' WHERE outtime IS NULL;-- se completan los nulos con esta fecha para que sea facil de identificar
ALTER TABLE transfers CHANGE outtime outtime DATETIME;-- se vuelve a solicitar el seteo a datetime


ALTER TABLE transfers CHANGE los los DECIMAL(20, 3); -- error al intentar setear el tipo de dato

UPDATE transfers SET los = NULL WHERE los = '';-- se completa los vacios con nulos
UPDATE transfers SET los = 2222 WHERE los IS NULL; -- se completa en esta columna con 2222 ya que es de tipo numerica y la queremos sin nulos
ALTER TABLE transfers CHANGE los los DECIMAL(20, 3); -- se vuelve a solicitar el seteo en decimal


SELECT COUNT(*) FROM transfers WHERE icustay_id IS NULL OR icustay_id = ''; 
SELECT COUNT(*) as count_zeros FROM transfers WHERE icustay_id = 0;
-- --------------------------------------------------------------------------------------------------------

SELECT * FROM services;

ALTER TABLE services CHANGE row_id row_id MEDIUMINT UNSIGNED NOT NULL PRIMARY KEY;
ALTER TABLE services CHANGE subject_id subject_id MEDIUMINT UNSIGNED NOT NULL;
ALTER TABLE services CHANGE hadm_id hadm_id MEDIUMINT UNSIGNED NOT NULL;
ALTER TABLE services CHANGE transfertime transfertime DATETIME NOT NULL;
ALTER TABLE services CHANGE prev_service prev_service VARCHAR(20);
ALTER TABLE services CHANGE prev_service prev_service VARCHAR(20) NOT NULL;
-- --------------------------------------------------------------------------------------------------------

SELECT * FROM procedures_icd;

ALTER TABLE procedures_icd CHANGE row_id row_id MEDIUMINT UNSIGNED NOT NULL PRIMARY KEY;
ALTER TABLE procedures_icd CHANGE subject_id subject_id MEDIUMINT UNSIGNED NOT NULL;
ALTER TABLE procedures_icd CHANGE hadm_id hadm_id MEDIUMINT UNSIGNED NOT NULL;
ALTER TABLE procedures_icd CHANGE seq_num seq_num TINYINT UNSIGNED NOT NULL;
ALTER TABLE procedures_icd CHANGE icd9_code icd9_code VARCHAR(10) NOT NULL;
-- --------------------------------------------------------------------------------------------------------

SELECT * FROM prescriptions;

ALTER TABLE prescriptions CHANGE row_id row_id MEDIUMINT UNSIGNED NOT NULL PRIMARY KEY;
ALTER TABLE prescriptions CHANGE subject_id subject_id MEDIUMINT UNSIGNED NOT NULL;
ALTER TABLE prescriptions CHANGE hadm_id hadm_id MEDIUMINT UNSIGNED NOT NULL;

UPDATE  prescriptions SET icustay_id = NULL WHERE icustay_id  = '';
ALTER TABLE prescriptions CHANGE icustay_id icustay_id MEDIUMINT UNSIGNED; 
ALTER TABLE prescriptions CHANGE startdate startdate DATETIME;
ALTER TABLE prescriptions CHANGE enddate enddate DATETIME;
ALTER TABLE prescriptions CHANGE drug_type drug_type VARCHAR(100) NOT NULL;
ALTER TABLE prescriptions CHANGE drug drug VARCHAR(100);
ALTER TABLE prescriptions CHANGE drug_name_poe drug_name_poe VARCHAR(100);
ALTER TABLE prescriptions CHANGE drug_name_generic drug_name_generic VARCHAR(100);
ALTER TABLE prescriptions CHANGE formulary_drug_cd formulary_drug_cd VARCHAR(120);
ALTER TABLE prescriptions CHANGE gsn gsn VARCHAR(200);
ALTER TABLE prescriptions CHANGE ndc ndc VARCHAR(120);
ALTER TABLE prescriptions CHANGE prod_strength prod_strength VARCHAR(120);
ALTER TABLE prescriptions CHANGE dose_val_rx dose_val_rx VARCHAR(120);
ALTER TABLE prescriptions CHANGE dose_unit_rx dose_unit_rx VARCHAR(120);
ALTER TABLE prescriptions CHANGE form_val_disp form_val_disp VARCHAR(120);
ALTER TABLE prescriptions CHANGE form_unit_disp form_unit_disp VARCHAR(120);
ALTER TABLE prescriptions CHANGE route route VARCHAR(120);
-- --------------------------------------------------------------------------------------------------------

SELECT * FROM patients;

ALTER TABLE patients CHANGE row_id row_id MEDIUMINT UNSIGNED NOT NULL PRIMARY KEY;
ALTER TABLE patients CHANGE subject_id subject_id MEDIUMINT UNSIGNED NOT NULL;
ALTER TABLE patients CHANGE gender gender VARCHAR(5) NOT NULL;
ALTER TABLE patients CHANGE dob dob DATETIME NOT NULL;
ALTER TABLE patients CHANGE dod dod DATETIME;
ALTER TABLE patients CHANGE dod_hosp dod_hosp DATETIME; -- Error al tratar de configurar el dato a datetime

UPDATE  patients SET dod_hosp  = NULL WHERE dod_hosp  = ''; -- se reemplaza los vacios por nulos
UPDATE patients SET dod_hosp = '1900-01-01 00:00:00' WHERE dod_hosp IS NULL;-- se reemplaza los  valores nulos por la fecha dada

ALTER TABLE patients CHANGE dod_hosp dod_hosp DATETIME; -- Error al tratar de configurar el dato a datetime

UPDATE  patients SET dod_ssn  = NULL WHERE dod_ssn = ''; -- se reemplaza los vacios por nulos
UPDATE patients SET dod_ssn  = '1900-01-01 00:00:00' WHERE dod_ssn  IS NULL; -- se reemplaza los valores nulos por la fecha dada
ALTER TABLE patients CHANGE dod_ssn dod_ssn DATETIME; -- se vuelve a pedir la configuración a datetim

ALTER TABLE patients CHANGE expire_flag expire_flag TINYINT UNSIGNED NOT NULL;
-- --------------------------------------------------------------------------------------------------------


SELECT * FROM diagnoses_icd;
   
ALTER TABLE diagnoses_icd CHANGE SUBJECT_ID SUBJECT_ID MEDIUMINT UNSIGNED NOT NULL;
ALTER TABLE diagnoses_icd CHANGE HADM_ID HADM_ID MEDIUMINT UNSIGNED NOT NULL;
ALTER TABLE diagnoses_icd CHANGE seq_num seq_num  TINYINT UNSIGNED;
ALTER TABLE diagnoses_icd CHANGE ICD9_CODE ICD9_CODE VARCHAR(10);	
-- ---------------------------------------------------------------------------------------------------------

SELECT * FROM icustays;
    
ALTER TABLE icustays CHANGE SUBJECT_ID SUBJECT_ID MEDIUMINT UNSIGNED NOT NULL;
ALTER TABLE icustays CHANGE HADM_ID HADM_ID MEDIUMINT UNSIGNED NOT NULL;
ALTER TABLE icustays CHANGE ICUSTAY_ID ICUSTAY_ID  MEDIUMINT UNSIGNED NOT NULL;
ALTER TABLE icustays CHANGE DBSOURCE DBSOURCE VARCHAR(20) NOT NULL;	
ALTER TABLE icustays CHANGE FIRST_CAREUNIT FIRST_CAREUNIT VARCHAR(20) NOT NULL;	
ALTER TABLE icustays CHANGE LAST_CAREUNIT LAST_CAREUNIT VARCHAR(20) NOT NULL;	
ALTER TABLE icustays CHANGE FIRST_WARDID FIRST_WARDID TINYINT UNSIGNED NOT NULL;
ALTER TABLE icustays CHANGE LAST_WARDID LAST_WARDID TINYINT UNSIGNED NOT NULL;
ALTER TABLE icustays CHANGE INTIME INTIME DATETIME NOT NULL;
ALTER TABLE icustays CHANGE OUTTIME OUTTIME DATETIME;
ALTER TABLE icustays CHANGE LOS LOS DECIMAL(22, 10);
ALTER TABLE icustays CHANGE ICUSTAY_ID ICUSTAY_ID MEDIUMINT UNSIGNED NOT NULL;	
-- ---------------------------------------------------------------------------------------------------------

    
ALTER TABLE labevents CHANGE SUBJECT_ID SUBJECT_ID MEDIUMINT UNSIGNED NOT NULL;
ALTER TABLE labevents CHANGE  HADM_ID HADM_ID MEDIUMINT UNSIGNED;-- Error al tratar de configurar el dato

SELECT * FROM labevents WHERE HADM_ID = 'nan';-- revisa las filas con 'nan'
UPDATE labevents SET HADM_ID = 2222 WHERE HADM_ID= 'nan';-- se reemplaza los valores 'nan' por 2222 ya que debe ser numerico el campo
ALTER TABLE labevents CHANGE  HADM_ID HADM_ID MEDIUMINT UNSIGNED;-- configuración de tipo de dato

ALTER TABLE labevents CHANGE  ITEMID ITEMID SMALLINT UNSIGNED NOT NULL;
ALTER TABLE labevents CHANGE CHARTTIME CHARTTIME DATETIME NOT NULL;
ALTER TABLE labevents CHANGE VALUE VALUE VARCHAR(200);	-- max=100
ALTER TABLE labevents CHANGE VALUENUM VALUENUM  DECIMAL(20, 3);-- error al intentar cambiar el tipo de dato

SET SQL_SAFE_UPDATES = 0;-- Desactiva el modo seguro de edición 
SELECT * FROM labevents WHERE VALUENUM = 0;-- revisamos los valores en 0
SELECT * FROM labevents WHERE VALUENUM = 'nan';-- revisamos los valores 'nan'
UPDATE labevents SET VALUENUM = 2222 WHERE VALUENUM ='nan';-- cambiamos los valores 'nan' por 2222
ALTER TABLE labevents CHANGE VALUENUM VALUENUM  DECIMAL(20, 3);-- configuramos el tipo de dato
SET SQL_SAFE_UPDATES = 1;-- Activa el modo seguro de edición 

ALTER TABLE labevents CHANGE VALUEUOM VALUEUOM VARCHAR(20);	
ALTER TABLE labevents CHANGE FLAG FLAG VARCHAR(20);	


-- ---------------------------------------------------------------------------------------------------------


ALTER TABLE chartevents CHANGE SUBJECT_ID SUBJECT_ID MEDIUMINT UNSIGNED NOT NULL;
ALTER TABLE chartevents CHANGE HADM_ID HADM_ID MEDIUMINT UNSIGNED;
ALTER TABLE chartevents CHANGE icustay_id icustay_id MEDIUMINT UNSIGNED;-- error al intendar dar formato al dato
SELECT * FROM labevents WHERE icustay_id = 'nan';-- revisa la cantidad de valores 'nan'

UPDATE chartevents SET icustay_id = 2222 WHERE icustay_id = 'nan'; -- los valores 'nan' fueron remplazados por 2222
ALTER TABLE chartevents CHANGE icustay_id icustay_id MEDIUMINT UNSIGNED;

ALTER TABLE chartevents CHANGE ITEMID ITEMID MEDIUMINT UNSIGNED NOT NULL; 
ALTER TABLE chartevents CHANGE CHARTTIME CHARTTIME DATETIME NOT NULL;
ALTER TABLE chartevents CHANGE STORETIME STORETIME DATETIME;
ALTER TABLE chartevents CHANGE CGID CGID SMALLINT UNSIGNED; 
ALTER TABLE chartevents CHANGE VALUE VALUE  TEXT; -- max=91
ALTER TABLE chartevents CHANGE VALUENUM VALUENUM DECIMAL(20, 3);-- error al intentar cambiar el tipo de dato
SELECT * FROM chartevents WHERE VALUENUM = 0;

UPDATE chartevents SET VALUENUM = 2222 WHERE COALESCE(VALUENUM, 'nan') = 'nan';-- todos los valores nan fueron remplazados por 2222
ALTER TABLE chartevents CHANGE VALUENUM VALUENUM DECIMAL(20, 3);-- asignación de tipo de dato

ALTER TABLE chartevents CHANGE VALUENUM VALUENUM DECIMAL(22, 10);
ALTER TABLE chartevents CHANGE VALUEUOM VALUEUOM VARCHAR(50);
ALTER TABLE chartevents CHANGE WARNING WARNING TINYINT UNSIGNED; 

SELECT * FROM chartevents WHERE WARNING = 'nan';
UPDATE chartevents SET WARNING = 2222 WHERE WARNING= 'nan'; -- todos los valores nan fueron remplazados por 2222

ALTER TABLE chartevents CHANGE ERROR ERROR MEDIUMINT UNSIGNED;-- error al intentar cambiar el tipo de dato

SELECT * FROM chartevents WHERE ERROR = 'nan';-- revision de valores 'nan'
UPDATE chartevents SET ERROR = 2222 WHERE ERROR= 'nan';-- se reemplaza todos los 'nan' por 2222
ALTER TABLE chartevents CHANGE ERROR ERROR MEDIUMINT UNSIGNED;-- asignación para cambiar tipo de dato

ALTER TABLE chartevents CHANGE RESULTSTATUS RESULTSTATUS  VARCHAR(50); 
ALTER TABLE chartevents CHANGE STOPPED STOPPED VARCHAR(50);
-- ---------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------


















 