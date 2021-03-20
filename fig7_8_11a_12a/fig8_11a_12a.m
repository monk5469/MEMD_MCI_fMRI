
% This file plots fig 8, 11a and 12a in [1].
% [1] Haifeng Wu; Lingxu Kong; Yu Zeng; Han Bao; "Resting-state Brain 
% Connectivity via Multivariate EMD in Mild Cognitive Impairment", 
% IEEE Transactions on Cognitive and Developmental Systems, 2021.

% Written by Lingxu Kong, Yunnan Minzu University. 

% edgenum_03_04.mat £º
% the number of the IMF connectivity on group means: MCI-NC >delta  & NC > 0, where delta = from 0.3  to 0.4.
% 
% edgenum_0x.mat £º
% the number of the IMF connectivity on group means: MCI-NC >delta  & NC > 0, where delta = 0.x (x=3 32 34 36 38 4).
% 
% CorrMeanImf_MCI.mat £ºIMF connectivity mean of the MCI group
% 
% CorrMeanImf_NC.mat £ºIMF connectivity mean of the NC group
%   
% CorrMeanImf_MCI_cut_NC.mat £º 
% IMF connectivity mean of the MCI group - IMF connectivity mean of the NC group
% 
% MCI_NC_Q1_0.36.mat£º the value of the IMF connectivity between ROIs, for  MCI(mean)-NC(mean) > 0.36 & NC > 0.
% 
% netdata.mat £º116 ROI net 

close all;
clear all;

load('CorrMeanImf_MCI.mat');
load('CorrMeanImf_NC.mat')
load('CorrMeanImf_MCI_cut_NC.mat')

MCI_NC_index_Q_1=corrtmp;
MCI_Q=CorrMeanImf_MCI;
NC_Q=CorrMeanImf_NC;


data_1=0.36; 
name_1=['data_Q1\MCI_NC_Q1_',num2str(data_1),'.mat'];
name_2=['MCI_NC_Q1_',num2str(data_1)];
name_3=['Edge_num_Q1_',num2str(data_1)];
for locmat=1:5
    for m=1:116
        for n=1:116
            if(MCI_Q(m,n,locmat)<=0||NC_Q(m,n,locmat)<=0)
                MCI_NC_index_Q_1(m,n,locmat)=NaN;% leave the connectivites of MCI>0 & NC>0
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
                   MCI_NC_index_Q_11(m,n)=NaN;% leave the connectivites where MCI>0 & NC>0 & MCI-NC>data1
         end
    end
end

length(find(MCI_NC_index_Q_11>data_1))/2;
save(name_1,'MCI_NC_index_Q_11');
% legends = {'FRO', 'INS', 'LIM', 'OCC', 'PAR', 'SUB', 'TEM','CER','VER'};
legends = {'FRO/30', 'INS/0', 'LIM/2', 'OCC/14', 'PAR/13', 'SUB/9', 'TEM/14','CER/24','VER/4'};
% legends = {'Frontal', 'Insula', 'Limbic', 'Occipital', 'Parietal', 'Subcortical', 'Temporal','Cerebellum','Vermis'};


 lc_netplot('-n', name_1, '-ni',  './netdata.mat','-il',1, '-lg', legends);
figure(1);title('Intrinsic-frequency connectivity:\Delta=0.36','FontSize',14) %fig11a 12a

y=[];
loc=[];
i=1;
for m=1:116
    for n=m:116
        if ~isnan(MCI_NC_index_Q_11(m,n))
           y(i,1)=MCI_Q(m,n,LocMat(m,n));
           y(i,2)=NC_Q(m,n,LocMat(m,n));
           loc(i,1)=m;
           loc(i,2)=n;   
           i=i+1;
        end
    end
end

node_num=unique(loc(:));
nodesize=[1:length(node_num)]';
edge=zeros(length(node_num));
% node_num1=[node_num,nodenum']; %for  brainnet fig11b


for m=1:size(loc,1)
    [m1,n1]=find(node_num==loc(m,1));
    [m2,n2]=find(node_num==loc(m,2));
    edge(nodesize(m1,n1),nodesize(m2,n2))=1;
end
edge=edge'+edge;

% save('edge_0.36.txt','edge','-ascii');  %for  brainnet  fig11b 
%  use BrainNet viewer


figure(3); %fig 8
bar(y);
% legend('MCI','NC','FontSize',16,'NumColumns',2)
legend({'MCI','NC'},'FontSize',16)
set(gca,'FontSize',16)


X=addhead(MCI_NC_index_Q_11); % add head£¬ROI1¡¢ROI2¡­¡­
xlswrite('MCI_NC_index_0.36.xls',X);
