/*Technique 3*/
PROC DISCRIM DATA = FIRES LIST CROSSVALIDATE;
  CLASS REGION;
  VAR RH WS RAIN FFMC DMC DC ISI BUI FWI;
  TITLE 'CLASSIFY';
RUN;
