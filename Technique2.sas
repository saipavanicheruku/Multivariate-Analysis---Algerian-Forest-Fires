/* Technique 2 */
DATA FIRES;
  INFILE 'Algerian_forest_fires_dataset_updated.dat';
  INPUT region day month year TEMP RH WS RAIN FFMC DMC DC ISI BUI FWI classes ;
TITLE 'Forest Fires Discriminant Analysis';
PROC IML;
  USE FIRES;
  READ ALL VAR {RH WS RAIN FFMC DMC DC ISI BUI FWI} INTO X;
  X1 = X[1:122,];
  X2 = X[123:244,];
  N1 = NROW(X1);
  N2 = NROW(X2);
  X1BAR = 1/N1*X1`*J(N1,1);
  X2BAR = 1/N2*X2`*J(N2,1);
  S1 = 1/(N1-1)*X1`*(I(N1)-1/N1*J(N1))*X1;
  S2 = 1/(N2-1)*X2`*(I(N2)-1/N2*J(N2))*X2;
  Spl = 1/(N1+N2-2)*((N1-1)*S1+(N2-1)*S2);
  a = INV(Spl)*(X1BAR-X2BAR);
  z1 = a`*X1`;
  z1 = z1`;
  z2 = a`*X2`;
  z2 = z2`;
  std_a1_RH = a[1,1]*sqrt(Spl[1,1]);
  std_a2_WS = a[2,1]*sqrt(Spl[2,2]);
  std_a3_RAIN = a[3,1]*sqrt(Spl[3,3]);
  std_a4_FFMC = a[4,1]*sqrt(Spl[4,4]);
  std_a5_DMC = a[5,1]*sqrt(Spl[5,5]);
  std_a6_DC = a[6,1]*sqrt(Spl[6,6]);
  std_a7_ISI = a[7,1]*sqrt(Spl[7,7]);
  std_a8_BUI = a[8,1]*sqrt(Spl[8,8]);
  std_a9_FWI = a[9,1]*sqrt(Spl[9,9]);
  PRINT a, std_a1_RH, std_a2_WS, std_a3_RAIN, std_a4_FFMC,
    std_a5_DMC, std_a6_DC, std_a7_ISI, std_a8_BUI, std_a9_FWI;
RUN;

