
% This file plots Pearson correlation matrix on a MCI and a NC group mean level,  
% where MCI_Pearson.mat and NC_Pearson.mat is computed from, ROI data in 
% directory  'data\ROI_data' and performing Pearson correlation.

clear all;
close all;
% legends = {'Frontal', 'Insula', 'Limbic', 'Occipital', 'Parietal', 'Subcortical', 'Temporal','Cerebellum','Vermis'};
legends = {'FRO', 'INS', 'LIM', 'OCC', 'PAR', 'SUB', 'TEM','CER','VER'};
method=('Pearson');
nc=['./NC_',method,'.mat'];
mci=['./MCI_',method,'.mat'];

figure(1)
 lc_netplot('-n', nc, '-ni',  './netdata.mat','-il',1, '-lg', legends);
  axis square  
  colormap(jet);  
  caxis([-1,1]);  
  Tname1=['NC group: ',method];
  colorbar('Position',...
    [0.165476217448797 0.230952344988906 0.022023782551203 0.650000035963475],'FontSize',10);
  title(Tname1,'Interpreter','none','FontSize',14);

figure(2)
 lc_netplot('-n', mci, '-ni',  './netdata.mat','-il',1, '-lg', legends);
  axis square  
  colormap(jet);  

  caxis([-1,1]);  
  Tname2=['MCI group: ',method];
  title(Tname2,'Interpreter','none','FontSize',14);
colorbar('Position',...
    [0.165476217448797 0.230952344988906 0.022023782551203 0.650000035963475],'FontSize',10);

  
