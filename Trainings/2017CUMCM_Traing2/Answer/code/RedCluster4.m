%% ������ӱ���е�����
% ���ڴ����µ��ӱ�������ݵĽű�:
%
%    ������: C:\Users\Qinyu\Desktop\�ڶ��׶�\��ƺ����Ѿ���.xlsx
%    ������: ������1
%
% Ҫ��չ�����Թ�����ѡ�����ݻ��������ӱ��ʹ�ã������ɺ���������ű���

% �� MATLAB �Զ������� 2017/08/22 10:00:18

%% ��������
[~, ~, raw] = xlsread('C:\Users\Qinyu\Desktop\�ڶ��׶�\��ƺ����Ѿ���.xlsx','������1','E3:H29');

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
E=VarName4(A)
F=VarName4(B)
G=VarName4(C)
H=VarName4(D)

mean(E)
mean(F)
mean(G)
mean(H)
