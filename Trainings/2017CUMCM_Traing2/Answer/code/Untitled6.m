

%% ��������
[~, ~, raw] = xlsread('C:\Users\Qinyu\Desktop\�ڶ��׶�\���Ѿ�.xls','���Ѿ�','C3:K29');

%% �����������
data = reshape([raw{:}],size(raw));

%% ����������������б�������
V1 = data(:,1);
V2 = data(:,2);
V3 = data(:,3);
V4 = data(:,4);
V5 = data(:,5);
V6 = data(:,6);
V7 = data(:,7);
V8 = data(:,8);
V9 = data(:,9);

%% �����ʱ����
clearvars data raw;