% This file plots histograms of the number of the intrinsic frequency connectivity on
% group means: MCI-NC >delta  & NC > 0, where  delta = from 0.3 to 0.4.

% Written by Lingxu Kong, Yunnan Minzu University. 

% edgenum_03_04.mat £º
% the number of the IMF connectivity on group means: MCI-NC >delta  & NC > 0, 
% where delta = from 0.3  to 0.4.
clear all;
close all;

load edgenum_03_04.mat;

figure(1);
bar(A');
set(gca, 'xTick', [1:1:9]);
set(gca,'XTickLabel',{'FRO', 'INS', 'LIM', 'OCC', 'PAR', 'SUB', 'TEM','CER','VER'},'FontSize',14)
% legend('\Delta=0.30','\Delta=0.32','\Delta=0.34','\Delta=0.36','\Delta=0.38','\Delta=0.40','FontSize',14,'NumColumns',2)
legend({'\Delta=0.30','\Delta=0.32','\Delta=0.34','\Delta=0.36','\Delta=0.38','\Delta=0.40'},'FontSize',10)

