/* Technique 1 */
DATA ForestFire;
  INFILE 'Algerian_forest_fires_dataset_updated.dat';
  INPUT Region day month year Temperature RH Ws Rain FFMC DMC DC ISI BUI FWI Classes;
TITLE 'Final Project - Technique 1';
PROC IML;
  USE ForestFire;
  READ ALL VAR {RH Ws Rain FFMC DMC DC ISI BUI FWI} INTO X;
  X1 = X[1:122,];
  X2 = X[123:244,];
  RESET PRINT;
  N1 = NROW(X1);
  N2 = NROW(X2);
  X1BAR = 1/N1*X1`*J(N1,1);
  X2BAR = 1/N2*X2`*J(N2,1);
  S1 = 1/(N1-1)*X1`*(I(N1)-1/N1*J(N1))*X1; 
  S2 = 1/(N2-1)*X2`*(I(N2)-1/N2*J(N2))*X2;    
  Spl = 1/(N1+N2-2)*((N1-1)*S1+(N2-1)*S2);     
  T2 = N1*N2/(N1+N2)*(X1BAR-X2BAR)`*INV(Spl)*(X1BAR-X2BAR);
RUN;


