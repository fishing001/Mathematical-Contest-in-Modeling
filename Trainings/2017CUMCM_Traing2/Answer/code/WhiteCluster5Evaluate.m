

[~, ~, raw] = xlsread('C:\Users\Qinyu\Desktop\�ڶ��׶�\���������ȡ��������.xls','��ư�����','B2:AE29');

%% �����������
S1 = reshape([raw{:}],size(raw));

%% �����ʱ����
clearvars raw;
%% ��������
[~, ~, raw] = xlsread('C:\Users\Qinyu\Desktop\�ڶ��׶�\��ư����Ѿ���.xlsx','������1','I3:L30');

%% �����������
data = reshape([raw{:}],size(raw));

%% ����������������б�������
VarName1 = data(:,1);
VarName2 = data(:,2);
VarName3 = data(:,3);
VarName4 = data(:,4);

%% �����ʱ����
clearvars data raw;

A= find(VarName2==1);
B= find(VarName2==2);
C= find(VarName2==3);
D= find(VarName2==4);
I= find(VarName2==5);

E=S1(A,:);
F=S1(B,:);
G=S1(C,:);
H=S1(D,:);
K=S1(I,:);

   L1= size(E,1);
   L2= size(F,1);
   L3= size(G,1);
   L4= size(H,1);
   L5= size(K,1);

O1=mean(E); %��������
O2=mean(F);
O3=mean(G);
O4=mean(H);
O5=mean(K);

EE = sum((O1-O2).^2)+sum((O1-O3).^2)+sum((O1-O4).^2)+sum((O1-O5).^2)+sum((O2-O3).^2)+sum((O2-O4).^2)+sum((O2-O5).^2)+sum((O3-O4).^2)+sum((O3-O5).^2)+sum((O4-O5).^2);
   DD1 = 0;
   DD2 = 0;
   DD3 = 0;
     DD4 = 0;
     DD5 = 0;
for i =1:L1
    DD1 =DD1+sum( E(i,:)-O1).^2;
end
for i =1:L2
    DD2 =DD2+sum( F(i,:)-O2).^2;
end
for i =1:L3
    DD3 =DD3+sum( G(i,:)-O3).^2;
end
for i =1:L4
    DD4 =DD4+sum( H(i,:)-O4).^2;
end
for i =1:L5
    DD5 =DD5+sum( K(i,:)-O5).^2;
end
DD = DD1+DD2+DD3+DD4+DD5;
SS = EE/DD





