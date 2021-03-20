
% This file is a demo, which plots fig. 13 in [1]. 
% Here, the demo gives the case of delta=0.25.

% The data loading A_B_XXX.mat is decomposed by noise-assisted MEMD [2], 
%  where 
%   A   is the number of channels, 
%   B   is the number of IMFs,
%   XXX is
%     MC when a MC group(mean), 
%     NC when a NC group(mean),
%     MCIminusNC when MCI(mean)-NC(mean),
% respectively.
% The first step for the data A_B_XXX.mat, adding noise can be seen in 
% add_noise.m in this directory. The second step, MEMD algorithm can be 
% refered to the python software, whose address is 
% https://github.com/mariogrune/MEMD-Python-.

% [1] Haifeng Wu; Lingxu Kong; Yu Zeng; Han Bao; "Resting-state Brain 
% Connectivity via Multivariate EMD in Mild Cognitive Impairment", 
% IEEE Transactions on Cognitive and Developmental Systems, 2021.

% [2] Ur Rehman, N., & Mandic, D. e., ¡°Filter Bank eroperty of Multivariate 
% Empirical Mode Decomposition,¡± IEEE Transactions on Signal erocessing, 
% vol. 59, no. 5, pp. 2421¨C2426, May. 2011.


% Written by Lingxu Kong, Yunnan Minzu University.



close all;
clear all;
channelnum=200;%The number of channels 
imf=7;% the number of imfs
data_1=0.25;% Threshold, i.e. delta

load(['channel\',num2str(channelnum),'_',num2str(imf),'_MCI.mat']);
load(['channel\',num2str(channelnum),'_',num2str(imf),'_NC.mat'])
load(['channel\',num2str(channelnum),'_',num2str(imf),'_MCIminusNC.mat'])

MCI_NC_index_Q_1=corrtmp;
MCI_Q=CorrMeanImf_MCI;
NC_Q=CorrMeanImf_NC;


name_1=['data\MCI_NC_channel',num2str(channelnum),'_imf',num2str(imf),'_',num2str(data_1),'.mat'];
name_2=['MCI_NC_Q_',num2str(data_1)];
name_3=['Edge_num_Q_',num2str(data_1)];
for locmat=1:imf
    for m=1:116
        for n=1:116
            if(MCI_Q(m,n,locmat)<=0||NC_Q(m,n,locmat)<=0)
                MCI_NC_index_Q_1(m,n,locmat)=NaN;
            end
        end
    end
end

for m=1:116
    for n=1:116
        [ValMat(m,n), LocMat(m,n)]=max(MCI_NC_index_Q_1(m,n,:));
    end
end

for m=1:116
    for n=1:116
        MCI_NC_index_Q_11(m,n)=MCI_NC_index_Q_1(m,n,LocMat(m,n));
        if MCI_NC_index_Q_11(m,n)<data_1
                   MCI_NC_index_Q_11(m,n)=NaN;
         end
    end
end

length(find(MCI_NC_index_Q_11>data_1))/2;
save(name_1,'MCI_NC_index_Q_11');
% legends = {'Frontal', 'Insula', 'Limbic', 'Occipital', 'Parietal', 'Subcortical', 'Temporal','Cerebellum','Vermis'};
legends = {'FRO', 'INS', 'LIM', 'OCC', 'PAR', 'SUB', 'TEM','CER','VER'};
lc_netplot('-n', name_1, '-ni',  './netdata.mat','-il',1, '-lg', legends);



figure(1);title('NA-Intrinsic-frequency connectivity:\Delta=0.25 Ch=200','FontSize',14)


