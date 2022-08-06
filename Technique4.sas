/*Technique 4*/
data ForestFire;
infile 'Algerian_forest_fires_dataset_updated.dat';
input Region day month year Temperature RH Ws Rain FFMC DMC DC ISI BUI FWI Classes;
run;
PROC REG;
MODEL FFMC DMC DC ISI BUI = Temperature RH Ws Rain;
TITLE 'Multivariate Multiple Regression';
OVERALL: MTEST /CANPRINT MSTAT=EXACT;
Temp_ONLY: MTEST Temperature /CANPRINT MSTAT=EXACT;
RH_X2ONLY: MTEST RH /CANPRINT MSTAT=EXACT;
Ws_ONLY: MTEST Ws /CANPRINT MSTAT=EXACT;
Rain_ONLY: MTEST Rain /CANPRINT MSTAT=EXACT;
RUN;