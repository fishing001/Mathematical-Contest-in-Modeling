%����  ��Ұ�ҵ�һ�ַ�������Ұ����
% viewTable1
%function Xxmax=mymethod1_shiyeyou(cutRatio,R2)

dis= 20000;
R1 = 1200;
%R2 = 1200;
length = 165%70.92*2.78;%2.72
width = 126%70*1.625;
%cutRatio = 0.48;
theta = 90-28.36;
%calculate
theta = theta / 180 * pi;
%%R1 cal
lengthR1 = (length * (1 - cutRatio)) / 2;
beta1 = acos(lengthR1 / R1) + theta;
x1 =  sin(pi - beta1) * R1;
y1 = - cos(pi - beta1) * R1;
z1 = 0;
%%R2 cal
x2 = x1 - cos(2 * (pi / 2 - (beta1 - theta)) + beta1 - (pi / 2)) * (R1 - R2);
y2 = y1 + sin(2 * (pi / 2 - (beta1 - theta)) + beta1 - (pi / 2)) * (R1 - R2);
z2 = 0;

rr = length * cutRatio/2 ;


x0 = x1;
y0 = y1;  %����λ��
z0 = z1; 
R = R1;   %��İ뾶

syms x
syms z
f = sqrt(R^2-(x-x0)^2-(z-z0)^2)+y0;  %Բ�������
%f1 = sqrt(R2^2-(x-x2)^2-(z-z2)^2)+y2;
%ff = R^2-(x-x0)^2-(y-y0)^2;
%plot3(f)

fx = diff(f,x);
fz = diff(f,z);
fy = -1;
n0 = [fx/sqrt(fx^2+fy^2+fz^2),fy/sqrt(fx^2+fy^2+fz^2),fz/sqrt(fx^2+fy^2+fz^2)];



xx1 = -450-600;  %�����е�λ�ã���Ҫ��Ϊ��ת�Ƕȶ�����
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


[X,Z] = meshgrid(linspace(0,length,50),linspace(0,width/2,50));  %�����Ͼ���ȡ��

%�������
S1 = length*width/2;
X=X(:);
Z=Z(:);
X =X*cos(pi/2-theta);
Ya = subs(f,{x,z},{[X],[Z]});   


ba= double(subs(b,{x,f,z},{[X],[Ya],[Z]}));

Yy = dis; %10�������
Xx = (Yy-Ya)./ba(:,2).*ba(:,1)+X;
Zz = (Yy-Ya)./ba(:,2).*ba(:,3)+Z;

Xx=double(Xx);
Zz=double(Zz);
Xxmax1 = double(max(Xx)); %��Ұ��Χ ��10����������
Xxmin1 = double(min(Xx));
Zzmax1 = double(max(Zz)); %��Ұ��Χ ��10����������
Zzmin1 = double(min(Zz));
plot(Xx,Zz,'o')
%����
xx1=xx12;
a = [x-xx1,f-yy1,z-zz1];  %�������
d = sqrt(a(1)^2+a(2)^2+a(3)^2);
a = a/d;
b = a - 2.*(a.*n0).*n0; %�������


[X,Z] = meshgrid(linspace(0,length,50),linspace(0,width/2,50));  %�����Ͼ���ȡ��

%�������
S1 = length*width/2;
X=X(:);
Z=Z(:);
X =X*cos(pi/2-theta);

Ya = subs(f,{x,z},{[X],[Z]});   


ba= double(subs(bb,{x,f,z},{[X],[Ya],[Z]}));

Yy = dis; %10�������
Xx = (Yy-Ya)./ba(:,2).*ba(:,1)+X;
Zz = (Yy-Ya)./ba(:,2).*ba(:,3)+Z;

Xx = double(Xx);
Xxmax2 = double(max(Xx));
Xxmin2 = double(min(Xx));
Zzmax2 = double(max(Zz));
Zzmin2 = double(min(Zz));
Xxmax = max(Xxmax1,Xxmax2);
Xxmin = min(Xxmin1,Xxmin2);
Xxmax=Xxmax-Xxmin;
  %��Ұ��Χ ��10����������
%��������Ұ���ֵ
%Xxmax = max(Xxmax1,Xxmax2);







    




