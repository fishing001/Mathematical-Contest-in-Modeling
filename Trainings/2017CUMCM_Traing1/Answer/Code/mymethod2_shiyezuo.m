%�ڶ��ַ�������Ұ����
% viewTable2
%function Xxmax=mymethod2_shiyezuo(cutRatio,R2)

dis = 10000;
R1 = 1260;
R2 = 500;
length = 70.92*2.78;%2.72
width = 70*1.625;
cutRatio = 0.2;  
theta = 90-17.6;

rr = length * cutRatio ;

%calculate
theta = theta / 180 * pi;
%%R1 cal
lengthR1 = (length * (1 - cutRatio)) / 2;
beta1 = acos(lengthR1 / R1) + theta;
x1 =  sin(pi - beta1) * R1;
y1 = - cos(pi - beta1) * R1;
z1 = 0;
%%R2 cal

tempLehgth  = sqrt((R2 ^ 2) - (((length * cutRatio)/2)^2));


x2 = (length - (length * cutRatio)/2) * sin(theta) + cos(pi / 2 - (beta1 - theta) + beta1 - (pi / 2)) * tempLehgth;
y2 = (length - (length * cutRatio)/2) * cos(theta) - sin(pi / 2 - (beta1 - theta) + beta1 - (pi / 2)) * tempLehgth;
z2 = 0;
%%end point cal

x0 = x1;
y0 = y1;  %����λ��
z0 = z1; 
R = R1;   %��İ뾶

%rr = length * cutRatio/2 ;


syms x
syms z
f = sqrt(R^2-(x-x0)^2-(z-z0)^2)+y0;  %Բ�������
f1 = sqrt(R2^2-(x-x2)^2-(z-z2)^2)+y2;  %Բ�������
%ff = R^2-(x-x0)^2-(y-y0)^2;
%plot3(f)

fx = diff(f,x);
fz = diff(f,z);
fy = -1;
n0 = [fx/sqrt(fx^2+fy^2+fz^2),fy/sqrt(fx^2+fy^2+fz^2),fz/sqrt(fx^2+fy^2+fz^2)];

%���1
fx1 = diff(f1,x);
fz1 = diff(f1,z);
fy1 = -1;
n01 = [fx1/sqrt(fx1^2+fy1^2+fz1^2),fy1/sqrt(fx1^2+fy1^2+fz1^2),fz1/sqrt(fx1^2+fy1^2+fz1^2)];

xx1 = -450;  %�����е�λ�ã���Ҫ��Ϊ��ת�Ƕȶ�����
yy1 = 730;
zz1 = 0;
%��Ұ��Ҫ�������ۿ��� +-32.5
xx11 = xx1-32.5;
xx12 = xx1+32.5;
%����
%theta1 = atan(abs(yy1/xx1));
%theta2 = theta1-(pi/2-theta);
%aaa = sqrt(xx1^2+yy1^2);
%xx1 = - aaa*cos(theta2);
%yy1 =  aaa*sin(theta2);

%����
xx1=xx11;
a = [x-xx1,f-yy1,z-zz1];  %�������
d = sqrt(a(1)^2+a(2)^2+a(3)^2);
a = a/d;
b = a - 2.*(a.*n0).*n0; %�������

%���2
a1 = [x-xx1,f1-yy1,z-zz1];  %�������
d1 = sqrt(a1(1)^2+a1(2)^2+a1(3)^2);
a1 = a1/d1;
bb = a1 - 2.*(a1.*n01).*n01; %�������


[X,Z] = meshgrid(linspace(0,length,50),linspace(0,width/2,50));  %�����Ͼ���ȡ��

%�������
S1 = length*width/2;
X=X(:);
Z=Z(:);
X =X*cos(pi/2-theta);
A = find(((X-x2).^2.+(Z-z2).^2)<rr^2);  %��y���򿴹�ȥС��뾶18

Xa = X(A);
Za = Z(A);
Ya = subs(f1,{x,z},{[Xa],[Za]});   


ba= double(subs(bb,{x,f1,z},{[Xa],[Ya],[Za]}));

Yy = dis; %10�������
Xxa = (Yy-Ya)./ba(:,2).*ba(:,1)+Xa;
Zza = (Yy-Ya)./ba(:,2).*ba(:,3)+Za;

X(A)=[];
Z(A)=[];
Y = subs(f,{x,z},{[X],[Z]});   

b1= subs(b,{x,f,z},{[X],[Y],[Z]});
Yy = dis; %10�������
Xx = (Yy-Y)./b1(:,2).*b1(:,1)+X;
Xx = [Xx ;Xxa];

Xxmax1 = double(max(Xx));  %��Ұ��Χ ��10����������
Xxmin1 = double(min(Xx));

%����
xx1=xx12;
a = [x-xx1,f-yy1,z-zz1];  %�������
d = sqrt(a(1)^2+a(2)^2+a(3)^2);
a = a/d;
b = a - 2.*(a.*n0).*n0; %�������

%���2
a1 = [x-xx1,f1-yy1,z-zz1];  %�������
d1 = sqrt(a1(1)^2+a1(2)^2+a1(3)^2);
a1 = a1/d1;
bb = a1 - 2.*(a1.*n01).*n01; %�������

[X,Z] = meshgrid(linspace(0,length,50),linspace(0,width/2,50));  %�����Ͼ���ȡ��

%�������
S1 = length*width/2;
X=X(:);
Z=Z(:);
X =X*cos(pi/2-theta);
A = find(((X-x2).^2.+(Z-z2).^2)<rr^2);  %��y���򿴹�ȥС��뾶18

Xa = X(A);
Za = Z(A);
Ya = subs(f1,{x,z},{[Xa],[Za]});   


ba= double(subs(bb,{x,f1,z},{[Xa],[Ya],[Za]}));

Yy = dis; %10�������
Xxa = (Yy-Ya)./ba(:,2).*ba(:,1)+Xa;
%Zza = (Yy-Ya)./ba(:,2).*ba(:,3)+Za;

X(A)=[];
Z(A)=[];
Y = subs(f,{x,z},{[X],[Z]});   

b1= subs(b,{x,f,z},{[X],[Y],[Z]});
Yy = dis; %10�������
Xx = (Yy-Y)./b1(:,2).*b1(:,1)+X;
Xx = [Xx ;Xxa];

Xxmax2 = double(max(Xx)); 
Xxmin2 = double(min(Xx)); %��Ұ��Χ ��10����������
%��������Ұ���ֵ
Xxmax = max(Xxmax1,Xxmax2);
Xxmin = max(Xxmin1,Xxmin2);
Xxmax=Xxmax-Xxmin;







    




