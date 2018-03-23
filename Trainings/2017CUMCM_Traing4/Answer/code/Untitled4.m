%����(kg)
mA = 105*1e-3*7;
mB = 1200;
mP = 10;
mD = 100;
mf = 1000;
%�������ٶ�
g = 9.8;
%����
GB = mB*g;
GP = mP*g;
GD = mD*g;
Gf = mf*g;
GA = mA*g;
%ê�����ܶ� �֣�7.85g/cm3?
pA = 7.85*10^3; 
%���
Vf = 2*pi;
VA = mA/pA;
VP = pi*(1/2*50*1e-3)^2;
VD = pi*(1/2*30*1e-2)^2;
%��ˮ�ܶ�
pw = 1.025*10^3;
%����
ff = pw*g*Vf;
fA = pw*g*VA;
fP = pw*g*VP;
fD = pw*g*VD;
%ֱ��
df = 2;
Lf = 2;
%����
lA = 105*1e-3;
lP = 1;
lD = 1;
% for h = 0:0.1:2;
%Swind = df*(Lf-h);
%Swater = df*h;
v = 12;%����
%u = 1 %ˮ��
%Fwind = 0.625*Swind*v^2;
%Fwater = 374*Swater*u^2;
PA = fA - GA;
PP = fP - GP;
PD = fD - GD;
Pf = ff - Gf;
PB = -GB;
Result = [];
 %for h = 0:0.1:2
 h= 0.743596
     Swind = df*(Lf-h);
      ff = pw*g*h*pi;
     Pf = ff - Gf;
     Fwind = 0.625*Swind*(v^2);
     n= 210;
     i = 1:n;
     AA=Fwind;
     BB=((210-i+1/2)*PA+PB+PD+4*PP+Pf);
     www = AA./BB;
     A = sum(lA*cos(atan(www)));








 
 
 
 

