
%% ��������
[~, ~, raw] = xlsread('C:\Users\Qinyu\Desktop\�ڶ��׶�\�׺죯ȫ�����ɷַ���.xlsx','��','B51:K91');
raw(cellfun(@(x) ~isempty(x) && isnumeric(x) && isnan(x),raw)) = {''};
raw = raw(:,[1,2,3,4,5,6,7,8,9,10]);

%% �����������
data = reshape([raw{:}],size(raw));

%% ����������������б�������
VarName2 = data(:,1);
VarName3 = data(:,2);
VarName4 = data(:,3);
VarName5 = data(:,4);
VarName6 = data(:,5);
VarName7 = data(:,6);
VarName8 = data(:,7);
VarName9 = data(:,8);
VarName10 = data(:,9);
%VarName11 = double(cellVectors(:,1));
%VarName12 = double(cellVectors(:,2));
%VarName13 = double(cellVectors(:,3));
VarName11 = data(:,10);


%% �����ʱ����
clearvars data raw;

%% ��������
[~, ~, raw] = xlsread('C:\Users\Qinyu\Desktop\�ڶ��׶�\��.xlsx','Sheet1','A2:AO28');

%% �����������
S1 = reshape([raw{:}],size(raw));

% ��׼��
for i =1:27
S1(:,i) = (S1(:,i)-mean(S1(:,i)))/sqrt(var(S1(:,i)));
end

XX = zeros(27,10);
XX(:,1)= S1*VarName2;
XX(:,2)= S1*VarName3;
XX(:,3)= S1*VarName4;
XX(:,4)= S1*VarName5;
XX(:,5)= S1*VarName6;
XX(:,6)= S1*VarName7;
XX(:,7)= S1*VarName8;
XX(:,8)= S1*VarName9;
XX(:,9)= S1*VarName10;
XX(:,10)= S1*VarName11;


%% ��������
[~, ~, raw] = xlsread('C:\Users\Qinyu\Desktop\�ڶ��׶�\2017-2-1-B-1.xls','��2','N3:N29');

%% �����������
YY = reshape([raw{:}],size(raw));

%% �����ʱ����
clearvars raw;

[b,bint,r,rint,stats]= regress(YY,XX);
YY = [YY(1:10) ;YY(12:27)];
XX = [XX(1:10,:) ;XX(12:27,:)];
XX = [XX(:,2:4)  XX(:,6:10)];
%stepwise(XX,YY)
[b,bint,r,rint,stats]= regress(YY,XX);
rcoplot(r,rint)
ttest(r)
jbtest(r)

