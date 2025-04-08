%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Implementation of the two-layer model for the test case considered in the
% paper
%
% Author: Kin Wing Wong, kwwo@kth.se
%
% These are the integrator function in MATLAB for the two-layer model.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


ReTau = 395;
Sc = 100;
C = 10.0;
K_Re = 0.3785+ReTau*1.75e-4;
K_Sc= -0.004.*Sc.^0.5+0.4275;
L_Sc = 10.5*(Sc)^(-0.34);
TLModel_Tis_Sc_100 = @(yPlus) (1+yPlus/(ReTau*Sc))./(1/Sc+ ((1-(1.0./(1.0+exp(-(yPlus-L_Sc))))).*(K_Sc.*yPlus).^3.3 + ...
                        (1.0./(1.0+exp(-(yPlus-L_Sc)))).*(K_Re.*yPlus).^3.0)./((K_Re.*yPlus).^2+C.^2) );

ReTau = 395;
Sc = 200;
C = 10.0;
K_Re = 0.3785+ReTau*1.75e-4;
K_Sc= -0.004.*Sc.^0.5+0.4275;
L_Sc = 10.5*(Sc)^(-0.34);
TLModel_Tis_Sc_200 = @(yPlus) (1+yPlus/(ReTau*Sc))./(1/Sc+ ((1-(1.0./(1.0+exp(-(yPlus-L_Sc))))).*(K_Sc.*yPlus).^3.3 + ...
                        (1.0./(1.0+exp(-(yPlus-L_Sc)))).*(K_Re.*yPlus).^3.0)./((K_Re.*yPlus).^2+C.^2) );

ReTau = 150;
Sc = 500;
C = 10.0;
K_Re = 0.3785+ReTau*1.75e-4;
K_Sc= -0.004.*Sc.^0.5+0.4275;
L_Sc = 11.5*(Sc)^(-0.29);
TLModel_Tis_Sc_500 = @(yPlus) (1+yPlus/(ReTau*Sc))./(1/Sc+ ((1-(1.0./(1.0+exp(-(yPlus-L_Sc))))).*(K_Sc.*yPlus).^3.3 + ...
                        (1.0./(1.0+exp(-(yPlus-L_Sc)))).*(K_Re.*yPlus).^3.0)./((K_Re.*yPlus).^2+C.^2) );

ReTau = 400;
Sc = 500;
C = 10.0;
K_Re = 0.3785+ReTau*1.75e-4;
K_Sc= -0.004.*Sc.^0.5+0.4275;
L_Sc = 10.5*(Sc)^(-0.34);
TLModel_Ma_2015_Sc_500 = @(yPlus) (1+yPlus/(ReTau*Sc))./(1/Sc+ ((1-(1.0./(1.0+exp(-(yPlus-L_Sc))))).*(K_Sc.*yPlus).^3.3 + ...
                        (1.0./(1.0+exp(-(yPlus-L_Sc)))).*(K_Re.*yPlus).^3.0)./((K_Re.*yPlus).^2+C.^2) );


% PI_2023 Pr=16
ReTau = 1070;
Sc = 16;
C = 10.0;
K_Re = -1.145*(ReTau^-0.589)+0.473;
% K_Re = -1.145*(ReTau^-0.59)+0.459;
% K_Re = 0.461
K_Sc= 0.41;
L_Sc = 10.5*(Sc)^(-0.34);
TLModel_PI_2023_Pr_16 = @(yPlus) (1+yPlus/(ReTau*Sc))./(1/Sc+ ((1-(1.0./(1.0+exp(-(yPlus-L_Sc))))).*(K_Sc.*yPlus).^3.3 + ...
                        (1.0./(1.0+exp(-(yPlus-L_Sc)))).*(K_Re.*yPlus).^3.0)./((K_Re.*yPlus).^2+C.^2) );



%HS_2009 Data
ReTau = 150;
Sc = 100;
C = 10.0;
K_Re = 0.3785+ReTau*1.75e-4;
K_Sc= -0.004.*Sc.^0.5+0.4275;
L_Sc = 11.5*(Sc)^(-0.29);
TLModel_HS_2009_Pr_100  = @(yPlus) (1+(yPlus).^1./(ReTau*Sc))./(1/Sc+ ((1-(1.0./(1.0+exp(-(yPlus-L_Sc))))).*(K_Sc.*yPlus).^3.3 + ...
                        (1.0./(1.0+exp(-(yPlus-L_Sc)))).*(K_Re.*yPlus).^3.0)./((K_Re.*yPlus).^2+C.^2) );

ReTau = 150;
Sc = 200;
C = 10.0;
K_Re = 0.3785+ReTau*1.75e-4;
K_Sc= -0.004.*Sc.^0.5+0.4275;
L_Sc = 11.5*(Sc)^(-0.29);
TLModel_HS_2009_Pr_200  = @(yPlus) (1+(yPlus).^1./(ReTau*Sc))./(1/Sc+ ((1-(1.0./(1.0+exp(-(yPlus-L_Sc))))).*(K_Sc.*yPlus).^3.3 + ...
                        (1.0./(1.0+exp(-(yPlus-L_Sc)))).*(K_Re.*yPlus).^3.0)./((K_Re.*yPlus).^2+C.^2) );

ReTau = 150;
Sc = 400;
C = 10.0;
K_Re = 0.3785+ReTau*1.75e-4;
K_Sc= -0.004.*Sc.^0.5+0.4275;
L_Sc = 11.5*(Sc)^(-0.29);
TLModel_HS_2009_Pr_400  = @(yPlus) (1+(yPlus).^1./(ReTau*Sc))./(1/Sc+ ((1-(1.0./(1.0+exp(-(yPlus-L_Sc))))).*(K_Sc.*yPlus).^3.3 + ...
                        (1.0./(1.0+exp(-(yPlus-L_Sc)))).*(K_Re.*yPlus).^3.0)./((K_Re.*yPlus).^2+C.^2) );

ReTau = 180;
Sc = 1;
C = 10.0;
K_Re = 0.3785+ReTau*1.75e-4;
K_Sc= 0.41;
L_Sc = 11.5*(Sc)^(-0.29);
TLModel_SM_2007_Pr_1  = @(yPlus) (1+(yPlus).^1./(ReTau*Sc))./(1/Sc+ ((1-(1.0./(1.0+exp(-(yPlus-L_Sc))))).*(K_Sc.*yPlus).^3.3 + ...
                        (1.0./(1.0+exp(-(yPlus-L_Sc)))).*(K_Re.*yPlus).^3.0)./((K_Re.*yPlus).^2+C.^2) );

ReTau = 400;
Sc = 1;
C = 10.0;
K_Re = 0.3785+ReTau*1.75e-4;
K_Sc= 0.41;
L_Sc = 10.5*(Sc)^(-0.34);
TLModel_Ma_2015_Pr_1  = @(yPlus) (1+yPlus/(ReTau*Sc))./(1/Sc+ ((1-(1.0./(1.0+exp(-(yPlus-L_Sc))))).*(K_Sc.*yPlus).^3.3 + ...
                        (1.0./(1.0+exp(-(yPlus-L_Sc)))).*(K_Re.*yPlus).^3.0)./((K_Re.*yPlus).^2+C.^2) );

ReTau = 180;
Sc = 3;
C = 10.0;
K_Re = 0.3785+ReTau*1.75e-4;
K_Sc= 0.41;
L_Sc = 11.5*(Sc)^(-0.29);
TLModel_SM_2007_Pr_3  = @(yPlus) (1+(yPlus).^1./(ReTau*Sc))./(1/Sc+ ((1-(1.0./(1.0+exp(-(yPlus-L_Sc))))).*(K_Sc.*yPlus).^3.3 + ...
                        (1.0./(1.0+exp(-(yPlus-L_Sc)))).*(K_Re.*yPlus).^3.0)./((K_Re.*yPlus).^2+C.^2) );

ReTau = 400;
Sc = 3;
C = 10.0;
K_Re = 0.3785+ReTau*1.75e-4;
K_Sc= 0.41;
L_Sc = 10.5*(Sc)^(-0.34);
TLModel_Ma_2015_Pr_3  = @(yPlus) (1+yPlus/(ReTau*Sc))./(1/Sc+ ((1-(1.0./(1.0+exp(-(yPlus-L_Sc))))).*(K_Sc.*yPlus).^3.3 + ...
                        (1.0./(1.0+exp(-(yPlus-L_Sc)))).*(K_Re.*yPlus).^3.0)./((K_Re.*yPlus).^2+C.^2) );

ReTau = 180;
Sc = 10;
C = 10.0;
K_Re = 0.3785+ReTau*1.75e-4;
K_Sc= 0.41;
L_Sc = 11.5*(Sc)^(-0.29);
TLModel_SM_2007_Pr_10  = @(yPlus) (1+(yPlus).^1./(ReTau*Sc))./(1/Sc+ ((1-(1.0./(1.0+exp(-(yPlus-L_Sc))))).*(K_Sc.*yPlus).^3.3 + ...
                        (1.0./(1.0+exp(-(yPlus-L_Sc)))).*(K_Re.*yPlus).^3.0)./((K_Re.*yPlus).^2+C.^2) );

ReTau = 400;
Sc = 10;
C = 10.0;
K_Re = 0.3785+ReTau*1.75e-4;
K_Sc= 0.41;
L_Sc = 10.5*(Sc)^(-0.34);
TLModel_Ma_2015_Pr_10  = @(yPlus) (1+yPlus/(ReTau*Sc))./(1/Sc+ ((1-(1.0./(1.0+exp(-(yPlus-L_Sc))))).*(K_Sc.*yPlus).^3.3 + ...
                        (1.0./(1.0+exp(-(yPlus-L_Sc)))).*(K_Re.*yPlus).^3.0)./((K_Re.*yPlus).^2+C.^2) );

ReTau = 180;
Sc = 25;
C = 10.0;
K_Re = 0.3785+ReTau*1.75e-4;
K_Sc= 0.41;
L_Sc = 11.5*(Sc)^(-0.29);
TLModel_SM_2007_Pr_25  = @(yPlus) (1+(yPlus).^1./(ReTau*Sc))./(1/Sc+ ((1-(1.0./(1.0+exp(-(yPlus-L_Sc))))).*(K_Sc.*yPlus).^3.3 + ...
                        (1.0./(1.0+exp(-(yPlus-L_Sc)))).*(K_Re.*yPlus).^3.0)./((K_Re.*yPlus).^2+C.^2) );

ReTau = 400;
Sc = 25;
C = 10.0;
K_Re = 0.3785+ReTau*1.75e-4;
K_Sc= 0.41;
L_Sc = 10.5*(Sc)^(-0.34);
TLModel_Ma_2015_Pr_25  = @(yPlus) (1+yPlus/(ReTau*Sc))./(1/Sc+ ((1-(1.0./(1.0+exp(-(yPlus-L_Sc))))).*(K_Sc.*yPlus).^3.3 + ...
                        (1.0./(1.0+exp(-(yPlus-L_Sc)))).*(K_Re.*yPlus).^3.0)./((K_Re.*yPlus).^2+C.^2) );
ReTau = 180;
Sc = 49;
C = 10.0;
K_Re = 0.3785+ReTau*1.75e-4;
K_Sc= 0.41;
L_Sc = 11.5*(Sc)^(-0.29);
TLModel_SM_2007_Pr_49  = @(yPlus) (1+(yPlus).^1./(ReTau*Sc))./(1/Sc+ ((1-(1.0./(1.0+exp(-(yPlus-L_Sc))))).*(K_Sc.*yPlus).^3.3 + ...
                        (1.0./(1.0+exp(-(yPlus-L_Sc)))).*(K_Re.*yPlus).^3.0)./((K_Re.*yPlus).^2+C.^2) );

ReTau = 180;
Sc = 50;
C = 10.0;
K_Re = 0.3785+ReTau*1.75e-4;
K_Sc= 0.41;
L_Sc = 11.5*(Sc)^(-0.29);
TLModel_SM_2007_Pr_50  = @(yPlus) (1+(yPlus).^1./(ReTau*Sc))./(1/Sc+ ((1-(1.0./(1.0+exp(-(yPlus-L_Sc))))).*(K_Sc.*yPlus).^3.3 + ...
                        (1.0./(1.0+exp(-(yPlus-L_Sc)))).*(K_Re.*yPlus).^3.0)./((K_Re.*yPlus).^2+C.^2) );

ReTau = 400;
Sc = 50;
C = 10.0;
K_Re = 0.3785+ReTau*1.75e-4;
K_Sc= 0.41;
L_Sc = 10.5*(Sc)^(-0.34);
TLModel_Ma_2015_Pr_50  = @(yPlus) (1+yPlus/(ReTau*Sc))./(1/Sc+ ((1-(1.0./(1.0+exp(-(yPlus-L_Sc))))).*(K_Sc.*yPlus).^3.3 + ...
                        (1.0./(1.0+exp(-(yPlus-L_Sc)))).*(K_Re.*yPlus).^3.0)./((K_Re.*yPlus).^2+C.^2) );
ReTau = 150;
Sc = 100;
C = 10.0;
K_Re = 0.3785+ReTau*1.75e-4;
K_Sc= -0.004.*Sc.^0.5+0.4275;
L_Sc = 11.5*(Sc)^(-0.29);
TLModel_Na_2000_Pr_100  = @(yPlus) (1+(yPlus).^1./(ReTau*Sc))./(1/Sc+ ((1-(1.0./(1.0+exp(-(yPlus-L_Sc))))).*(K_Sc.*yPlus).^3.3 + ...
                        (1.0./(1.0+exp(-(yPlus-L_Sc)))).*(K_Re.*yPlus).^3.0)./((K_Re.*yPlus).^2+C.^2) );

ReTau = 150;
Sc = 500;
C = 10.0;
K_Re = 0.3785+ReTau*1.75e-4;
K_Sc= -0.004.*Sc.^0.5+0.4275;
L_Sc = 11.5*(Sc)^(-0.29);
TLModel_Na_2000_Pr_500  = @(yPlus) (1+(yPlus).^1./(ReTau*Sc))./(1/Sc+ ((1-(1.0./(1.0+exp(-(yPlus-L_Sc))))).*(K_Sc.*yPlus).^3.3 + ...
                        (1.0./(1.0+exp(-(yPlus-L_Sc)))).*(K_Re.*yPlus).^3.0)./((K_Re.*yPlus).^2+C.^2) );

ReTau = 180;
Sc = 2400;
C = 10.0;
K_Re = 0.3785+ReTau*1.75e-4;
K_Sc= -0.004.*Sc.^0.5+0.4275;
L_Sc = 11.5*(Sc)^(-0.29);
TLModel_Na_2000_Pr_2400  =@(yPlus) (1+yPlus/(ReTau*Sc))./(1/Sc+ ((1-(1.0./(1.0+exp(-(yPlus-L_Sc))))).*(K_Sc.*yPlus).^3.3 + ...
                        (1.0./(1.0+exp(-(yPlus-L_Sc)))).*(K_Re.*yPlus).^3.0)./((K_Re.*yPlus).^2+C.^2) );

ReTau = 420;
Sc = 6;
C = 10.0;
K_Re = 0.3785+ReTau*1.75e-4;
K_Sc= 0.41;
L_Sc = 10.5*(Sc)^(-0.34);
TLModel_Ri_2023_Pr_6_420 = @(yPlus) (1+yPlus/(ReTau*Sc))./(1/Sc+ ((1-(1.0./(1.0+exp(-(yPlus-L_Sc))))).*(K_Sc.*yPlus).^3.3 + ...
                        (1.0./(1.0+exp(-(yPlus-L_Sc)))).*(K_Re.*yPlus).^3.0)./((K_Re.*yPlus).^2+C.^2) );

ReTau = 628;
Sc = 6;
C = 10.0;
K_Re = 0.4647+2.5714e-6*ReTau;
K_Sc= 0.41;
L_Sc = 10.5*(Sc)^(-0.34);
TLModel_Ri_2023_Pr_6_628 = @(yPlus) (1+yPlus/(ReTau*Sc))./(1/Sc+ ((1-(1.0./(1.0+exp(-(yPlus-L_Sc))))).*(K_Sc.*yPlus).^3.3 + ...
                        (1.0./(1.0+exp(-(yPlus-L_Sc)))).*(K_Re.*yPlus).^3.0)./((K_Re.*yPlus).^2+C.^2) );

ReTau = 830;
Sc = 6;
C = 10.0;
K_Re = 0.4647+2.5714e-6*ReTau;
K_Sc= 0.41;
L_Sc = 10.5*(Sc)^(-0.34);
TLModel_Ri_2023_Pr_6_830 = @(yPlus) (1+yPlus/(ReTau*Sc))./(1/Sc+ ((1-(1.0./(1.0+exp(-(yPlus-L_Sc))))).*(K_Sc.*yPlus).^3.3 + ...
                        (1.0./(1.0+exp(-(yPlus-L_Sc)))).*(K_Re.*yPlus).^3.0)./((K_Re.*yPlus).^2+C.^2) );

ReTau = 1070;
Sc = 6;
C = 10.0;
K_Re = 0.4647+2.5714e-6*ReTau;
K_Sc= 0.41;
L_Sc = 10.5*(Sc)^(-0.34);
TLModel_Ri_2023_Pr_6_1070 = @(yPlus) (1+yPlus/(ReTau*Sc))./(1/Sc+ ((1-(1.0./(1.0+exp(-(yPlus-L_Sc))))).*(K_Sc.*yPlus).^3.3 + ...
                        (1.0./(1.0+exp(-(yPlus-L_Sc)))).*(K_Re.*yPlus).^3.0)./((K_Re.*yPlus).^2+C.^2) );

ReTau = 420;
Sc = 1;
C = 10.0;
K_Re = 0.3785+ReTau*1.75e-4;
K_Sc= 0.41;
L_Sc = 10.5*(Sc)^(-0.34);
TLModel_Ri_2023_Pr_1_420 = @(yPlus) (1+yPlus/(ReTau*Sc))./(1/Sc+ ((1-(1.0./(1.0+exp(-(yPlus-L_Sc))))).*(K_Sc.*yPlus).^3.3 + ...
                        (1.0./(1.0+exp(-(yPlus-L_Sc)))).*(K_Re.*yPlus).^3.0)./((K_Re.*yPlus).^2+C.^2) );

ReTau = 628;
Sc = 1;
C = 10.0;
K_Re = 0.4647+2.5714e-6*ReTau;
K_Sc= 0.41;
L_Sc = 10.5*(Sc)^(-0.34);
TLModel_Ri_2023_Pr_1_628 = @(yPlus) (1+yPlus/(ReTau*Sc))./(1/Sc+ ((1-(1.0./(1.0+exp(-(yPlus-L_Sc))))).*(K_Sc.*yPlus).^3.3 + ...
                        (1.0./(1.0+exp(-(yPlus-L_Sc)))).*(K_Re.*yPlus).^3.0)./((K_Re.*yPlus).^2+C.^2) );



ReTau = 830;
Sc = 1;
C = 10.0;
K_Re = 0.4647+2.5714e-6*ReTau;
K_Sc= 0.41;
L_Sc = 10.5*(Sc)^(-0.34);
TLModel_Ri_2023_Pr_1_830 = @(yPlus) (1+yPlus/(ReTau*Sc))./(1/Sc+ ((1-(1.0./(1.0+exp(-(yPlus-L_Sc))))).*(K_Sc.*yPlus).^3.3 + ...
                        (1.0./(1.0+exp(-(yPlus-L_Sc)))).*(K_Re.*yPlus).^3.0)./((K_Re.*yPlus).^2+C.^2) );

ReTau = 1070;
Sc = 1;
C = 10.0;
K_Re = 0.4647+2.5714e-6*ReTau;
K_Sc= 0.41;
L_Sc = 10.5*(Sc)^(-0.34);
TLModel_Ri_2023_Pr_1_1070 = @(yPlus) (1+yPlus/(ReTau*Sc))./(1/Sc+ ((1-(1.0./(1.0+exp(-(yPlus-L_Sc))))).*(K_Sc.*yPlus).^3.3 + ...
                        (1.0./(1.0+exp(-(yPlus-L_Sc)))).*(K_Re.*yPlus).^3.0)./((K_Re.*yPlus).^2+C.^2) );


ReTau = 420;
Sc = 4;
C = 10.0;
K_Re = 0.3785+ReTau*1.75e-4;
K_Sc= 0.41;
L_Sc = 10.5*(Sc)^(-0.34);
TLModel_Ri_2023_Pr_4_420 = @(yPlus) (1+yPlus/(ReTau*Sc))./(1/Sc+ ((1-(1.0./(1.0+exp(-(yPlus-L_Sc))))).*(K_Sc.*yPlus).^3.3 + ...
                        (1.0./(1.0+exp(-(yPlus-L_Sc)))).*(K_Re.*yPlus).^3.0)./((K_Re.*yPlus).^2+C.^2) );

ReTau = 628;
Sc = 4;
C = 10.0;
K_Re = 0.4647+2.5714e-6*ReTau;
K_Sc= 0.41;
L_Sc = 10.5*(Sc)^(-0.34);
TLModel_Ri_2023_Pr_4_628 = @(yPlus) (1+yPlus/(ReTau*Sc))./(1/Sc+ ((1-(1.0./(1.0+exp(-(yPlus-L_Sc))))).*(K_Sc.*yPlus).^3.3 + ...
                        (1.0./(1.0+exp(-(yPlus-L_Sc)))).*(K_Re.*yPlus).^3.0)./((K_Re.*yPlus).^2+C.^2) );

ReTau = 830;
Sc = 4;
C = 10.0;
K_Re = 0.4647+2.5714e-6*ReTau;
K_Sc= 0.41;
L_Sc = 10.5*(Sc)^(-0.34);
TLModel_Ri_2023_Pr_4_830 = @(yPlus) (1+yPlus/(ReTau*Sc))./(1/Sc+ ((1-(1.0./(1.0+exp(-(yPlus-L_Sc))))).*(K_Sc.*yPlus).^3.3 + ...
                        (1.0./(1.0+exp(-(yPlus-L_Sc)))).*(K_Re.*yPlus).^3.0)./((K_Re.*yPlus).^2+C.^2) );

ReTau = 1070;
Sc = 4;
C = 10.0;
K_Re = 0.4647+2.5714e-6*ReTau;
K_Sc= 0.41;
L_Sc = 10.5*(Sc)^(-0.34);
TLModel_Ri_2023_Pr_4_1070 = @(yPlus) (1+yPlus/(ReTau*Sc))./(1/Sc+ ((1-(1.0./(1.0+exp(-(yPlus-L_Sc))))).*(K_Sc.*yPlus).^3.3 + ...
                        (1.0./(1.0+exp(-(yPlus-L_Sc)))).*(K_Re.*yPlus).^3.0)./((K_Re.*yPlus).^2+C.^2) );

ReTau = 420;
Sc = 2;
C = 10.0;
K_Re = 0.3785+ReTau*1.75e-4;
K_Sc= 0.41;
L_Sc = 10.5*(Sc)^(-0.34);
TLModel_Ri_2023_Pr_2_420 = @(yPlus) (1+yPlus/(Sc*ReTau))./(1/Sc+ ((1-(1.0./(1.0+exp(-(yPlus-L_Sc))))).*(K_Sc.*yPlus).^3.3 + ...
                        (1.0./(1.0+exp(-(yPlus-L_Sc)))).*(K_Re.*yPlus).^3.0)./((K_Re.*yPlus).^2+C.^2) );

ReTau = 628;
Sc = 2;
C = 10.0;
K_Re = 0.4647+2.5714e-6*ReTau;
K_Sc= 0.41;
L_Sc = 10.5*(Sc)^(-0.34);
TLModel_Ri_2023_Pr_2_628 = @(yPlus) (1+yPlus/(Sc*ReTau))./(1/Sc+ ((1-(1.0./(1.0+exp(-(yPlus-L_Sc))))).*(K_Sc.*yPlus).^3.3 + ...
                        (1.0./(1.0+exp(-(yPlus-L_Sc)))).*(K_Re.*yPlus).^3.0)./((K_Re.*yPlus).^2+C.^2) );

ReTau = 830;
Sc = 2;
C = 10.0;
K_Re = 0.4647+2.5714e-6*ReTau;
K_Sc= 0.41;
L_Sc = 10.5*(Sc)^(-0.34);
TLModel_Ri_2023_Pr_2_830 = @(yPlus) (1+yPlus/(Sc*ReTau))./(1/Sc+ ((1-(1.0./(1.0+exp(-(yPlus-L_Sc))))).*(K_Sc.*yPlus).^3.3 + ...
                        (1.0./(1.0+exp(-(yPlus-L_Sc)))).*(K_Re.*yPlus).^3.0)./((K_Re.*yPlus).^2+C.^2) );

ReTau = 1070;
Sc = 2;
C = 10.0;
K_Re = 0.4647+2.5714e-6*ReTau;
K_Sc= 0.41;
L_Sc = 10.5*(Sc)^(-0.34);
TLModel_Ri_2023_Pr_2_1070 = @(yPlus) (1+yPlus/(Sc*ReTau))./(1/Sc+ ((1-(1.0./(1.0+exp(-(yPlus-L_Sc))))).*(K_Sc.*yPlus).^3.3 + ...
                        (1.0./(1.0+exp(-(yPlus-L_Sc)))).*(K_Re.*yPlus).^3.0)./((K_Re.*yPlus).^2+C.^2) );









