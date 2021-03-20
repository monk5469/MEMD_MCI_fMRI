% This file plots fig. 10 in [1].

% [1] Haifeng Wu; Lingxu Kong; Yu Zeng; Han Bao; "Resting-state Brain 
% Connectivity via Multivariate EMD in Mild Cognitive Impairment", 
% IEEE Transactions on Cognitive and Developmental Systems, 2021.

% Written by Lingxu Kong, Yunnan Minzu University. 

% imf_MCI_19.mat£º IMF ROI by MEMD of Subject No. 19 in the MCI group
% 
% imf_NC_23.mat£ºIMF ROI by MEMD of Subject No. 23 in the NC group
% 
% MCI_19.mat£ºROI series of Subject No. 19 in the MCI group
% 
% NC_23.mat£ºROI series of Subject No. 23in the NC group

close all;
clear all;

load('imf_MCI_19.mat');
load('imf_NC_23.mat');
load('MCI_19.mat');
load('NC_23.mat');

num1=57;
num2=98; %No. of ROI 


figure(1);%fig10 a
NC_Pearson_num1=NC_30(:,num1);
NC_Pearson_num2=NC_30(:,num2);
data(1,2)=corr(NC_Pearson_num1,NC_Pearson_num2);
subplot(2,6,1)
plot(NC_Pearson_num1);
hold on
plot(NC_Pearson_num2);
title('NC: IMF 0')

MCI_Pearson_num1=MCI_30(:,num1);
MCI_Pearson_num2=MCI_30(:,num2);
data(1,1)=corr(MCI_Pearson_num1,MCI_Pearson_num2);

subplot(2,6,7)
plot(MCI_Pearson_num1);
hold on
plot(MCI_Pearson_num2);
title('MCI: IMF 0')

for i=1:5
     imf_NC_num1=squeeze(imf_NC(i,num1,:));
     imf_NC_num2=squeeze(imf_NC(i,num2,:));
     data(i+1,1)=corr(imf_NC_num1,imf_NC_num2);
     
    subplot(2,6,i+1)
    plot(imf_NC_num1);
    hold on
    plot(imf_NC_num2);
    name1=['NC: IMF ',num2str(i)];
    title(name1)
     
     
     imf_MCI_num1=squeeze(imf_MCI(i,num1,:));
     imf_MCI_num2=squeeze(imf_MCI(i,num2,:));
     data(i+1,2)=corr(imf_MCI_num1,imf_MCI_num2);
       
     subplot(2,6,i+7)
    plot(imf_MCI_num1);
    hold on
    plot(imf_MCI_num2);
    name2=['MCI: IMF ',num2str(i)];
    title(name2)
end

figure(2);%fig10 b
bar(data);
set(gca, 'xTick', [1:1:6]);
set(gca,'XTickLabel',{'0', '1', '2', '3', '4', '5'},'FontSize',14);
xlabel('IMF','FontSize',14)
title('ROI 57-ROI 98','FontSize',12)
legend({'MCI','NC'},'FontSize',12)

set(gca,'FontSize',14)
axis([0 7 -1 1.1])   

