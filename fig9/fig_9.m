
% This file plots fig. 9 in [1].

% [1] Haifeng Wu; Lingxu Kong; Yu Zeng; Han Bao; "Resting-state Brain 
% Connectivity via Multivariate EMD in Mild Cognitive Impairment", 
% IEEE Transactions on Cognitive and Developmental Systems, 2021.

% Written by Lingxu Kong, Yunnan Minzu University. 

% CorrMeanImf_MCI.mat £ºIMF connectivity on an MCI group mean level
% 
% CorrMeanImf_NC.mat £ºIMF connectivity on an NC group mean level
%  
% MCI_mean_pearson.mat £ºPearson connectivity on an MCI group mean level 
% 
% NC_mean_pearson.mat £ºPearson connectivity on an NC group mean level 
% 
% MCI_NC_Tpearson.mat £ºMCI(mean)-NC(mean) when connectiviey is Perason correlation
% 
% MCI_NC_index_Q_1.mat£º 
% the values of IMF connectivities MCI(mean)-NC(mean), where MCI(mean)>0 & NC(mean)>0
% 
% LOC1_0.36.mat £º
% the layer for IMF when MCI(mean)>0 & NC(mean)>0£¬& MCI(mean)-NC(mean)>0.36

close all;
clear all;

load CorrMeanImf_MCI.mat
load CorrMeanImf_NC.mat
load MCI_mean_pearson.mat
load NC_mean_pearson.mat
load LOC1_0.36.mat

for i=1:5
    for l=1:length(loc)
        b(l,i)=CorrMeanImf_MCI(loc(l,1),loc(l,2),i);
    end
end

  for l=1:length(loc)
        c(l,1)=MCI_mean(loc(l,1),loc(l,2));
  end
  a=[c,b];
figure(1)
% imagesc(b)
% axis square
h=imagesc(a); 
set(h,'alphadata',~isnan(a));
% title('Q1')
colormap(jet);  
set(gca, 'xTick', [1:1:6]);
set(gca,'XTickLabel',{'0', '1', '2', '3', '4', '5'},'FontSize',14);
xlabel('IMF','FontSize',14)
ylabel('Connectivities','FontSize',14)
title('R_1 (i)','FontSize',14)
for i=1:5
    for l=1:length(loc)
        b(l,i)=CorrMeanImf_NC(loc(l,1),loc(l,2),i);
    end
end

  for l=1:length(loc)
        c(l,1)=NC_mean(loc(l,1),loc(l,2));
  end
  a=[c,b];
figure(2)
% imagesc(b)
% axis square
h=imagesc(a); 
set(h,'alphadata',~isnan(a));
% title('Q1')
colormap(jet);  
set(gca, 'xTick', [1:1:6]);
set(gca,'XTickLabel',{'0', '1', '2', '3', '4', '5'},'FontSize',14);
xlabel('IMF','FontSize',14)
ylabel('Connectivities','FontSize',14)
title('R_2 (i)','FontSize',14)


load('MCI_NC_index_Q_1.mat');
load('LOC1_0.36.mat');
load('MCI_NC_Tpearson.mat')
for i=1:5
    for l=1:length(loc)
        b(l,i)=MCI_NC_index(loc(l,1),loc(l,2),i);
    end
end

  for l=1:length(loc)
        c(l,1)=MCI_NC_Tpearson(loc(l,1),loc(l,2));
  end
  a=[c,b];
figure(3)
h=imagesc(a); 
set(h,'alphadata',~isnan(a));
colormap(jet);  
set(gca, 'xTick', [1:1:6]);
set(gca,'XTickLabel',{'0', '1', '2', '3', '4', '5'},'FontSize',14);
xlabel('IMF','FontSize',14)
ylabel('Connectivities','FontSize',14)
title('R_3 (i)','FontSize',14)
